From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH RFC 0/4] DDR/L3 Scaling support on SDM845 SoCs
Date: Wed, 10 Jul 2019 19:44:37 +0530
Message-ID: <d2e3b5bf3aa6ee740f004b7b770bef26@codeaurora.org>
References: <20190627133424.4980-1-sibis@codeaurora.org>
 <20190701092949.afenn2et2qexostt@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701092949.afenn2et2qexostt@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org, agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com, linux-kernel-owner@vger.kernel.org, adharmap@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hey Viresh,

On 2019-07-01 14:59, Viresh Kumar wrote:
> On 27-06-19, 19:04, Sibi Sankar wrote:
>> This RFC series aims to extend cpu based scaling support to L3/DDR on
>> SDM845 SoCs. The patch series depends on "Introduce OPP bandwidth 
>> bindings"
>> series (https://patchwork.kernel.org/cover/10912993/). A part of the
>> series will still be applicable if we decide to go ahead with the 
>> proposal
>> from Saravana as well so I decided to post this out.
>> 
>> v2:
>> * Incorporated Viresh's comments from:
>> [1]https://lore.kernel.org/lkml/20190410102429.r6j6brm5kspmqxc3@vireshk-i7/
>> [2]https://lore.kernel.org/lkml/20190410112516.gnh77jcwawvld6et@vireshk-i7/
> 
> Did you get a chance to look at this ?
> 
> lore.kernel.org/lkml/20190622003449.33707-1-saravanak@google.com

Yes, I have v2 of cpufreq passive governor
patch in the works based on Saravana's
series. I plan on posting it out end of
week. I had sent this series out
since a portion (specifically update_
voltage helper and adding opp_tables
to cpufreq-hw driver) would remain
constant irrespective of the path
we choose.

FWIW, on SDM845 SoCs we cannot use a
rpmh_write_batch based icc_set on
cpufreq fast switch pathw since it
uses the "wait_for_completion" api.


-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
