From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 1/6] soc: qcom: rpmpd: Add a powerdomain driver to
 model corners
Date: Thu, 31 May 2018 09:23:53 +0530
Message-ID: <e64cdb1b-6ebe-f8aa-d50d-dd925ca34ba7@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-2-rnayak@codeaurora.org>
 <CAPDyKFoAJjZknWtbbQLn0Hnc3Du_1vnSUnqfwZLYK76j2rg52g@mail.gmail.com>
 <0e07d577-9728-e97a-2da0-dd7dd324f058@codeaurora.org>
 <7432f626-69cd-3535-04bc-de42e0285d41@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7432f626-69cd-3535-04bc-de42e0285d41@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On 05/30/2018 11:57 PM, David Collins wrote:
> Hello Rajendra,
> 
> On 05/30/2018 03:14 AM, Rajendra Nayak wrote:
>> On 05/30/2018 02:47 PM, Ulf Hansson wrote:
>>> On 25 May 2018 at 12:01, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> ...
>>>> +               pm_genpd_init(&rpmpds[i]->pd, NULL, true);
>>>
>>> Question: Is there no hierarchical topology of the PM domains. No
>>> genpd subdomains?
>>
>> The hierarchy if any is all handled by the remote core (RPM in this case).
>> For Linux its just a flat view.
> 
> There is one special case that we'll need to handle somehow.  The APPS
> vlvl request for VDD_MX needs to be greater than or equal to the vlvl
> request for VDD_CX.  Can you please add the necessary code to achieve
> this?  RPMh hardware doesn't handle this hardware requirement due to
> concerns about modem use case latency.

Sure, I'll take a look at it.

> 
> Please note that this is handled in a somewhat hacky manner [1] with the
> downstream rpmh-regulator driver by specifying VDD_MX as the parent of
> VDD_CX and VDD_MX_AO as the parent of VDD_CX_AO with a dropout voltage of
> -1.  That way, enabling CX causes MX to be enabled and voltage level
> requests are propagated from CX to MX (the -1 is ignored because it is
> rounded up within the sparse vlvl numbering space).

I can't see how else to handle this but with a fake parent/child relation,
which also means we might need support to propagate performance states for
power domains up the parents, which I think was initially supported but
later dropped since we thought this wasn't needed for now.
We might need to take a re-look at it to support this usecase.

thanks,
Rajendra

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
