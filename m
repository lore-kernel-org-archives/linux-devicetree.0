From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [RFC PATCH v2 3/5] rtc: add qpnp rtc driver
Date: Thu, 10 Jul 2014 18:43:03 +0300
Message-ID: <53BEB487.8030309@mm-sol.com>
References: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com> <1404393243-7324-4-git-send-email-svarbanov@mm-sol.com> <CAJAp7Ohis95K9Fw5ff7jfed5YFwRaMqHL-FToPqz7YU_Ux3zEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7Ohis95K9Fw5ff7jfed5YFwRaMqHL-FToPqz7YU_Ux3zEg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 07/10/2014 04:08 PM, Bjorn Andersson wrote:
> On Thu, Jul 3, 2014 at 6:14 AM, Stanimir Varbanov <svarbanov@mm-sol.com> wrote:
> [...]
>> +static const struct of_device_id qpnp_rtc_table[] = {
>> +       { .compatible = "qcom,qpnp-rtc", },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, rtc_qpnp_table);
> 
> We have had a lot of discussions related to how to name pm8x41
> drivers; as they obviously fall under pm8xxx in most peoples eyes.

IMO the pm8xxx is misleading already.

> 
> As you guys have explained, QPNP is defining the split of address
> space and how interrupts are layed out. To me this does however not
> say anything related to the actual functionality; e.g. the rtc in this
> case.
> 
> Are you by this patch saying that this is the one and only rtc
> hardware that will ever be spun under the QPNP umbrella?
> I would expect the naming to be more specific; and definitely the
> compatible to be specific.
> 
> This concern goes for all the qpnp drivers.

QPNP "umbrella" includes 11 PMIC chips according to downstream kernel at
[1]. I think that every driver with qpnp in the name will support the
appropriate sub-function IP on every pmic of that list.

Of course the naming convention can be changed and for rtc we could say
rtc-pm8941 in compatible string.

compatible = "qcom,pm8941-rtc", "qcom,pma8084-rtc", "qcom,qpnp-rtc";

I haven't strong opinion on the naming.

Otherwise, I will do evaluate how difficult will be to merge "rtc-qpnp"
and rtc-pm8xxx. Those rtc peripherals looks similar.

-- 
regards,
Stan

[1]
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/platform/msm/qpnp-revid.c?h=msm-3.10#n27
