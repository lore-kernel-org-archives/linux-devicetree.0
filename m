From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v1 1/4] clk: qcom: smd: Add XO clock for MSM8998
Date: Tue, 5 Feb 2019 15:37:57 -0700
Message-ID: <f3b80293-a1fc-ad47-e681-a3a3ed782b0c@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
 <1548866144-30265-1-git-send-email-jhugo@codeaurora.org>
 <154940408967.169292.15276398799323074789@swboyd.mtv.corp.google.com>
 <6e62a49a-fdb1-a087-fe83-e86aed969ae7@codeaurora.org>
 <154940592132.169292.15811923452101983358@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154940592132.169292.15811923452101983358@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

On 2/5/2019 3:32 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-02-05 14:15:16)
>> On 2/5/2019 3:01 PM, Stephen Boyd wrote:
>>> Quoting Jeffrey Hugo (2019-01-30 08:35:44)
>>>> The XO clock generally feeds into other clock controllers as the parent
>>>> for a lot of clock generators.
>>>>
>>>> Fixes: 6131dc81211c (clk: qcom: smd: Add support for MSM8998 rpm clocks)
>>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>
>>> We've historically left out the XO clk because it causes problems where
>>> the XO vote goes away during late init because nobody references it from
>>> the rest of the clk tree and also because RPM defers probe of the system
>>> and then the console blows up when it gets a clk that can't change rate.
>>> See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
>>> clocks") for some more info on why we removed all the workarounds and
>>> stuff around here too.
>>>
>>> So are you sure this is OK to do?
>>>    
>>>
>>
>> So, I've got pretty much everything as modules, and I haven't seen any
>> issues.  However let me take a look at the commit you point out and see.
>>
> 
> Is the name of the clk "xo_clk_src"? That isn't the name that we were
> expecting the XO clk from RPM to be called. You might have to look back
> at the history of the rpm clk driver on the list and see when Georgi
> dropped the XO clk from it and if there was anything wrong with that. I
> can't recall if this was discussed on the list or if he just told me in
> some hallway conversation at Connect.
> 

Will do.  Thanks for pointing out the history.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
