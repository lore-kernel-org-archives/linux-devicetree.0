From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v6 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Tue, 11 Dec 2018 16:03:23 +0530
Message-ID: <00d91f90-ccf1-3486-0d42-0c4105058e61@codeaurora.org>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
 <20181211094938.25086-11-rnayak@codeaurora.org>
 <CAPDyKFof-rkzmzibWOrAhDFysU=y+C8Bp0cK=_iht4=vmv-0vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFof-rkzmzibWOrAhDFysU=y+C8Bp0cK=_iht4=vmv-0vw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 12/11/2018 3:52 PM, Ulf Hansson wrote:
> On Tue, 11 Dec 2018 at 10:50, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> Specify the active + sleep and active-only MX power domains as
>> the parents of the corresponding CX power domains. This will ensure that
>> performance state requests on CX automatically generate equivalent requests
>> on MX power domains.
>>
>> This is used to enforce a requirement that exists for various
>> hardware blocks on SDM845 that MX performance state >= CX performance
>> state for a given operating frequency.
> 
> I assume that also means the MX power domain must not be power off as
> long as the CX power domain is powered on?

So with rpmh, there's really no separate on/off control, we just put
it in the lowest perf state at off.

> 
> Just to make sure there are no conflicting hierarchical constraints
> between idle management and performance state management!?
> 
> Kind regards
> Uffe
> 
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>> This patch is dependent on the series from
>> Viresh [1] which adds support to propogate performance states across the
>> power domain hierarchy which is still being reviewed.
>>
>> [1] https://lkml.org/lkml/2018/11/26/333
>>
>>   drivers/soc/qcom/rpmhpd.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> index 1ce86f0cc9fa..af7b07d49e4f 100644
>> --- a/drivers/soc/qcom/rpmhpd.c
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -102,12 +102,14 @@ static struct rpmhpd sdm845_cx_ao;
>>   static struct rpmhpd sdm845_cx = {
>>          .pd = { .name = "cx", },
>>          .peer = &sdm845_cx_ao,
>> +       .parent = &sdm845_mx.pd,
>>          .res_name = "cx.lvl",
>>   };
>>
>>   static struct rpmhpd sdm845_cx_ao = {
>>          .pd = { .name = "cx_ao", },
>>          .peer = &sdm845_cx,
>> +       .parent = &sdm845_mx_ao.pd,
>>          .res_name = "cx.lvl",
>>   };
>>
>> @@ -389,6 +391,15 @@ static int rpmhpd_probe(struct platform_device *pdev)
>>                  data->domains[i] = &rpmhpds[i]->pd;
>>          }
>>
>> +       /* Add subdomains */
>> +       for (i = 0; i < num_pds; i++) {
>> +               if (!rpmhpds[i])
>> +                       continue;
>> +               if (rpmhpds[i]->parent)
>> +                       pm_genpd_add_subdomain(rpmhpds[i]->parent,
>> +                                              &rpmhpds[i]->pd);
>> +       }
>> +
>>          return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
>>   }
>>
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
