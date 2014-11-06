From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Thu, 6 Nov 2014 08:55:42 -0800
Message-ID: <CAJAp7OgPGhM=EnMNU2JfjG6Qb-EiWSPSRyZWGicSPmpicBQW7g@mail.gmail.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
	<CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>
	<1415212271.14949.1.camel@mm-sol.com>
	<CAJAp7OgXHGWQj7MWh51LTUdmZpgZc=6m=o-Az=z8QxR7yfrw7g@mail.gmail.com>
	<1415260480.13103.3.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415260480.13103.3.camel@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 5, 2014 at 11:54 PM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
>
> On Wed, 2014-11-05 at 17:36 -0800, Bjorn Andersson wrote:
>> On Wed, Nov 5, 2014 at 10:31 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
[..]
>> > Some of the child device drivers have to know PMIC chip revision.
>> >
>>
>> So your plan is to have a strstr(parent->compatible, "-v2") there?
>
> Actually also PMIC subtype (pm8841, pm8226...) is also required, so
> the plan is to have something like this:
>
> {
>         static const struct of_device_id pmic_match_table[] = {
>                 { .compatible = "qcom,pm8941-v1.0" },
>                 { .compatible = "qcom,pm8841-v0.0" },
>                 { }
>
>         };
>
>         const struct of_device_id *match;
>
>         match = of_match_device(pmic_match_table, pdev->dev.parent);
>         if (match) {
>                 dev_info(&pdev->dev, "%s chip detected\n", match->compatible);
>         }
> }
>

To me this is a hack, you should not alter the devicetree to make it
"better express the hardware". Either you know these things from boot
and they go in device tree, or you can probe them and they should not
go in device tree.

If you really need these values you should expose them through some api.

>>
>> Could you be a little bit more elaborate on what you're trying to do
>> and which child devices that might be?
>
> For example ADC drivers are required temperature compensation based
> on PMIC variant and chip manufacturer.
>

I see, is that compensation of any practical value? Or is the
compensation of academic proportions?

Regards,
Bjorn
