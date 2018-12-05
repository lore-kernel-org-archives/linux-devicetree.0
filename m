From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v5 4/8] soc: qcom: rpmpd: Add support for get/set
 performance state
Date: Wed, 5 Dec 2018 15:41:22 +0530
Message-ID: <c1676ab0-5981-52be-18f3-44ee266e195d@codeaurora.org>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-5-rnayak@codeaurora.org>
 <154396526967.88331.13652897075952274639@swboyd.mtv.corp.google.com>
 <d9317471-fb81-482a-22c1-4a7b466a1df4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9317471-fb81-482a-22c1-4a7b466a1df4@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/5/2018 12:33 PM, Rajendra Nayak wrote:
>>
>>> +               return 0;
>>> +       }
>>> +
>>> +       of_node_put(np);
>>
>> This same code exists twice. Perhaps a helper needs to exist for
>> qcom_rpm_get_performance() to pull the number out of the DT.
> 
> Sure I can make both drivers use a common helper instead of duplicating it.

which would mean I will need to create a new file just to define the
common helper. Does that seem like an overkill?
