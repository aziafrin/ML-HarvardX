{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "64eb3496",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-07-02T07:06:28.587023Z",
     "iopub.status.busy": "2022-07-02T07:06:28.585026Z",
     "iopub.status.idle": "2022-07-02T07:06:32.108258Z",
     "shell.execute_reply": "2022-07-02T07:06:32.106343Z"
    },
    "papermill": {
     "duration": 3.53157,
     "end_time": "2022-07-02T07:06:32.111215",
     "exception": false,
     "start_time": "2022-07-02T07:06:28.579645",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    lift\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(caret)\n",
    "library(dslabs)\n",
    "data(heights)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "df4f1d09",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-02T07:06:32.151367Z",
     "iopub.status.busy": "2022-07-02T07:06:32.119018Z",
     "iopub.status.idle": "2022-07-02T07:06:32.165791Z",
     "shell.execute_reply": "2022-07-02T07:06:32.164074Z"
    },
    "papermill": {
     "duration": 0.053951,
     "end_time": "2022-07-02T07:06:32.168264",
     "exception": false,
     "start_time": "2022-07-02T07:06:32.114313",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# define the outcome and predictors\n",
    "y <- heights$sex\n",
    "x <- heights$height"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "e40ab1f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-02T07:06:32.177167Z",
     "iopub.status.busy": "2022-07-02T07:06:32.175699Z",
     "iopub.status.idle": "2022-07-02T07:06:32.201085Z",
     "shell.execute_reply": "2022-07-02T07:06:32.199331Z"
    },
    "papermill": {
     "duration": 0.032368,
     "end_time": "2022-07-02T07:06:32.203518",
     "exception": false,
     "start_time": "2022-07-02T07:06:32.171150",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# generate training and test sets\n",
    "set.seed(2223333) # if using R 3.5 or earlier, remove the sample.kind argument\n",
    "test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)\n",
    "test_set <- heights[test_index, ]\n",
    "train_set <- heights[-test_index, ]\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b1111df7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-02T07:06:32.214344Z",
     "iopub.status.busy": "2022-07-02T07:06:32.212831Z",
     "iopub.status.idle": "2022-07-02T07:06:32.228794Z",
     "shell.execute_reply": "2022-07-02T07:06:32.227086Z"
    },
    "papermill": {
     "duration": 0.023071,
     "end_time": "2022-07-02T07:06:32.231316",
     "exception": false,
     "start_time": "2022-07-02T07:06:32.208245",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# guess the outcome\n",
    "y_hat <- sample(c(\"Male\", \"Female\"), length(test_index), replace = TRUE)\n",
    "y_hat <- sample(c(\"Male\", \"Female\"), length(test_index), replace = TRUE) %>% \n",
    "  factor(levels = levels(test_set$sex))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "6aecf06a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-02T07:06:32.240384Z",
     "iopub.status.busy": "2022-07-02T07:06:32.238652Z",
     "iopub.status.idle": "2022-07-02T07:06:32.301895Z",
     "shell.execute_reply": "2022-07-02T07:06:32.300267Z"
    },
    "papermill": {
     "duration": 0.069836,
     "end_time": "2022-07-02T07:06:32.304041",
     "exception": false,
     "start_time": "2022-07-02T07:06:32.234205",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.506666666666667"
      ],
      "text/latex": [
       "0.506666666666667"
      ],
      "text/markdown": [
       "0.506666666666667"
      ],
      "text/plain": [
       "[1] 0.5066667"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>sex</th><th scope=col>mean(height)</th><th scope=col>sd(height)</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Female</td><td>64.93942</td><td>3.760656</td></tr>\n",
       "\t<tr><td>Male  </td><td>69.31475</td><td>3.611024</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " sex & mean(height) & sd(height)\\\\\n",
       " <fct> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Female & 64.93942 & 3.760656\\\\\n",
       "\t Male   & 69.31475 & 3.611024\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| sex &lt;fct&gt; | mean(height) &lt;dbl&gt; | sd(height) &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| Female | 64.93942 | 3.760656 |\n",
       "| Male   | 69.31475 | 3.611024 |\n",
       "\n"
      ],
      "text/plain": [
       "  sex    mean(height) sd(height)\n",
       "1 Female 64.93942     3.760656  \n",
       "2 Male   69.31475     3.611024  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.793333333333333"
      ],
      "text/latex": [
       "0.793333333333333"
      ],
      "text/markdown": [
       "0.793333333333333"
      ],
      "text/plain": [
       "[1] 0.7933333"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# compute accuracy\n",
    "mean(y_hat == test_set$sex)\n",
    "heights %>% group_by(sex) %>% summarize(mean(height), sd(height))\n",
    "y_hat <- ifelse(x > 62, \"Male\", \"Female\") %>% factor(levels = levels(test_set$sex))\n",
    "mean(y == y_hat)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "b26ea9fc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-02T07:06:32.313585Z",
     "iopub.status.busy": "2022-07-02T07:06:32.312206Z",
     "iopub.status.idle": "2022-07-02T07:06:32.815971Z",
     "shell.execute_reply": "2022-07-02T07:06:32.814239Z"
    },
    "papermill": {
     "duration": 0.511035,
     "end_time": "2022-07-02T07:06:32.818418",
     "exception": false,
     "start_time": "2022-07-02T07:06:32.307383",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.822857142857143"
      ],
      "text/latex": [
       "0.822857142857143"
      ],
      "text/markdown": [
       "0.822857142857143"
      ],
      "text/plain": [
       "[1] 0.8228571"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "64"
      ],
      "text/latex": [
       "64"
      ],
      "text/markdown": [
       "64"
      ],
      "text/plain": [
       "[1] 64"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.83047619047619"
      ],
      "text/latex": [
       "0.83047619047619"
      ],
      "text/markdown": [
       "0.83047619047619"
      ],
      "text/plain": [
       "[1] 0.8304762"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nnqtcubL9ttlsvn79uhOS3zO9Xm82mwuy0ptDbd++ffz48Rs2bLDfDQ8PHzJkSJ8+fcxmc3Z2\ndu6Crk2bNm3atKn9ttPeWLPZbDAYcnJyWH03H76+vtnZ2awIejs6nc6+OzM9PT3/X2HdSIkS\nJVatWhUZGfnRRx/98ccfDRo0yL0OXnx8/L59++Li4lauXPnoo48W8A80GAxGozE9Pd2hsd2a\nj4+PXq/Pzs7OzMxUncV1+fn5ZWZm5uTkqA7iovR6vY+Pj4ikpaU5er+mzWYLCAi43aPOKHZG\n/5oim4+lZ4eb/yp2J9Kzg+r+Y19l0sGZx67rPh/UtoheE5FHm3QftGLdnGk7X57+nP0J9evX\nr1+/vv22W1x5wmw2K/xOumPHjpiYmLVr19rvli1b9tVXX+3Zs6fJZLJara7wLV6v1xsMBhcJ\n47LMZrPFYqH73o7BYLAXu8zMTHe58kQBDR8+/F//+ldERIT9wjD22mr/aXHt2rWIiIhNmzYV\ncG+u2WzW6/V80PJhMpnsxY53KR/2YsfvmbdjMpnsxS49Pd0JA+t8ip0zdqv6BDcqbdKv2XrR\nfjfr+v6d1yyPNwm78Tl6s4/YslJy/v6dOykjW282OyGeh9m2bVubNm1atGhhb3Xh4eFRUVE7\nd+7s168fp0QAbqR+/foNGjS4tb1ZrdYjR44cPXpUSSoALs4py51opjfaVx05750fSr35cNGs\n76ZP8ivVuHvZABE59fXnm9KCenVvGVy1f7WAvW/9d+qrLz9Xwjfn120rFiRYukXXckY8T7Ft\n27bIyMiffvrJfjc8PHzYsGGdO3emzwFu6vLly5qW9xW94+Pjq1Wr5vxIAFyckxYortTpg4GZ\nkxdFj03M0B58tMEH7/W17yo8t37V90lle3VvqTMUe2/GuHmffD5vyrjEdH3Z8pX6vT29eUUW\nsSuQ7du3f/zxx1Q6wMPkc3odZ7kCyJOzLimm6Zv2eL1pj5s315uxsN7/v20KqtJv1PtOyuMp\ndu7cOWXKlJuOpevRo4eZKTbg/po2bfr999/ftFGn0wUHBz/22GNKIgFwcU67ViwKGZUO8Hgd\nOnRYsGDB7t27bxzI2my2yMhIVlwDkCeKnfuh0gFewmg0Ll26dPLkybNnz05NTbVv9Pf3b9y4\nsdpgAFwWiw26k507d77yyivNmze3t7oyZcqMGzfu559/7tevH60O8Eh+fn5vvfXW6dOnf/nl\nl7Vr1+p0utTUVBe/9A4AhSh27mHXrl23VrodO3ZQ6QAvUbp06Vq1ajVr1kxEZsyYwYprAPJE\nsXN19kr34osvUukAjBw5UtO0y5cvL1iwQHUWAK6IYue6qHQAblKzZs1GjRqJSExMDNe/AnAr\nip0rotIBuJ2RI0eKyJ9//vnll1+qzgLA5VDsXAuVDkD+nnjiibp164rIlClTLBaL6jgAXAvF\nzlVQ6QAU0IgRI0Tk7NmzS5cuVZ0FgGuh2KlHpQNwV+rVq/fUU0+JSFRUVHZ2tuo4AFwIxU4l\nKh2AezN8+HAR+f3335cvX646CwAXwpUn1Ni1a9fkyZNzrx5RpkyZgQMHcvUIAAXUuHHjWrVq\n7du3Lyoqqm3btjodv6UDEGGPnfOxlw5AoXjttddE5Pjx4ytXrlSdBYCrYI+d89y0l6548eID\nBgzo378/fQ7APXjxxRerV6/+66+/Tpo0qXnz5pqmqU4EQD322DnDTXvpihcvPmbMmH379g0d\nOpRWB+DeaJo2bNgwETl06NAPP/ygOg4Al0Cxc6w8K93evXupdADuX6tWrSpVqiQikyZNUp0F\ngEug2DnK9u3bb6x0oaGhuZXOx8dHdToAnkCv19uPtNuzZ8+mTZtUxwGgHsWu8O3evbtz587P\nPPPMjZXOPnil0gEoXB06dHjggQdEJCoqSnUWAOpR7ArT7t27X3nllRdeeGH16tVCpQPgeHq9\nfvDgwSKybdu2n3/+WXUcAIpR7ApHbqXLPZbuww8/pNIBcIIuXbqEh4cLO+0AUOzu302Vzr6X\n7uDBg6NGjaLSAXACo9E4cOBAEdmwYcOuXbtUxwGgEsXu3uVZ6dhLB8D5unXrFhYWJiIxMTGq\nswBQiWJ3L6h0AFyK2Wzu37+/iKxZs+aXX35RHQeAMlx5Im8ZGRlLly49dOiQj49PrVq1WrRo\nYb8U4+7du6Ojo3OvHhEaGvrqq6/269ePPgdArd69e0+bNi0xMTEmJmbOnDmq4wBQg2KXh127\ndkVERJw/f17TNJvNJiI1a9Z84403Fi5cuG7dOvsWKh0Al+Ln59evX78PP/zw+++/P3LkSLVq\n1VQnAqAAo9ibJScnv/zyywkJCSJi73AicujQoR49eqxdu9ZmszF4BeCa+vbtGxwcbLVap06d\nqjoLADUodjdbunRpcnKy1Wq9caO94YWEhIwfP37//v1UOgAuqEiRIn369BGRb7/99vTp06rj\nAFCAYnezI0eOaJqW50PDhw/v27cv13gF4LL69+8fEBCQnZ09ZcoU1VkAKECxu5nRaLzdQ35+\nfs5MAgB3q2jRor169RKRxYsXx8fHq44DwNkodjf717/+lXto3U1q167t5DAAcLdeffVVX1/f\nrKys6dOnq84CwNkodjdr1apV5cqV7Yub3KhFixacZQbA9RUvXrxr164ismDBggsXLqiOA8Cp\nKHY3M5lMS5YsadSoUe4WTdO6des2bdo0hakAoOAGDx5sMpksFsvMmTNVZwHgVKxjl4cyZcos\nWrTo0KFD9gWKH3vssQoVKqgOBQAFVbp06S5dunz22Wfz5s174403ypUrpzoRACdhj91t1ahR\no3Pnzm3atKHVAXA7w4YNM5lM6enpM2bMUJ0FgPNQ7ADAA5UtW/all14SkdjY2CtXrqiOA8BJ\nKHYA4JlGjBhhMBiuXbvGIcKA96DYAYBneuCBB1q1aiUiU6ZMuXr1quo4AJyBYgcAHmvEiBE6\nnS4lJSUuLk51FgDOQLEDAI9VpUqV5s2bi8iMGTOuX7+uOg4Ah6PYAYAnGzVqlKZpSUlJCxYs\nUJ0FgMNR7ADAkz3yyCPPP/+8iEydOjUjI0N1HACORbEDAA/33//+V0QuXrz4xRdfqM4CwLEo\ndgDg4Z588sn69euLSExMjMViUR0HgANR7ADA840YMUJEzp07t2TJEtVZADgQxQ4APN8zzzzz\n9NNPi8jkyZOzs7NVxwHgKBQ7APAKw4cPF5Hff/992bJlqrMAcBSKHQB4hWeffbZWrVoiEh0d\nbbVaVccB4BAUOwDwFvaddsePH//f//6nOgsAh6DYAYC3eP755x955BERmTRpks1mUx0HQOGj\n2AGAt9A0bejQoSJy+PDhtWvXqo4DoPBR7ADAi7Rs2bJq1aoiEhUVpToLgMJHsQMAL6LT6YYM\nGSIie/fu3bBhg+o4AAoZxQ4AvEu7du0qVqwoIhMmTFCdBUAho9gBgHfR6/X2nXa7du3avn27\n6jgAChPFDgC8TqdOncLDw4Uj7QCPQ7EDAK9jNBoHDhwoIhs3bty5c6fqOAAKDcUOALxRt27d\nwsLCRGTKlCmqswAoNBQ7APBGZrP51VdfFZG1a9f+8ssvquMAKBwUOwDwUj179gwNDRWRyZMn\nq84CoHBQ7ADAS/n5+fXv319E/ve//x05ckR1HACFgGIHAN6rT58+wcHBNpuNI+0Az0CxAwDv\nVaRIkYiICBFZtmzZb7/9pjoOgPtFsQMAr9avX7+AgICcnJyYmBjVWQDcL4odAHi1okWL9u7d\nW0SWLFnyxx9/qI4D4L5Q7ADA2w0aNMjf3z8rK2vatGmqswC4LxQ7APB2ISEhXbt2FZGFCxde\nuHBBdRwA945iBwCQIUOG+Pj4WCyW6dOnq84C4N5R7AAAUrJkyS5duojIvHnz/vzzT9VxANwj\nih0AQERk6NChJpMpMzMzNjZWdRYA94hiBwAQESlbtmz79u1F5NNPP01KSlIdB8C9oNgBAP4y\nfPhwg8GQlpY2e/Zs1VkA3AuKHQDgLxUqVGjdurWIxMbGpqSkqI4D4K5R7AAAfxsxYoROp7t6\n9WpcXJzqLADuGsUOAPC3hx566MUXXxSRmTNnXr9+XXUcAHeHYgcA+Ic33nhD07SkpKTPPvtM\ndRYAd4diBwD4h4cffrhp06YiMn369IyMDNVxANwFih0A4GYjRowQkYsXL37++eeqswC4CxQ7\nAMDN/vWvfzVs2FBEpk2bZrFYVMcBUFAUOwBAHt58800ROXfu3OLFi1VnAVBQFDsAQB5q165d\np04dEZk8eXJ2drbqOAAKhGIHAMjb8OHDReTMmTPffPON6iwACoRiBwDIW6NGjWrXri0ikydP\ntlqtquMAuDOKHQDgtl577TUROXHixIoVK1RnAXBnFDsAwG01a9bs0UcfFZGJEyey0w5wfRQ7\nAEB+7Dvtjh49umbNGtVZANwBxQ4AkJ8WLVpUq1ZNRCZOnGiz2VTHAZAfih0AID+apg0dOlRE\nDhw4sGHDBtVxAOSHYgcAuIO2bds++OCDIjJx4kTVWQDkh2IHALgDvV4/ZMgQEdm1a9dPP/2k\nOg6A26LYAQDurGPHjuHh4SISFRWlOguA26LYAQDuzGg0Dh48WEQ2b968Y8cO1XEA5I1iBwAo\nkK5du5YqVUpEJk+erDoLgLxR7AAABWIymQYOHCgiP/zww/79+1XHAZAHih0AoKB69OgRGhoq\n7LQDXBXFDgBQUL6+vgMGDBCRlStXHjlyRHUcADej2AEA7kJERERISIjNZmOnHeCCKHYAgLvg\n7+8fEREhIsuXLz958qTqOAD+gWIHALg7/fv3DwoKysnJmTJliuosAP6BYgcAuDuBgYG9evUS\nkaVLl/7xxx+q4wD4G8UOAHDXXn31VX9//6ysrJiYGNVZAPyNYgcAuGshIYTeS5kAACAASURB\nVCHdu3cXkS+++OLs2bOq4wD4C8UOAHAvBg8e7OPjk5WVNWPGDNVZAPyFYgcAuBclSpR45ZVX\nRGT+/Pl//vmn6jgARCh2AIB7NmTIEJPJlJmZ+cknn6jOAkCEYgcAuGdlypTp0KGDiMydOzcx\nMVF1HAAUOwDAfRg+fLjBYEhLS5s9e7bqLABEs9lsqjPcNavVmpOTozpFfjRNMxgMWVlZqoO4\nLr1er9PpbDZbdna26iyuy2AwWK1Wq9WqOoiLsn/QRCQ7O9sdv5U5h06n0+l0Dv2g9ezZ84sv\nvggKCjpx4kRwcLDjXshBDAaDpmmu/5NFLaPRyActHzqdTq/Xi4gTfvRbrVaz2Xy7R9212KWn\np6tOkR+9Xm82m9PS0lQHcV1ms9lgMOTk5GRkZKjO4rp8fX2zsrLovrej0+l8fX1FJD09nfp7\nOwaDwWg0OvR75vHjx5944gmr1TpmzJhRo0Y57oUcxMfHR6/XZ2dnZ2Zmqs7iuvz8/DIzM+m+\nt6PX6318fEQkLS3N0c3KZrMFBATc7lGDQ1/bcVy82BmNRrPZ7OIh1dLr9fbdUbxL+TCbzVlZ\nWXTf2zEYDPZil5mZSf29HbPZrNfrHfpBCw8Pb9GixXfffTd9+vTevXvn8yPHNZlMJnux49tR\nPuzFjknU7ZhMJnuxS09Pd8Ius3w+ZRxjBwC4XyNGjNA0LSkpad68eaqzAF6NYgcAuF8PP/xw\ns2bNRGTGjBnsYwYUotgBAArByJEjNU27dOnS559/rjoL4L0odgCAQvDII480bNhQRKZOnWqx\nWFTHAbwUxQ4AUDhGjhwpIufPn1+0aJHqLICXotgBAApH7dq1//3vf4tIdHQ0p08CSlDsAACF\nZsSIESJy9uzZpUuXqs4CeCOKHQCg0DRo0ODJJ58UkaioKBazBZyPYgcAKEzDhg0TkdOnT3/3\n3XeqswBeh2IHAChMTZs2feyxx0Rk0qRJXOoNcDKKHQCgkL322msicuzYsVWrVqnOAngXih0A\noJA1b968WrVqIjJp0iQnXDcTQC6KHQCgkGmaZt9pd/DgwfXr16uOA3gRih0AoPC1adOmUqVK\nIjJx4kTVWQAvQrEDABQ+vV4/dOhQEdm9e/eWLVtUxwG8BcUOAOAQ7du3L1eunIhERUWpzgJ4\nC4odAMAhjEbjkCFDRGTr1q07duxQHQfwChQ7AICjvPzyy2XLlhV22gHOQrEDADiKyWR69dVX\nRWT9+vX79u1THQfwfBQ7AIAD9ejRo2TJkiISHR2tOgvg+Sh2AAAHMpvN/fv3F5HVq1f/+uuv\nquMAHo5iBwBwrD59+oSEhNhsNnbaAY5GsQMAOJafn1/fvn1F5Lvvvjt69KjqOIAno9gBAByu\nX79+QUFBVqt12rRpqrMAnoxiBwBwuMDAwN69e4vI119/ferUKdVxAI9FsQMAOMOAAQMCAgJy\ncnLYaQc4DsUOAOAMISEhPXr0EJFFixbFx8erjgN4JoodAMBJBg0a5OPjk5WVNWPGDNVZAM9E\nsQMAOEnx4sW7du0qIgsWLEhISFAdB/BAFDsAgPMMGTLEZDJlZmZ+8sknqrMAHohiBwBwntKl\nS3fq1ElE4uLiEhMTVccBPA3FDgDgVK+99prBYEhLS5s1a5bqLICnodgBAJyqfPny7dq1E5FP\nP/00OTlZdRzAo1DsAADONmLECL1ef+3atU8//VR1FsCjUOwAAM5WsWLFli1bikhsbGxqaqrq\nOIDnoNgBABR4/fXXdTrdlStX4uLiVGcBPAfFDgCgQNWqVZ9//nkRmTFjRnp6uuo4gIeg2AEA\n1HjjjTc0Tbt8+fKCBQtUZwE8BMUOAKBGzZo1GzVqJCIxMTGZmZmq4wCegGIHAFBm5MiRIvLn\nn39++eWXqrMAnoBiBwBQ5oknnqhbt66ITJkyxWKxqI4DuD2KHQBApREjRojI2bNnly5dqjoL\n4PYodgAAlerVq/fUU0+JSFRUVHZ2tuo4gHuj2AEAFBs+fLiI/P7778uXL1edBXBvFDsAgGKN\nGzeuVauWiLzxxhvPPPNMly5d5s+fn5OTozoX4H4odgAAxSwWi30Im5qaevz48fXr17/++usv\nvvjitWvXVEcD3AzFDgCg2IwZMw4ePJh712q1isjevXs//PBDdaEAt0SxAwAotmjRIk3Tbt2+\nePFim83m/DyA+6LYAQAUi4+Pz7PApaSkpKSkOD8P4L4odgAAxYoUKZLndr1e7+/v7+QwgFuj\n2AEAFGvcuPGto1idTle3bl2j0agkEuCmKHYAAMXefPPNwMBAne4fP5JsNtv//d//qYoEuCmK\nHQBAsfLly69bt+6m/XY2m23NmjUKUwHuiGIHAFDvgQce+OKLL06fPr158+bffvutdevWIjJ1\n6tR9+/apjga4E4odAMBV+Pv7V6tWLTAwMDIysnjx4tnZ2YMHD87MzFSdC3AbFDsAgMsJCQmZ\nNGmSiBw/ftx+A0BBUOwAAK7ohRdeaNWqlTCQBe4GxQ4A4KImTJjAQBa4KxQ7AICLCgkJsV8u\n9vjx41FRUarjAG6AYgcAcF2tW7e2D2RjYmIYyAJ3RLEDALi0CRMmhIaGMpAFCoJiBwBwaSEh\nIR999JEwkAUKgGIHAHB1rVu3btmypYjExMTs379fdRzAdVHsAABuYOLEiQxkgTui2AEA3EDu\nGbLHjh2Ljo5WHQdwURQ7AIB7aNOmjX0gO2XKFAayQJ4odgAAt3HjQNZisaiOA7gcih0AwG0w\nkAXyR7EDALiT3IHs5MmTGcgCN6HYAQDcTO5A9rXXXmMgC9yIYgcAcDMhISHjx48XkV9//ZWB\nLHAjih0AwP20bds2dyD7yy+/qI4DuAqKHQDALeUOZIcOHcpAFrCj2AEA3NKNA9nJkyerjgO4\nBIodAMBdtW3btkWLFiISHR3NQBYQih0AwK0xkAVuRLEDALixYsWKjRs3ThjIAiJCsQMAuLuX\nXnqJgSxgR7EDALg9liwG7Ch2AAC3V6xYsQ8++EBEDh8+zEAW3oxiBwDwBO3atWMgC1DsAAAe\nYuLEicWKFWMgC29GsQMAeIjcM2QPHz48ZcoU1XEABSh2AADPkTuQjYqKYiALL0SxAwB4lBsH\nsllZWarjAE5FsQMAeJQbz5BlIAtvQ7EDAHia9u3b2weykyZNOnDggOo4gPNQ7AAAHih3IDt0\n6FAGsvAeFDsAgAdiIAvvRLEDAHgmBrLwQhQ7AIDH+vjjj4sWLcpAFt6DYgcA8FglSpTIXbI4\nJiZGdRzA4Sh2AABP1qFDB/tAduLEiQxk4fEodgAAD5c7kGXJYng8ih0AwMOVKFHCfobsoUOH\nGMjCs1HsAACer2PHjs2bNxfOkIWno9gBALyCfSCblZXFQBYejGIHAPAKJUuWzB3ITp06VXUc\nwCEodgAAb3HjQPbIkSOq4wCFj2IHAPAi9oGsxWIZOHAgA1l4HoodAMCLlCxZ8v333xcGsvBQ\nFDsAgHfp1KkTA1l4KoodAMDrMJCFp6LYAQC8zo0D2YkTJ6qOAxQaih0AwBt16tTpxRdfFJFx\n48YdPHhQdRygcFDsAABeKjIy0j6Q7dGjBwNZeAaDs17IunHRjBWb98Zf01et8WTPIb0q+v3j\npa+dm/TKq5tu+hqT/6Nff/m+sxICALxLyZIl33vvvSFDhuzbty86OnrgwIGqEwH3y0nF7tTS\n/0Z/dabroMG9i2b/b9b00cMtC2cNunFvoV9Iy//8p86NX/Lz3JgTDzd1TjwAgHfq3LnzunXr\nvvvuu3HjxjVq1KhatWqqEwH3xSnFzmaJ+urIg10mdmjyoIhUitQ6dI9ceK5ntzL+uU/R+z70\n738/lHs35fiiqOsPxA6p54x4AAAvNnXq1C1btly5cmXQoEFr1qwxGo2qEwH3zhnH2GWmbP4j\nI6dp0zL2u+bgurUCTHs2Jtzu+baca1Hvfv3i6DdDDJoT4gEAvFmpUqWio6NF5ODBg9OnT1cd\nB7gvzthjZ7l+QESq+/39O1A1P8PqAynySt7PP/Xt+yeLtXm3RtEbN86YMWP79u322wEBAS6+\nXLimaZqmBQcHqw7iunQ6nYgYDAbepXzo9Xo/Pz8fHx/VQVyUpv31u1+RIkVsNpvaMC5L0zSd\nTscHLR96vb5Hjx7ffvvt8uXLJ06c2L59+xo1aqgO5XI0TQsICOCDdju5346CgoIc/VpWqzWf\nR51R7KyZ10WkmOHvvYOhRn12akbeT7ZcGPflibYxb9+0/fz587nrgxctWtRgcNppH/fOLUKq\npWka71L+7D+VVadwdXq9XnUEV8cH7Y5mzJixefPmK1eu9O7de8eOHQxkb8UHrSCc8FnLycnJ\nL4CjX15EdCZfEbmSbQ34//8mErNy9MGmPJ8cvzIq1b9B+xsOv7OrXbu2n5+f/bavr29GRt69\n0EXodDqTyeTiIdUyGo16vd5qtVosFtVZXJfJZMrJycn/M+zNNE0zm80iYrFY8v8V1pvp9Xq9\nXs8HLR8mk0mn05UsWfLjjz/u16/fvn37Pvroo5EjR6rO5Vp8fHz4oOVDr9fbfxlwwo9+q9Wa\n24hu5YxiZ/SvKbL5WHp2uPmvYnciPTuobp5zAdtnS05X7Dr01gdat27dunVr+22r1ZqUlOSo\nuIXBaDQajcbU1FTVQVxXQECAXq/PycnhXcpHcHBwZmYmvyHcjsFgsBe7tLS07Oxs1XFclNls\n9vX15YOWj6CgIJ1Ol5WV1bZt22+//XbVqlUffPBBw4YNOUP2RmazOT09ndX+bsdkMtmL3fXr\n150wsM6n2DljxOMT3Ki0Sb9m60X73azr+3deszzeJOzWZ6ZdXLL7mqVXw1JOSAUAwE0iIyOD\ng4MtFsugQYMoMXBHTjl2RzO90b7qyXnv/LDn2IVTh+aOneRXqnH3sgEicurrz+Pmr8h94vmV\nW01Fnqjiy7EgAAAFwsLC3nvvPeEMWbgtJx2UXanTBwNbVl8UPXbgmx+cCP73B1F/rU58bv2q\n71duzX3apk1/Bj7wgnMiAQBwqy5durzwwgsiMmHChNyT9gB3obnjqctucYxdYGBgYmKi6iCu\nKyAgwMfHJysrKyUlRXUW1xUcHJyRkcExdreTu1xOcnIyx9jdjv0Yu+TkZNVBXFdQUJDRaMzI\nyMg9EjEhIaFevXrJyck1a9ZkyWK7YsWKXb16lfH07ZhMpsDAQBFJTEx0QrMKDQ293UMsowAA\nwD/cOJCdMWOG6jjAXaDYAQBwsy5dujRu3FhEIiMjGcjCjVDsAADIw+TJk+1nyA4ePJgRJNwF\nxQ4AgDyEhYW9++67InLgwAEGsnAXFDsAAPL28ssv5w5kjx49qjoOcGcUOwAAbit3IMuSxXAL\nFDsAAG7rxoHszJkzVccB7oBiBwBAfnIHsh9//DEDWbg4ih0AAHeQO5AdNmxYTk6O6jjAbVHs\nAAC4g7CwsHfeeUdE9uzZwxmycGUUOwAA7uyVV16xD2Q/+ugjBrJwWRQ7AAAKhIEsXB/FDgCA\nAgkLC3v77beFgSxcGMUOAICC6tq1KwNZuDKKHQAAdyE6OjooKIiBLFwTxQ4AgLtQqlSp3DNk\nWbIYroZiBwDA3enateuzzz4rIh9++CEDWbgUih0AAHdt8uTJDGThgih2AADctVKlSuWeIctA\nFq6DYgcAwL1gIAsXRLEDAOBeaJrGQBauhmIHAMA9unEg+8knn6iOA1DsAAC4D7kD2fHjxx87\ndkx1HHg7ih0AAPeOgSxcCsUOAID7UqpUqbFjx4rI7t27Z82apToOvBrFDgCA+9WtWzf7QHbc\nuHEMZKEQxQ4AgPvFQBYugmIHAEAhYCALV0CxAwCgcHTr1q1Ro0bCQBbqUOwAACgcmqZNmjSp\nSJEiDGShCsUOAIBCEx4ebl+yePfu3bGxsarjwOsUtNiFP9ZkdNT8Y5cyHJoGAAB31717d/tA\n9oMPPmAgCycraLErnrxr/Os9qoUFP/Vi9+mL1iVlWR0aCwAAN2UfyAYEBFgsluHDhzOQhTMV\ntNjt/f3Kr1uWv9Wv9eXtiwd3eS4suFzbiFHfbD5MvwMA4Ca5A9ldu3YxkIUzFfwYO121uq0+\nmPnVycTEbSvm9WtVfeuCSe0a1Cha4YmBY6f8fCLJgRkBAHA3PXr04AxZON9dnzyh6fzrtOgx\n7cu1+7YteqFK8NUze2a+P+zfVUIfqtNy4sLNjogIAIDbyR3IZmZmMpCF09x1sYv/ZWP0mMHP\nVA8Lf6LD6uPXqjz94n+j4qLf6mf+ff3Irg2ajN3uiJQAALidGweys2fPVh0HXkGz2WwFed5v\nu9ct/frrr5cu3XUyUdN0lZ9s1qFjh44d2j8SXsT+BFtO6tuPP/DRyWKW60cdGVhExGq1JiW5\n9PDXaDQGBgYmJiaqDuK6AgICfHx8srKyUlJSVGdxXcHBwRkZGRkZnI2eN4PBEBwcLCLJycnZ\n2dmq47gos9ns6+ubnJysOojrCgoKMhqNGRkZqamphf6H22y2Tp06bdiwwcfHZ+PGjQ8++GCh\nv4RzFCtW7OrVq1lZWaqDuCiTyRQYGCgiiYmJBWxW9yM0NPR2DxkK+EdUqv2cpukq1X7urYkd\nOnRo/1i5wJueoOkDGlcLmXjG795jAgDgWewD2fr166empg4ZMmTFihV6vV51KHiygo5i/2/C\np3tOJx3fsWrc671vbXV2DRYdS0veW3jZAABwe+Hh4fZryDKQhRMUtNiNf6NP+OUNfds17bns\njH3LD81q1WnebfHOSw7LBgCAJ+jZs6f9DNnx48efOnVKdRx4soIWu5QTsQ893W7uij1Gn7++\nJOTxymfWL+ryTOWZR644LB4AAG4v9wzZ9PT0wYMHc4YsHKegxW5O27eu+9ba/Me52c+H27c8\n/uHiU39se8ovY0wHll4EACA/Nw5kP/30UxHJzMxUHQoeqKDFLvpkSqXu054J871xo0/x2jED\nqiSfmOKAYAAAeJTcgezbb79doUKF8PDwWrVqTZ48mYaHQlTQYpdjs5mCTLdu1/vpRbiuGAAA\nd6BpWq9evUQkJyfn+vXrNpvt3Llz48aNa9WqlcViUZ0OHqKgxW5whcBjs/4bn/mPwwKslgvv\nTDtapGx/BwQDAMDTTJgwQdO03Lv2Bc/27t0bFxenLhQ8SkGL3YClY7TkNQ9XffbdqfN+2LR1\n25YNC2d99HzNaisSs4cvGuzQiAAAeIDz588fPHjw1tVrdTrdypUrlUSC5ynoAsUhNYYfXqHv\n0H/0O0P/viCsT0jVd79cMqZ2ccdkAwDAc1y6lPcCYVarNSEhwclh4KkKWuxEpMILQ3edGXDo\n5037jp5JyzGUqvhwwwZPFNHSr15LCyzCBScAAMhPyZIl89yu0+nKlCnj5DDwVHdR7ERENFON\nOk1r1Pl7Q/zathVbHc3KOFO4sQAA8DBhYWFPPPHE3r17rdZ/nHRotVpbtmypKhU8TEGLnS0n\nddqwvp/9uDsx/R9X2k7444zmW90BwQAA8DSTJk1q2bLltWvXbjzSrl69el27dlWYCp6koCdP\n7Huv4dBpi64GP/BQqezff/+96iOPPfpIVUPieS2k0Yzlqx0aEQAAz1C9evVt27a98sorZcqU\nMRj+2rfSv39/o9GoNhg8RkGL3VtTDxer8cHxbWtXbzlSwcdQd9r8ZctXHTi5tlTaz6ml/R0a\nEQAAj1GyZMno6Oj9+/efP3++UqVKIsJaJyhEBS12W65aKnRuISKaPqBbCb/1exNFxLdEg/k9\nK3zQfrYDAwIA4Ik0TevZs6eIrF+//rffflMdBx6ioMWuqEHLupZlv/1UWf9zy8/Zb5d/qWzy\nyWiHRAMAwKN17tzZz8/PZrPNnz9fdRZ4iIIWu4gyRU7GfWS/8kR4qzJnV8batyf8+KejogEA\n4NGCgoLatWsnIgsXLkxPT1cdB56goMWu/9y+6Ze+eTC03OmMnAe7R6RdXFCn15sT3hveYtKh\nkIdHOTQiAACeqk+fPiKSkpLy7bffqs4CT1DQYleqQeS+pZNaPFNFp4l/qf5fDmu867OJb749\nOT28ycLVXCsWAIB78fDDDz/55JMiMns2B6yjEBSw2FkzMzOrtxn+zer15c16EekUtS7pzNH9\nR85cPrG6aQlfh0YEAMCD2XfaHTp0aPfu3aqzwO0VqNjZcq4F+/k2XfyPc3YCwx96tGo5o+aY\nXAAAeIeWLVuGhYWJyNy5c1VngdsrULHT9EGvVws5NXeXo9MAAOBtjEbjyy+/LCLLly+/dOmS\n6jhwbwU9xm7MlpWPxA8ZFLM8MTPHoYEAAPA2vXr1MhqNFotl4cKFqrPAvRW02LXoODq9ZLmZ\nw9oW9ytSqmz5B/7JoREBAPBsYWFhzZo1E5HPPvssJ4cdKLh3hgI+z8fHR6R08+alHZoGAADv\n1Lt37++///7s2bNr16594YUXVMeBuyposVuxYoVDcwAA4M3q1atXrVq1I0eOzJ07l2KHe1bQ\nUWxKvhwaEQAAb9C9e3cR2bRp08mTJ1VngbsqaLELzpdDIwIA4A06d+5cpEgRm80WFxenOgvc\nVUFHse+8884/7tuyz5/6ddlXy5O0Mu/MHF/osQAA8DYBAQHt27ePi4tbtGjR6NGj/fz8VCeC\n+9FsNts9f3H6nzsaP9TgxAMDL+2PKsRMd2S1WpOSkpz5infLaDQGBgYmJiaqDuK6AgICfHx8\nsrKyGOXnIzg4OCMjIyMjQ3UQF2UwGOwTg+Tk5OzsbNVxXJTZbPb19U1OTlYdxHUFBQUZjcaM\njIzU1FTVWeTYsWP16tWz2WyTJk2yT2ZdRLFixa5evZqVlaU6iIsymUyBgYEikpiYeD/NqoBC\nQ0Nv91BBR7F58i351Oz3Hrv8S/SmlMz7+XMAAICIVKlSpU6dOsKlY3Gv7qvYiYhfWT9N01fx\nMxZKGgAAvJz90rFHjx7dsWOH6ixwP/dV7KxZl6LH7DcG1Aoz3m9BBAAAIvLiiy+WKlVKRObM\nmaM6C9xPQU+esO8Z/ifrhRMHziRmPPHfaYWbCQAAr2UwGLp16xYZGfn9998nJCSEhYWpTgR3\ncj972nThNZ997f0vfnrvqUKLAwCA1+vevbvRaMzKyuLSsbhbBd1jt337dofmAAAAdiVLlmze\nvPmyZcvmzZs3dOhQo5ED2VFQd7HH7vKeZX3bNe257Iz97g/NatVp3m3xzkuOCQYAgPeyn0KR\nkJCwZs0a1VngTgp8SbETsQ893W7uij1Gn7++JOTxymfWL+ryTOWZR644LB4AAN7o6aefrl69\nunAKBe5SQYvdnLZvXfettfmPc7OfD7dvefzDxaf+2PaUX8aYDrEOiwcAgJfq3bu3iGzduvXI\nkSOqs8BtFLTYRZ9MqdR92jNhvjdu9CleO2ZAleQTUxwQDAAAr9axY0f7tVU+++wz1VngNgpa\n7HJsNlOQ6dbtej+9iLVQIwEAAPH19e3QoYOIfPXVV9euXVMdB+6hoMVucIXAY7P+G5+Zc+NG\nq+XCO9OOFinb3wHBAADwdhEREZqmpaamLl68WHUWuIeCFrsBS8doyWservrsu1Pn/bBp67Yt\nGxbO+uj5mtVWJGYPXzTYoREBAPBOFStWrF+/vojMnTvXCZeWhwco6Dp2ITWGH16h79B/9DtD\nN+du9Amp+u6XS8bULu6YbAAAeLvevXtv2rTp+PHjP/30U926dVXHgasraLETkQovDN11ZsCh\nnzftO3omLcdQquLDDRs8EajXHBcOAAAv16xZs/Dw8Pj4+Dlz5lDscEd3uUBx++YT/3yoW6+I\n/hE9/T7u16xVdxYoBgDAcfR6fffu3UVk9erV58+fVx0Hro4FigEAcGndunUzm83Z2dnz589X\nnQWujgWKAQBwacWKFWvZsqWILFiwwGKxqI4Dl8YCxQAAuDr7VSguXrz4v//9T3UWuDQWKAYA\nwNXVrl370UcfFS4dizthgWIAANxAr169RGTHjh0HDhxQnQWuiwWKAQBwA+3atStatKhw6Vjk\nq6DFLqTG8MMroqvk7H1naK+mDes9U//ZrgP+b8vlUu9+uXcsCxQDAOBgPj4+nTt3FpElS5Yk\nJyerjgMXdRfr2FV4YeiuM4kHt62dP3f2J7Pjlv+488+Lv/63Q8Wr19Iclw8AANj17t1bp9Ol\np6dz6Vjczl1ceUJERDPVqNO0Rp2/N8SvbVux1dGsjDOFGwsAANykQoUKDRs2XL9+/aeffhoR\nEaHT3cXeGXiJghY7W07qtGF9P/txd2J69o3bE/44o/lWd0AwAABwsz59+qxfv/706dObN29u\n2LCh6jhwOQUt+/veazh02qKrwQ88VCr7999/r/rIY48+UtWQeF4LaTRj+WqHRgQAAHZNmjQp\nV66ciMydO1d1Friigha7t6YeLlbjg+Pb1q7ecqSCj6HutPnLlq86cHJtqbSfU0v7OzQiAACw\n0+l0PXv2FJG1a9fGx8erjgOXU9Bit+WqpULnFiKi6QO6lfBbvzdRRHxLNJjfs8IH7Wc7MCAA\nALhBt27dfH19c3JyuHQsblXQYlfUoGVdy7Lffqqs/7nl5+y3y79UNvlktEOiAQCAWwQHB7du\n3VpE5s+fn5mZqToOXEtBi11EmSIn4z6yX3kivFWZsytj7dsTfvzTUdEAAEBe+vbtKyJJSUnf\nffed6ixwLQUtdv3n9k2/9M2DoeVOZ+Q82D0i7eKCOr3enPDe8BaTDoU8PMqhEQEAwI0eeeSR\nWrVqCadQ4BYFLXalGkTuWzqpxTNVdJr4l+r/5bDGuz6b+Obbk9PDmyxczbViAQBwqt69e4vI\n7t279+/frzoLXMhdrG34aNvh36xeX96sF5FOUeuSzhzdf+TM5ROrm5bwdVg8AACQh5deeik0\nNFRE4uLiVGeBC7n3RasDwx96tGo5o1aIYQAAQIGYTKaXX35ZRL755pukpCTVceAquBoJAABu\nqVevXnq9PiMjY9GiRaqzwFVQ7AAAcEtly5Zt0qSJiMTFxVmtVtVxzGDdjgAAIABJREFU4BI0\nm82mOsNds1qtWVlZqlPkR6fTGY1GlhfKh8Fg0Ov1rv+/Ui2TyZSTk5OTk6M6iIvSNM1kMomI\nxWJxx29lzqHX6/V6vcViUR3EdRmNRp1Ol5OTk52dfednu5h169a1bNlSRJYtW/b888877oXM\nZnNWVhb18XbsP/dFxAk/+m02m4+Pz+0eNTj65R3ELf5tuUVIVXJ/DPMu5cNms1mtVt6i29Hp\n/po52N8otWFclqZpOp2O96cg3PFdevbZZytXrnzixImZM2c+99xzjnshvh3lT9P+OufACW9R\n/i/hrsXu+vXrqiPkx2g0mkwmFw+pVkBAgMFgyMnJ4V3Kh9FotFgsGRkZqoO4KIPBYDabRSQ9\nPd0d97U4h9ls1ul0fNDyYTAYdDpdVlaWm75L3bt3HzNmzNq1aw8ePFixYkUHvYqPj09GRgYz\nltsxmUz2AUJaWpoTBgj+/v63e4hj7AAAcGNdunTx8/Oz2WxcOhZCsQMAwK0FBQW99NJLIrJw\n4cL09HTVcaAYxQ4AAPcWEREhIsnJycuWLVOdBYpR7AAAcG8PP/xw7dq1RWT27Nmqs0Axih0A\nAG6vT58+InLw4ME9e/aozgKVKHYAALi9li1bFi9eXETmzp2rOgtUotgBAOD2TCZT165dRWTZ\nsmWXL19WHQfKUOwAAPAEPXr0MBgMFotl4cKFqrNAGYodAACeoEyZMs2aNRORefPmcSlCr0Wx\nAwDAQ/Tu3VtEzp49u27dOtVZoAbFDgAAD1G/fv2qVasKp1B4MYodAACeo0ePHiKycePGkydP\nqs4CBSh2AAB4js6dOxcpUsRms82bN091FihAsQMAwHMEBAS0a9dORBYtWpSWlqY6DpyNYgcA\ngEeJiIjQNC0lJWXp0qWqs8DZKHYAAHiUKlWqPP300yIyZ84c1VngbBQ7AAA8jf3SsYcPH965\nc6fqLHAqih0AAJ6mefPmpUqVEnbaeR+KHQAAnsZgMNgvHbtixYqEhATVceA8FDsAADxQjx49\njEZjVlbWF198oToLnIdiBwCABypZsuQLL7wgInFxcVlZWarjwEkodgAAeCb7KRQJCQlr1qxR\nnQVOQrEDAMAz/fvf/65evbpw6VhvQrEDAMBj9erVS0S2bNly5MgR1VngDBQ7AAA8VocOHQID\nA0Vk/vz5qrPAGSh2AAB4LH9//44dO4rIokWLrl27pjoOHI5iBwCAJ+vdu7emaampqUuWLFGd\nBQ5HsQMAwJNVrly5Xr16IjJnzhybzaY6DhyLYgcAgIfr3bu3iBw/fnzbtm2qs8CxKHYAAHi4\n559/Pjw8XLh0rBeg2AEA4OH0en23bt1EZNWqVefPn1cdBw5EsQMAwPN1797dZDJlZ2cvWLBA\ndRY4EMUOAADPV6xYsZYtW4rI/PnzLRaL6jhwFIodAABewX7p2IsXL65cuVJ1FjgKxQ4AAK9Q\nu3btRx99VDiFwqNR7AAA8BY9e/YUkZ9//vnXX39VnQUOQbEDAMBbtG/fvmjRoiIyd+5c1Vng\nEBQ7AAC8hY+PT6dOnURk8eLFycnJquOg8FHsAADwIn369NHpdOnp6Vw61iNR7AAA8CIVKlRo\n0KCBiHz66adcOtbzUOwAAPAu9nVPTp06tXnzZtVZUMgodgAAeJemTZuWK1dOOIXCE1HsAADw\nLjqdrkePHiKyZs2a+Ph41XFQmCh2AAB4na5du5rN5pycnPnz56vOgsJEsQMAwOuEhIS0adNG\nRBYsWJCZmak6DgoNxQ4AAG/Uu3dvEUlMTFyxYoXqLCg0FDsAALzR44//v/buOz6qOt//+OdM\nTU8gQWpEKdIUwd7oIKiAFIEgENJQwfXuug9/urt6UVe8e+W6uuvuugqkUCIQ+iqCgAiIIFIE\nBAVEUHpLSCOZTP39MUgJyaSQzHfK6/lXzsmZzDvhO9+8czhnvnd07dpVuIUisFDsAAAIUu6T\ndlu3bt21a5fqLKgbFDsAAILUsGHD4uLiRCQzM1N1FtQNih0AAEHKZDKNHj1aRBYtWnT+/HnV\ncVAHKHYAAASv5ORkvV5vsVjmzZunOgvqAMUOAIDgFR8f36dPHxHJyMhwOp2q4+B6UewAAAhq\n7qVjf/7553Xr1qnOgutFsQMAIKj16tWrdevWIpKenq46C64XxQ4AgKCmaZp76dg1a9b88ssv\nquPgulDsAAAIdk8++WRYWJjT6czKylKdBdeFYgcAQLCLjo4eOnSoiMyZM6e0tFR1HNQexQ4A\nAEhaWpqI5OfnL1u2THUW1B7FDgAAyK233nr33XeLyLRp01RnQe1R7AAAgMivS8d+9913O3bs\nUJ0FtUSxAwAAIiKDBw9u1KiRiGRkZKjOglqi2AEAABERk8k0ZswYEVmyZMm5c+dUx0FtUOwA\nAMBFSUlJBoPBarV+9NFHqrOgNih2AADgoubNmz/88MMikpmZ6XA4VMdBjVHsAADAZe5bKI4d\nO7ZmzRrVWVBjFDsAAHBZ9+7d27ZtKywd658odgAA4DJN05KTk0Vk3bp1P/30k+o4qBmKHQAA\nuMro0aMjIiJcLhdLx/odih0AALhKRETE8OHDRWTu3LklJSWq46AGKHYAAKC8tLQ0TdMKCgoW\nL16sOgtqgGIHAADKa9++/b333isiM2bMUJ0FNUCxAwAAFUhNTRWRvXv3bt26VXUWVBfFDgAA\nVOCxxx5r2rSp8L4nfoViBwAAKmA0Gt1Lx3788cenT59WHQfVQrEDAAAVS0pKMhqNVquVK+38\nBcUOAABUrHHjxgMGDBCRf//73zabTXUcVI1iBwAAKuW+heLEiROfffaZ6iyoGsUOAABU6sEH\nH+zQoYOITJ8+XXUWVI1iBwAAPHEvHbt+/fp9+/apzoIqUOwAAIAnI0eOjI6OFpGZM2eqzoIq\nUOwAAIAn4eHh48aNE5F58+YVFRWpjgNPKHYAAKAKEydO1DStuLh44cKFqrPAE4odAACoQocO\nHbp16yYi6enpLpdLdRxUimIHAACqNmHCBBHZv3//5s2bVWdBpSh2AACgao888kizZs2EpWN9\nG8UOAABUzWAwjB8/XkQ+/fTTkydPqo6DilHsAABAtYwfP95kMtnt9tmzZ6vOgopR7AAAQLXE\nxsYOHDhQRGbNmsXSsb6JYgcAAKrLvXTs6dOnP/30U9VZUAGKHQAAqK577rmnc+fOwi0Uvopi\nBwAAaiApKUlENm/e/P3336vOgvIodgAAoAaeeOKJBg0aiEhmZqbqLCiPYgcAAGogNDR05MiR\nIrJgwYLCwkLVcXAVih0AAKiZ1NRUnU534cKFnJwc1VlwFYodAAComZtvvrlHjx4iMn36dJaO\n9SkUOwAAUGMpKSkicujQoS+//FJ1FlxGsQMAADX28MMP33jjjSKSkZGhOgsuo9gBAIAa0+l0\niYmJIrJy5cqjR4+qjoOLKHYAAKA2xo0bZzabHQ4HS8f6DoodAACojYYNGz7++OMiMmvWLKvV\nqjoORCh2AACg1ty3UOTm5n788ceqs0CEYgcAAGrtzjvv7NKli7B0rM+g2AEAgNpzn7TbunXr\nrl27VGcBxQ4AAFyHoUOHNmzYUESysrJUZwHFDgAAXIeQkJAnn3xSRBYuXHj+/HnVcYIdxQ4A\nAFyXlJQUvV5vsVjmz5+vOkuwM3jriZzr5r3/8YYdR4v07W+9J+m55FZhFTz14a8WZn+66fv9\nx6NbtBua+ruHb2vorXgAAKCW4uPje/fuvXr16vT09Keeekqn47SRMl760R9a9Mq78zffN2zC\nq79LjPjp85ef/9B5zTHntmf8bupHsXc/+sqbk/t3sLz/2u+/K7F5Jx4AALgeqampIvLzzz+v\nX79edZag5pVi57K+M/+H1qP/PKLv/Z3u7Pbbqb+5cPKz7OMXyh31/juftnj09YlD+nZs12nI\n0//b87b4r38s9EY8AABwfXr37t26dWvhfU9U80axKyvYcMTi6NevuXvTHPNQ1wjT9nWnrjzG\nWrR5W5F1wIi2l4L97rU3Jtwe64V4AADgOmma5l46dvXq1UeOHFEdJ3h54xo764XdItIxzHhp\nT4cww8rdBTLmimMKt4pI473LX5r3yU+nShu3bD0w8blHujS5dMC8efN27tzp/jgsLOyll17y\nQvJa0+l0mqZFRkaqDuK7DAaDiOj1en5KHuj1+pCQEKPRWPWhQUnTNPcHYWFhLpdLbRifpdfr\neaF5ptfrRcRoNPJT8kDTtLCwMKfz2gupLnv66affeuutkpKSjz766M033/RaNl9w6bLCiIiI\n+n4uz9OdN4qds+yCiMQaLp8djDPq7cWWK49xlBWKyDvvfznq6Ykpjc0/bFjwwasTy/45e0j8\nxR/Qnj171qxZ4/64QYMGkydP9kLy62Q2m1VH8HU6nY6fkmcGg8FdguGByWRSHcHX8UKrkrsB\nq07h06r8I7Nx48YJCQkZGRlZWVlTpkwJCQnxTjCf4oXXmsPh8PBZb/zC0JlCReS83Rnx62sm\n1+bQx1w1EesMehHp9eqrQ9s3EJF2HW4/uWnk0vf3DPnLfe4Dbr31Vrvd7v44LCysrKzMC8lr\nTafTGY1GHw+plsFg0Ov1TqfTZuMWmUqZTCaHw+H5NRzMNE1zVzqr1coZu8q4+woLtHtgNBp1\nOp3D4bj0WwbXMpvNNpvN8xk7EXn66aczMjJyc3Ozs7PHjh3rnWy+wP17X0S88Kvf5XJ5+CPE\nG8XOGH6byIb9pfZ488UcP5baox+KuSpHWFuRzT1aXj4Nfm/TsA3nTlzaTEhISEhIcH/sdDrz\n8vLqP3jtGY3GqKiooqIi1UF8V0REhF6vdzgc/JQ8iImJsVgsFoul6kODksFgcBe7kpISfiVX\nxmw2h4aG8kLzIDo6WqfT2Wy24uJi1Vl8l8lkKikpqfJP8VatWt11113btm177733Hn/8ce9k\n8wUmk8ld7IqLi73wd6aHs6HeuHkiJKZXM5P+s41n3Ju2Czu/KbLe0bfJVcc06N/AoFt9oODi\ntsux7nhJZOvWXogHAADqinvp2N27d3/77beqswQjr7zdiWZ64Yn2B7NeW7N9/8lDezIm/zWs\naZ/EFhEicmjhnMxZH4uIpo98aUjbtW9OXrJh28H9uxe899KGYmPSM+29EQ8AANSRxx9/vFGj\nRiKSkZGhOksw8tIbFLcZNWXSoI7z3p086cUpP8Y8MOWdZ91PfHztik8+3eg+puO4v0wc2Hrl\njLdfmvz25tOx//W/7z8Qw9W+AAD4E5PJNGbMGBFZvHjxuXPnVMcJOpo/XnHsL9fY5ebmqg7i\nuyIiIkJCQmw2W0FBQdVHByuusfPMYDDExMSISH5+PtfYVcZ9jV1+fr7qIL4rOjraaDRaLBau\nsfMgNja2sLCwmre7HTt27K677nI4HJMnT37uuefqO5svMJlMUVFRIpKbm+uFZhUXF1fZp1jN\nDQAA1KUWLVo8/PDDIpKZmcl9/V5GsQMAAHXMfQvF0aNH16xZw9taeRPFDgAA1LEePXq0aNFC\nRBITE2+88cYePXosW7ZMdaigQLEDAAB1LDs7+/jx4yLidDrtdvu+ffvS0tL++Mc/qs4V+Ch2\nAACgLp0/f/5Pf/rTlXvcS1akp6fv2LFDUahgQbEDAAB1acOGDaWlpdfeHOpyuVasWKEkUvCg\n2AEAgLp09uzZCvfrdLrTp097OUywodgBAIC61Lhx4wr3O53OJk2aVPgp1BWKHQAAqEvdu3eP\niIjQNK3cfk3TBg4cqCRS8KDYAQCAuhQdHT116lQR0emuqhnPPfdc586dFYUKFhQ7AABQx0aM\nGLFmzZrevXtHRUUZDAYRMRgMzzzzjOpcgY9iBwAA6l7nzp3nzp37008/ffvtt0aj0W63Z2dn\nqw4V+Ch2AACgHjVp0mTAgAEikpWVZbfbVccJcBQ7AABQv1JTU0Xk+PHjq1atUp0lwFHsAABA\n/XrwwQc7dOggIhkZGaqzBDiKHQAAqHdJSUkisn79+n379qnOEsgodgAAoN6NGjUqMjJSRGbN\nmqU6SyCj2AEAgHoXHh4+cuRIEZk7d25RUZHqOAGLYgcAALwhJSVF07Ti4uJFixapzhKwKHYA\nAMAbbrnllgcffFBEZsyY4XK5VMcJTBQ7AADgJe73Pdm/f//XX3+tOktgotgBAAAvGTBgQLNm\nzUQkPT1ddZbARLEDAABeYjAYEhMTRWT58uUnT55UHScAUewAAID3jBs3zmQy2e32OXPmqM4S\ngCh2AADAe2644YbHHntMRGbOnGmz2VTHCTQUOwAA4FXuWyhOnz69YsUK1VkCDcUOAAB41b33\n3tu5c2fhFop6QLEDAADeNn78eBHZtGnTDz/8oDpLQKHYAQAAbxsxYkRMTIyIZGZmqs4SUCh2\nAADA20JDQ91Lx+bk5BQWFqqOEzgodgAAQIG0tDSdTnfhwoWcnBzVWQIHxQ4AAChw8803d+/e\nXUQyMzNZOrauUOwAAIAaKSkpInLgwIGNGzeqzhIgKHYAAECNhx9+OD4+XkQyMjJUZwkQFDsA\nAKCGXq93Lx27YsWKo0ePqo4TCCh2AABAmcTERLPZ7HA4WDq2TlDsAACAMg0bNhw8eLCIzJw5\n02q1qo7j9yh2AABAJfctFLm5uZ988onqLH6PYgcAAFS66667unTpIiwdWxcodgAAQDH3Sbtv\nvvlm9+7dqrP4N4odAABQbOjQoQ0bNhSRrKws1Vn8G8UOAAAoFhISMnr0aBFZuHDh+fPnVcfx\nYxQ7AACgXnJysk6nKy0tZenY60GxAwAA6rVs2bJ3794ikp6e7nQ6VcfxVxQ7AADgE1JTU0Xk\n8OHD69evV53FX1HsAACAT+jTp0+rVq2E9z25DhQ7AADgEzRNcy8du3r16iNHjqiO45codgAA\nwFeMGTMmNDTU6XTOnDlTdRa/RLEDAAC+IiYmZsiQISIyZ86csrIy1XH8D8UOAAD4kAkTJohI\nXl7e0qVLVWfxPxQ7AADgQ2677bY777xTRDIyMlRn8T8UOwAA4FvcS8fu2LHj22+/VZ3Fz1Ds\nAACAbxkyZEhcXJxw0q7mKHYAAMC3mEymMWPGiMjixYtzc3NVx/EnFDsAAOBzkpKS9Hq91Wqd\nO3eu6iz+hGIHAAB8TosWLfr16yciGRkZDodDdRy/QbEDAAC+yH0LxdGjR9euXas6i9+g2AEA\nAF/Us2fPNm3aCEvH1gTFDgAA+CJN05KSkkRk7dq1P/30k+o4/oFiBwAAfFRCQkJYWJjL5Zo1\na5bqLP6BYgcAAHxUdHT08OHDRSQ7O7u0tFR1HD9AsQMAAL4rNTVVRAoKCpYsWaI6ix+g2AEA\nAN/VqVOne+65R0SmT5+uOosfoNgBAACf5j5pt2fPnm3btqnO4usodgAAwKcNGjSoSZMmwtKx\n1UCxAwAAPs1oNLqXjl22bNnZs2dVx/FpFDsAAODrkpKSjEaj1WrNzs5WncWnUewAAICva9Kk\nSf/+/UVk5syZLB3rAcUOAAD4AfctFMeOHVu1apXqLL6LYgcAAPzAQw891KFDB+EWCo8odgAA\nwD+MHz9eRNavX//jjz+qzuKjKHYAAMA/jBo1KjIy0uVyZWZmqs7ioyh2AADAP0RERIwYMUJE\n5s6dW1xcrDqOL6LYAQAAv5GamqppWnFx8aJFi1Rn8UUUOwAA4DduueWWBx54QERmzJjhcrlU\nx/E5FDsAAOBP3O97sm/fvi1btqjO4nModgAAwJ888sgjzZo1E5H09HTVWXwOxQ4AAPgTg8Ew\nbtw4EVm+fPnJkydVx/EtFDsAAOBnEhMTTSaTzWZj6dhyKHYAAMDP3HDDDY8++qiIZGVl2Ww2\n1XF8CMUOAAD4H/ctFKdPn165cqXqLD6EYgcAAPzPfffd17FjR+EWiqtR7AAAgF9KSUkRka++\n+uqHH35QncVXUOwAAIBfGjlyZExMjIhkZWWpzuIrKHYAAMAvhYaGupeOnT9/flFRkeo4PoFi\nBwAA/FVaWpqmaRcuXMjJyVGdxSdQ7AAAgL9q1apV9+7dRSQjI4OlY4ViBwAA/Jr7FooDBw58\n9dVXqrOoR7EDAAB+rH///vHx8cL7nogIxQ4AAPg1vV6fmJgoIitXrjxx4oTqOIpR7AAAgH8b\nN26c2Wy22+2zZs1SnUUxih0AAPBvsbGxgwcPFpGZM2darVbVcVSi2AEAAL/nvoXi3Llzy5cv\nV51FJYodAADwe3fddVeXLl0k6G+hoNgBAIBAkJycLCJbtmzZvXu36izKUOwAAEAgGDZsWMOG\nDSW4l46l2AEAgEAQEhKSkJAgIgsXLjx//rzqOGpQ7AAAQIBITk7W6XSlpaVBu3QsxQ4AAASI\nm266qVevXiKSnp7udDpVx1GAYgcAAAJHamqqiBw+fHj9+vWqsyhAsQMAAIGjT58+LVu2FJGM\njAzVWRSg2AEAgMCh0+mSkpJEZNWqVUeOHFEdx9sodgAAIKCMHTs2NDTU6XQG4dKxFDsAABBQ\nYmJiHn/8cRGZPXt2WVmZ6jheRbEDAACB5qmnnhKRvLy8ZcuWqc7iVRQ7AAAQaG677bY77rhD\ngu8WCs3lcqnOUGNOp9PHz6zqdDqz2VxaWqo6iO8yGo0Gg8H3/ynVMpvNdrvd4XCoDuKj3C80\nESkrKwvON6yqDr1ebzAYeKF5YDabdTqdw+GwWq2qs/iukJAQq9XqXy+07OzsCRMmiMjGjRvd\nJa/+6PV6k8kkIl741e90OsPDwyv7rL8WO5vNpjqFJzqdzmg0MpN6YDAY9Hq97/9TqmUymRwO\nB8WuMpqmuWdSq9Xqj1OZd+j1er1eT2XxwGg0uoud3W5XncV3mc1mm83mX8WurKysTZs2Z8+e\nTUxMnDZtWr0+l/v3vvtJ6/WJRMTlcoWEhFT2WX8tdnl5eapTeGI0GqOionJzc1UH8V0REREh\nISE2m62goEB1Ft8VExNjsVgsFovqID7KYDDExMSISH5+Pr+SK2M2m0NDQ/Pz81UH8V3R0dFG\no9FisRQXF6vO4rtiY2MLCwv97k/xN95447333gsJCdm1a1fDhg3r74lMJlNUVJSI5ObmeqFZ\nxcXFVfYprrEDAACBKTk5Wa/XWyyWuXPnqs7iJRQ7AAAQmFq0aNG3b18RSU9PD5LLWih2AAAg\nYLmXjj169OgXX3yhOos3UOwAAEDA6tmzZ+vWrUUkPT1ddRZvoNgBAICApWmae+nYzz///NCh\nQ6rj1DuKHQAACGSjR48OCwtzuVzBsHQsxQ4AAASy6OjoYcOGiUh2dnbArx1AsQMAAAEuLS1N\nRPLz85cuXao6S/2i2AEAgADXqVOne+65R0SmT5+uOkv9otgBAIDA537fk++++2779u2qs9Qj\nih0AAAh8AwcOvOGGG0QkIyNDdZZ6RLEDAACBz2QyjR07VkSWLl169uxZ1XHqC8UOAAAEheTk\nZKPRaLVas7OzVWepLxQ7AAAQFJo0adK/f38RmTlzZqAuHUuxAwAAwSIlJUVEjh07tmrVKtVZ\n6gXFDgAABItu3bp16NBBAvcWCoodAAAIIomJiSKyfv36gwcPqs5S9yh2AAAgiCQkJERGRrpc\nrszMTNVZ6h7FDgAABJGIiIgnnnhCRObNm1dSUqI6Th2j2AEAgOCSmpqqaVphYeHChQtVZ6lj\nFDsAABBc2rVrd//990sgLh1LsQMAAEHHvXTsvn37tmzZojpLXaLYAQCAoPPoo482bdpURNLT\n01VnqUsUOwAAEHQMBsO4ceNE5JNPPjl16pTqOHWGYgcAAIJRYmKi0Wi02WyBtHQsxQ4AAASj\nxo0bP/rooyKSlZVls9lUx6kbFDsAABCk3LdQnDp16rPPPlOdpW5Q7AAAQJC6//77O3bsKAF0\nCwXFDgAABK/k5GQR2bhx4w8//KA6Sx2g2AEAgOA1YsSIqKgoEZk5c6bqLHWAYgcAAIJXeHj4\nyJEjRWT+/PlFRUWq41wvih0AAAhqEyZM0DStuLh4wYIFqrNcL4odAAAIaq1aterWrZuIpKen\nu1wu1XGuC8UOAAAEu5SUFBE5cODApk2bVGe5LhQ7AAAQ7AYMGBAfHy/+/74nFDsAABDs9Hp9\nYmKiiKxYseLEiROq49QexQ4AAEDGjRtnNpvtdvvs2bNVZ6k9ih0AAIDExsYOGjRIRGbNmmW1\nWlXHqSWKHQAAgMivt1CcOXNm+fLlqrPUEsUOAABAROTuu+++/fbbxZ9voaDYAQAAXOReOnbL\nli27d+9WnaU2KHYAAAAXDR8+vEGDBuK3S8dS7AAAAC4KCQlJSEgQkQULFuTn56uOU2MUOwAA\ngMtSUlJ0Ol1paWlOTo7qLDVGsQMAALjspptu6tmzp4jMmDHD6XSqjlMzFDsAAICrpKamisjh\nw4c3bNigOkvNUOwAAACu0rdv3xtvvFFEMjIyVGepGYodAADAVXQ6XVJSkoisWrXq6NGjquPU\nAMUOAACgvDFjxpjNZofDMWvWLNVZaoBiBwAAUF7Dhg2HDh0qIrNmzSorK1Mdp7oodgAAABWY\nMGGCiOTl5f3nP/9RnaW6KHYAAAAV6Ny5c9euXcWvbqGg2AEAAFQsJSVFRLZt27Zz507VWaqF\nYgcAAFCxYcOGxcXFiUhmZqbqLNVCsQMAAKiYyWQaPXq0iCxevDgvL091nKpR7AAAACqVnJys\n1+stFsu8efNUZ6kaxQ4AAKBS8fHxffr0EZHMzEzfXzqWYgcAAOCJe+nYn3/++YsvvlCdpQoU\nOwAAAE969erVunVrEUlPT1edpQoUOwAAAE80TRs/fryIrFmz5tChQ6rjeEKxAwAAqMKTTz4Z\nFhbmcrlmz56tOosnFDsAAIAqREdHDxs2TETmzJlTWlqqOk6lKHYAAABVS0tLE5H8/Pxly5ap\nzlIpih0AAEDVOnXqdPfdd4vItGnTVGepFMUOAACgWtzve/Ldd99t375ddZaKUewAAACqZdCg\nQY0aNRKRjIwM1VkqRrEDAACoFpPJNHbsWBFZunTpuXPnVMefzGBiAAAR+klEQVSpAMUOAACg\nusaPH28wGKxWa3Z2tuosFaDYAQAAVFfz5s379+8vIllZWQ6HQ3Wc8ih2AAAANZCSkiIix44d\nW716teos5VHsAAAAaqB79+7t27cXn7yFgmIHAABQM+6lY9etW3fw4EHVWa5CsQMAAKiZhISE\nyMhIl8uVlZWlOstVKHYAAAA1ExERMXz4cBGZN29eSUmJ6jiXUewAAABqLC0tTdO0goKCRYsW\nqc5yGcUOAACgxtq1a3ffffeJSHp6uuosl1HsAAAAasO9dOzevXu//vpr1VkuotgBAADUxmOP\nPda0aVMRmT59uuosF1HsAAAAasNgMLiXjl22bNmRI0dUxxGh2AEAANRaYmKiXq+32WytWrWK\njIx84okndu3apTAPxQ4AAKCW3nrrLfeKsQ6Ho7i4eMOGDf369VuyZImqPBQ7AACA2ti8efOc\nOXOu3ON0OjVNe+GFFy5cuKAkEsUOAACgNpYvX65pWrmdTqezsLBw06ZNSiJR7AAAAGrj7Nmz\n1xY7t9OnT3s5jBvFDgAAoDZuuOEGl8tV4aeaNGni5TBuFDsAAIDaGDhw4LXFTqfTRUdHP/DA\nA0oiUewAAABq4957701OThYRne5ioXJ/8O6774aFhSmJRLEDAACopalTp2ZkZHTp0sVsNsfE\nxPTr12/t2rWDBg1Slceg6okBAAACwKBBg4YPHx4ZGalpWm5ubmVX3XkHZ+wAAACuV2W3x3oZ\nxQ4AACBAUOwAAAACBMUOAAAgQFDsAAAAAgTFDgAAIEBQ7AAAAAIExQ4AACBAUOwAAAACBMUO\nAAAgQFDsAAAAAgTFDgAAIEBQ7AAAAAIExQ4AACBAUOwAAAACBMUOAAAgQFDsAAAAAoTBW0/k\nXDfv/Y837DhapG9/6z1JzyW3Civ/1Kc3vzzhL99duSclM2dIbIi3EgIAAPg3LxW7Q4teeXf+\nL2Of/U1KA/vyD//18vPW7A+fLXe2MH9nfmjsoN9O6HRpT8tIo3fiAQAABACvFDuX9Z35P7Qe\n/faIvq1FpM1UbUTi1OzjSeOah1951JnvC2M6PvDAA50q+SoAAADwxBvX2JUVbDhicfTr19y9\naY55qGuEafu6U+UO21lY1qBrjKO08NSZfJcXYgEAAAQWb5yxs17YLSIdwy7/v2qHMMPK3QUy\n5qrDvi22uTa+N/If+2wulyG8Uf8nf/v0oM6XPrts2bK9e/e6Pw4NDZ04caIXkteaTqfTNC0i\nIkJ1EN9lNBpFRK/X81PyQKfTmc1mg8Fr18L6GU3T3B+EhYU5nU61YXyWXq/X6XS80DzQ6/Ui\nYjQa+Sl5oGlaaGio2WxWHcRHuUeRiISHh3s+8vp5nu688QvDWXZBRGINl88Oxhn19mLLlcc4\nrMeL9cab4h54K/vPMa6iLZ9m/N/0V8xtZyW1j3EfsHXr1pUrV7o/btCgwfPPP++F5NcpJIQ7\nP6qg0+n4KXmm0+ncJRgemEwm1RF8HS+0Kun1+ku/m1EhXmjV4YXXmsPh8PBZbxQ7nSlURM7b\nnRG/vmZybQ59zFXjQ29qnpOT8+uWuduoFw+s3L52xp6ktx9y72rWrFmHDh3cH0dERNjtdi8k\nrzVN0/R6vY+HVEun0+l0OpfL5XmABjm9Xu9yuTgXVRn3C01EHA6Hy8UVHBXTNE2n0/FC80Cv\n12ua5nQ6ea15YDAYeKF5cGk68sKvfqfT6eGPEG8UO2P4bSIb9pfa480Xc/xYao9+KMbzo7o2\nDl2Td/bS5qRJkyZNmuT+2Ol05uXl1VPaOmE0GqOiovLz81UH8V0REREhISF2u72goEB1Ft8V\nExNjsVgsFkvVhwYlg8EQExMjIkVFRfwdVRmz2RwaGsp05EF0dLTRaLRarcXFxaqz+K7Y2Nji\n4mKbzaY6iI8ymUxRUVEiUlBQ4IX6GxcXV9mnvHHzREhMr2Ym/Wcbz7g3bRd2flNkvaNvkyuP\nyT/wr9S0Z09ZL/215Fx/oiSm4y1eiAcAABAYvLLyhGZ64Yn2B7NeW7N9/8lDezIm/zWsaZ/E\nFhEicmjhnMxZH4tIVKtRsSWnX3rtw6179v+4d+e8v7244ULkU2kUOwAAgOry0t12bUZNmVT2\nt3nvTs61aK1v7zHlzxPcjfL42hWf5LVIThykM8S98a/XMz/Ifm/KKxZ9ZKu2t7747mtdI7hm\nHAAAoLo0f7wQ0l+uscvNzVUdxHe5r7Gz2WxcY+cB19h5dukau/z8fK6xqwzX2FXJfY2dxWLh\nGjsPYmNjCwsLucauMpeuscvNzVV7jR3vj1UvnE4no9+zQ4cO5efnh4aGxsfHq87iu+x2O7fp\neVBSUvL999+LyE033cQbMVTG6XTSej3bu3dvSUlJdHR048aNVWfxXTabzR/PBHnN+fPn9+zZ\nIyJt2rTR6bxynVsl/PKMHQLAlClTli5descdd0ybNk11FvirgwcPJiQkiEh2dna7du1Ux4G/\neuaZZ7Zt2zZ48ODJkyerzgJ/tW7duhdeeEFE1q9f74X3KPZAZakEAABAHaLYAQAABAiKHQAA\nQIDgGjuo8f333584caJBgwZ33nmn6izwV8XFxV9//bWI3HvvvZGRkarjwF/t2LEjLy+vWbNm\nHTt2VJ0F/urMmTO7d+8WkZ49exoMKu9MpdgBAAAECP4rFgAAIEBQ7AAAAAIEb1CM+nL4q4XZ\nn276fv/x6Bbthqb+7uHbGoqIy35+yfQPV2zalWvRNY1vO3jcM/27Nin3wNObX57wl++u3JOS\nmTMkNsR70eEzKhxF1RshznXz3v94w46jRfr2t96T9FxyqzCmuyB17SgqOv7XMRPXlzvMFH77\nwrlvXLmHuQhuHgdMdaYar05HzHSoF+e2Z/xu6icDkie9ktj0wLqZ77/2+6azp98WZlz1Py9k\nfx+V9NR/tW8Wvvvzue+/9mzpP2cOiY+48rH5O/NDYwf9dkKnS3taRrJqcDCqbBRVZ4QcWvTK\nu/N/Gfvsb1Ia2Jd/+K+Xn7dmf/gs/0MRhCocRR0bDvrDH+6/8rCvM977sVO/co9lLoJbWOUD\npjpTjbenIxdQD15/cvikD3b/uuV499VXpu08Z7ccGTJ48Lt78n7d7/xH4ojxf9hc7rEbfjP2\nqal7vBYVPqvCUeSqzghxlj07Ysjz8w+6tyznvxw0aNCsY8X1mha+qbJRdKX8/XOHJ/wh1+Ys\nt5+5CBW6PGCqM9V4fTriL1jUPWvR5m1F1gEj2v66Q/e7196YcHusw/Jzy5tvfrRV1K/7ta7R\nZlt++VW3dxaWNega4ygtPHUmn3u2g1Zlo0iqMULKCjYcsTj69Wvu3jTHPNQ1wrR93SmvBIcP\n8TCKLnE5it55feGjL7/Y0KCVezhzEa515YCpzlTj/emI/4pF3bMWbhWRxnuXvzTvk59OlTZu\n2Xpg4nOPdGliiu72t791u3SYrXhfxonilsnll/j8ttjm2vjeyH/ss7lchvBG/Z/87dODOnv1\nG4APqGwUSTVGiPXCbhHpGHb5f806hBlW7i6QMd79HqCah1F0yaElbxyMHfL6rQ2ufThzEa51\n5YCpzlTj/emIM3aoe46yQhF55/0v7xsx8c0pf+zXTvvg1YlLj151Zu6XbZ/+YeIrtlaPvDyg\nxVWPtR4v1hsbxT3w7+ychdkZzw9pt3z6K1n78r36DcAHVDaKqjNCnGUXRCTWcHl+izPq7cUW\nL38LUK7KuchpPfnm3B+HvjS0gscyF+Ea5QZMdaYa709HnLFD3dMZ9CLS69VXh7ZvICLtOtx+\nctPIpe/vGfKX+0TEen5/xj/eW/FtXo8nJr75ZO8Q7ar//tCbmufk5Py6Ze426sUDK7evnbEn\n6e2HvPxdQC0Po6jKEaIzhYrIebszQq9378m1OfQxJu9+B1DP81wkIkc/fac4vMcTzcOvfSxz\nEa5VbsBUZ6rx/nTEGTvUPUNYWxHp0fLyEk/3Ng0rO3dCRIp++fw3T/1hl9w+dXrm78f0Kdfq\nKtS1cait8Gz9pYVv8jCKyrl2hBjDbxOR/aX2S3t+LLVH3xpTX1nhq6oaRa6ZCw63Gj28ml+N\nuSjolR8w1ZlqvD8dUexQ90Ia9G9g0K0+UHBx2+VYd7wksnVrl7PkzZfeN/f5r/cnP9UuruL3\ngso/8K/UtGdPWZ2/7nCuP1ES0/EWb+SGL6lsFFVnhITE9Gpm0n+28Yx703Zh5zdF1jv6ln/H\nRAS8ykaRe6vkzIJtRdbknk0rfCxzEcq5dsBUZ6rx/nSkf+211+rvqyM4aTpzu7Lt6emrzI0b\nGy3nPs/+6ycHSp6dkhpbMOeDxT8MG9bnwplTJ3515nxYkxtCDi2cs3TbL11vb2eKbrUpZ/7S\nnXktGkeVnD22+qO/fnrQ+fs3xjc16VV/W/CqykZR68ZtKxshl0aRaPr2zl3zP1oe17p9qOXU\nvKn/d9z80J/HdK/6/DACS2WjKD7EICK/LPjwi2NtJo3qdeVDmItQmQoGTOVTjcLpSHO5uIkb\n9cBlXzX7vUVrvjlXZmrZusPA8ZN6t4s+tfHlp6Z+V+7AqPg/zfnXfV9OGvO3vBaL5r0lImXn\n92Z+kP3Vrh8t+shWbW8dkvLU/TdGVPQcCHQVjSKpfIRcOYrE5Vg962/zV3+Ta9Fa397jmd9P\naBPOJcVBqZJRJCLpyaO+av5CxpS7rzycuQiVqXDAVDbVKJyOKHYAAAABgmvsAAAAAgTFDgAA\nIEBQ7AAAAAIExQ4AACBAUOwAAAACBMUOAAAgQFDsAAAAAgTFDgDq0fxXRsc3iohrk1LhJgDU\nLYodANTAmS2vDBo0aFOhtToHXzg1PeHNeYaHJr79+phrNwGgzrHGDgDUQMmpzZ98sjbZ5qjO\nwaVnl4vIhPcmJ8VHXrsJAHWOM3YAUF9cTqeImHVahZsAUOcodgCC1Mmvskf2uys2MiQsutF9\nj4xZsPWse/+L8VFR8S9eeeTO1+/UNO3nMsf/3Bxz85C1IjI8LuzSMae35Ix55P5GMRGm8Ohb\n7u7756x17v1LOzW6ocvHIvJCi8jwRiPKbXrruwQQXCh2AILRqY1T2vZIXP6dYeTTL/2/ZxIu\nbF2c8GD79MOFnh81eubimZO7iMgrOf9ZMidNRM5ue/uWh0Yv+DLvsTHPvvLc+JbF219N7tXv\nv9eLyAPTcua/f5+ITJizZFnOy+U26/07BBCUuMYOQPBxWccNftMZ8/COn/7TPtwoIn986Ynm\nTXq/8uSnqZsTPDzu5u69tfMNRaRr7759YkNFXL957NVSU7vPD27r1iRMRJxTJr94T4d3/mfA\nl/+voNuDvXpFNBKRdj379m0eISLlNgGgznHGDkDQKTr+7przljun/t3d6kQkpGGPpf/+53+n\nxtXo65SeW5xzpqTdhEx3qxMRnSHu5Y+SXE7Lq58dq+PQAFANFDsAQafwxy9E5MHeja/c2S11\n4qS0vjX6OpbzK0WkVeLNV+6MiE8UkZOrTl1vSgCoOYodgKDjLHOKiEmr7t2pLqerss9cu0vT\nDCLislf2EACoRxQ7AEEn6pY7ROSrb85duXPtSxOT0/7069ZVb1N3eltehV8npEF/ETmc/fOV\nO4uPzRaRxn0aV/gQAKhXFDsAQSeq5R9vjzBt+a8XDlsuFjhrwebEv0//5JsbRCRMr7PkLT9n\nc7o/Zcn9etLa4+W+gsslIhIaN3xYo7B9H6ZuPmu5uN+e95cxMzSdefLAeO98LwBwJe6KBRB0\nNH30sjmT2g79+21teiSP7d/EmL9k+gcnHeH/WpgkIoPH3fL6lK239058cWxv26l9We/8/XSc\nSY7Z3Y81RhpFZNo/ZpR1uOfJhHv//fF/r3rw5Z6t7xyfOvTmiNL1izM/+/5875c/7xNjVvgN\nAgheLgAISgdXfDC4261RYUZzeIM7eo+avemke7/TceGfvx/drmUTo6aJSPMHEzduekREDlvs\nLpfLWrxz4B03hegNTTu/7j7+xMbshH73xEaFGkIiW9/R6/XMLy49xZmdg0Tk7WNFFW4CQJ3T\nXC6u8AWACjjLCo+dtd/YoqHqIABQXRQ7AACAAMHNEwAAAAGCYgcAABAgKHYAAAABgmIHAAAQ\nICh2AAAAAYJiBwAAECAodgAAAAGCYgcAABAgKHYAAAABgmIHAAAQICh2AAAAAYJiBwAAECD+\nP6pP5AapHJOiAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# examine the accuracy of 10 cutoffs\n",
    "cutoff <- seq(61, 70)\n",
    "accuracy <- map_dbl(cutoff, function(x){\n",
    "  y_hat <- ifelse(train_set$height > x, \"Male\", \"Female\") %>% \n",
    "    factor(levels = levels(test_set$sex))\n",
    "  mean(y_hat == train_set$sex)\n",
    "})\n",
    "data.frame(cutoff, accuracy) %>% \n",
    "  ggplot(aes(cutoff, accuracy)) + \n",
    "  geom_point() + \n",
    "  geom_line() \n",
    "max(accuracy)\n",
    "\n",
    "best_cutoff <- cutoff[which.max(accuracy)]\n",
    "best_cutoff\n",
    "\n",
    "y_hat <- ifelse(test_set$height > best_cutoff, \"Male\", \"Female\") %>% \n",
    "  factor(levels = levels(test_set$sex))\n",
    "y_hat <- factor(y_hat)\n",
    "mean(y_hat == test_set$sex)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 7.794198,
   "end_time": "2022-07-02T07:06:32.942444",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-07-02T07:06:25.148246",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
