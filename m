From: Gilad Avidov <gavidov@codeaurora.org>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Fri, 07 Nov 2014 17:08:10 -0700
Message-ID: <545D5EEA.8020800@codeaurora.org>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>	 <CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>	 <1415212271.14949.1.camel@mm-sol.com>	 <CAJAp7OgXHGWQj7MWh51LTUdmZpgZc=6m=o-Az=z8QxR7yfrw7g@mail.gmail.com> <1415260480.13103.3.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1415260480.13103.3.camel@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn@kryo.se>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/6/2014 12:54 AM, Ivan T. Ivanov wrote:
> On Wed, 2014-11-05 at 17:36 -0800, Bjorn Andersson wrote:
>> On Wed, Nov 5, 2014 at 10:31 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
>>> On Wed, 2014-11-05 at 10:11 -0800, Bjorn Andersson wrote:
>>>> On Tue, Nov 4, 2014 at 5:33 AM, Ivan T. Ivanov <iivanov@mm-sol.com>
>>>> wrote:
>>>> [..]
>>>>> @@ -28,11 +144,27 @@ static int pmic_spmi_probe(struct spmi_device
>>>>> *sdev)
>>>>>   {
>>>>>          struct device_node *root = sdev->dev.of_node;
>>>>>          struct regmap *regmap;
>>>>> +       struct property *prop;
>>>>> +       int major, minor, ret;
>>>>> +       char *name, compatible[32];
>>>>>
>>>>>          regmap = devm_regmap_init_spmi_ext(sdev,
>>>>> &spmi_regmap_config);
Hi Ivan, I have a general question about this driver/layer.
Since the driver is using regmap, why does it need to be 
qcom-*spmi*-pmic ? could we drop the spmi part?
regmap's point is abstraction of  the bus technology, and indeed some 
PMICs use i2c.

>>>>>          if (IS_ERR(regmap))
>>>>>                  return PTR_ERR(regmap);
>>>>>
>>>>> +       ret = pmic_spmi_read_revid(regmap, &name, &major, &minor);
>>>>> +       if (!ret) {
>>>>> +               snprintf(compatible, ARRAY_SIZE(compatible),
>>>>> "qcom,%s-v%d.%d",
>>>>> +                        name, major, minor);
>>>>> +               prop = kzalloc(sizeof(*prop), GFP_KERNEL);
>>>>> +               if (prop) {
>>>>> +                       prop->name = kstrdup("compatible",
>>>>> GFP_KERNEL);
>>>>> +                       prop->value = kstrdup(compatible,
>>>>> GFP_KERNEL);
>>>>> +                       prop->length = strlen(prop->value);
>>>>> +                       of_update_property(root, prop);
>>>>> +               }
>>>>> +       }
>>>>> +
>>>> Why would you do this?
>>>> What benefit does it give to patch the of_node to have a more
>>>> specific
>>>> compatible?
>>> Some of the child device drivers have to know PMIC chip revision.
>>>
>> So your plan is to have a strstr(parent->compatible, "-v2") there?
> Actually also PMIC subtype (pm8841, pm8226...) is also required, so
> the plan is to have something like this:
>
> {
>          static const struct of_device_id pmic_match_table[] = {
>                  { .compatible = "qcom,pm8941-v1.0" },
>                  { .compatible = "qcom,pm8841-v0.0" },
>                  { }
>
>          };
>
>          const struct of_device_id *match;
>
>          match = of_match_device(pmic_match_table, pdev->dev.parent);
>          if (match) {
>                  dev_info(&pdev->dev, "%s chip detected\n", match->compatible);
>          }
> }
>
>> Could you be a little bit more elaborate on what you're trying to do
>> and which child devices that might be?
> For example ADC drivers are required temperature compensation based
> on PMIC variant and chip manufacturer.
>
> This patch have one issue, at least :-). Using of_update_property will prevent
> driver to be build as module. which, I think, is coming from the fact the
> on first load it will modify device compatible property and will be impossible
> driver to match device id again. Still thinking how to overcome this.
>
> Regards,
> Ivan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
