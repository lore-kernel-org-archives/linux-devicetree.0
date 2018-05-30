From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 1/6] soc: qcom: rpmpd: Add a powerdomain driver to
 model corners
Date: Wed, 30 May 2018 14:44:25 +0200
Message-ID: <CAPDyKFpuZ4s7C+Nr3NhU-A40oVw84yK7eEniO6NhHNJ3VosR-A@mail.gmail.com>
References: <20180525100121.28214-1-rnayak@codeaurora.org> <20180525100121.28214-2-rnayak@codeaurora.org>
 <CAPDyKFoAJjZknWtbbQLn0Hnc3Du_1vnSUnqfwZLYK76j2rg52g@mail.gmail.com> <0e07d577-9728-e97a-2da0-dd7dd324f058@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e07d577-9728-e97a-2da0-dd7dd324f058@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, collinsd@codeaurora.org
List-Id: devicetree@vger.kernel.org

[...]

>>> +
>>> +static DEFINE_MUTEX(rpmpd_lock);
>>> +
>>> +/* msm8996 RPM powerdomains */
>>> +DEFINE_RPMPD_CORN_SMPA(msm8996, vddcx, vddcx_ao, 1);
>>> +DEFINE_RPMPD_CORN_SMPA(msm8996, vddmx, vddmx_ao, 2);
>>> +DEFINE_RPMPD_CORN_LDOA(msm8996, vddsscx, 26);
>>> +
>>> +DEFINE_RPMPD_VFC_SMPA(msm8996, vddcx_vfc, 1);
>>> +DEFINE_RPMPD_VFC_LDOA(msm8996, vddsscx_vfc, 26);
>>> +
>>> +static struct rpmpd *msm8996_rpmpds[] = {
>>> +       [0] = &msm8996_vddcx,
>>> +       [1] = &msm8996_vddcx_ao,
>>> +       [2] = &msm8996_vddcx_vfc,
>>> +       [3] = &msm8996_vddmx,
>>> +       [4] = &msm8996_vddmx_ao,
>>> +       [5] = &msm8996_vddsscx,
>>> +       [6] = &msm8996_vddsscx_vfc,
>>> +};
>>
>> It's not my call, but honestly the above all macros makes the code
>> less readable.
>
> This is all static data per SoC. The macros will keep the new additions
> needed for every new SoC to a minimal. Currently this supports only
> msm8996.

Right, that's fine then.

>
>>
>> Anyway, I think you should convert to allocate these structs
>> dynamically from the heap (kzalloc/kcalloc), instead of statically as
>> above.

However, I assume this is still doable!?

[...]

>>> +       for (i = 0; i < num; i++) {
>>> +               if (!rpmpds[i])
>>> +                       continue;
>>> +
>>> +               rpmpds[i]->rpm = rpm;
>>> +               rpmpds[i]->pd.power_off = rpmpd_power_off;
>>> +               rpmpds[i]->pd.power_on = rpmpd_power_on;
>>> +               pm_genpd_init(&rpmpds[i]->pd, NULL, true);
>>
>> Question: Is there no hierarchical topology of the PM domains. No
>> genpd subdomains?
>
> The hierarchy if any is all handled by the remote core (RPM in this case).
> For Linux its just a flat view.

Okay, thanks for clarifying!

Kind regards
Uffe
