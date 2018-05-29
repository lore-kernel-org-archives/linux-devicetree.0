From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: opp: Introduce qcom-opp bindings
Date: Tue, 29 May 2018 15:19:54 +0530
Message-ID: <9786fd42-b48a-757f-97cb-0ca65c2f030e@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-3-rnayak@codeaurora.org>
 <67054dca-33a8-7e7c-6218-dc5abf84f6d8@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <67054dca-33a8-7e7c-6218-dc5abf84f6d8@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 05/26/2018 04:03 AM, David Collins wrote:
> Hello Rajendra,
> 
> On 05/25/2018 03:01 AM, Rajendra Nayak wrote:
>> On Qualcomm platforms, an OPP node needs to describe an
> 
> s/Qualcomm/Qualcomm Technologies, Inc./
> 
> 

[] ..

> 
> s/Qualcomm/Qualcomm Technologies, Inc./ ?
> 
> s/descibe/describe/
> 
> 
>> +
>> +OPP tables for devices on Qualcomm platforms require an additional
> 
> s/Qualcomm/Qualcomm Technologies, Inc./
> 
> 
>> +platform specific corner/level value to be specified.
>> +This value is passed on to the RPM (Resource Power Manager) by
> 
> Do you want to mention RPMh here as well?
> 
> 

[] ..

>> +
>> +Required properties:
>> +- qcom,level: On Qualcomm platforms an OPP node can describe a positive value
> 
> s/Qualcomm/Qualcomm Technologies, Inc./
> 
> 
>> +representing a corner/level that's communicated with a remote microprocessor
>> +(usually called the RPM) which then translates it into a certain voltage on
>> +a voltage rail.
> 
> Should these lines be indented 2 spaces as is the case for the compatible
> property above?
> 
> Could you add an example for both RPM and RPMh in this binding file?

Thanks David for the review. I will fix all this up when I respin.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
