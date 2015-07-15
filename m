From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: qcom: Add coincell charger driver
Date: Wed, 15 Jul 2015 15:45:47 -0700
Message-ID: <55A6E29B.3070700@sonymobile.com>
References: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com> <1436916380-3599-2-git-send-email-tim.bird@sonymobile.com> <55A5B33A.3070303@codeaurora.org> <55A6AFA1.6080703@sonymobile.com> <55A6B826.7060304@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A6B826.7060304-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?windows-1252?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 07/15/2015 12:44 PM, Stephen Boyd wrote:
> On 07/15/2015 12:08 PM, Tim Bird wrote:
>>
>> On 07/14/2015 06:11 PM, Stephen Boyd wrote:
>>> On 07/14/2015 04:26 PM, Tim Bird wrote:
>>>
>>>>    3 files changed, 166 insertions(+)
>>>>    create mode 100644 drivers/misc/qcom-coincell.c
>>>>
>>>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>>>> index 42c3852..0909869 100644
>>>> --- a/drivers/misc/Kconfig
>>>> +++ b/drivers/misc/Kconfig
>>>> @@ -271,6 +271,17 @@ config HP_ILO
>>>>    	  To compile this driver as a module, choose M here: the
>>>>    	  module will be called hpilo.
>>>>    
>>>> +config QCOM_COINCELL
>>>> +	tristate "Qualcomm coincell charger support"
>>>> +	depends on OF
>>> It looks like it would compile fine without OF, so can we drop this
>>> dependency? Or make it into
>>>
>>>    depends on MFD_SPMI_PMIC || COMPILE_TEST
>>>
>>> ?
>> I think I had CONFIG_OF off one time, and I spent the better
>> part of the afternoon trying to figure out why the driver wasn't
>> loading.  So it compiles but doesn't actually work.
>> But I think a dependency on MFD_SPMI_PMIC solves this issue.
>> So, OK on the second suggestion.
>>
>>>> +	select REGMAP
> 
> This config wouldn't be necessary either then because it would be 
> selected implicitly by the SPMI parent driver.

OK.  I seem to recall having problems with this with an earlier kernel
version, but it looks like the parent does indeed have a "select REMAP_SPMI"
now.  So I'll get rid of this here.

[...]
>>>> +	return rc;
>>>> +}
>>>> +
>>>> +static int qcom_coincell_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device_node *node = pdev->dev.of_node;
>>>> +	struct qcom_coincell *chgr;
>>>> +	u32 rset, vset, enable;
>>>> +	int rc;
>>>> +
>>>> +	if (!node) {
>>>> +		dev_err(&pdev->dev, "%s: device node missing\n", __func__);
>>>> +		return -ENODEV;
>>>> +	}
>>> Does this happen?
>> Probably not any more.  The only way this device gets initialized now
>> is via OF operations.  This code was forward-ported from when this driver
>> also operated as a platform device.  In the current situation, I don't
>> know of a way for the kernel to get here if of_node is missing
>> (but I'm not an OF expert, and I didn't want to start using
>> a NULL of_node.)
>>
>> What does of_property_read...() do with a NULL node?
> 
> I'm pretty sure it returns success or nothing when the node is NULL.
> 
>>
>> I'm a little leery of taking this check out, but if you think it's
>> OK I'm fine doing it.
> 
> I'll fix any problems with the removal of the check :)

LOL. It's a deal! :-)

[...]
>>>> +	if (rc)
>>>> +		enable = 0;
>>>> +
>>>> +	rc = qcom_coincell_chgr_config(chgr, rset, vset, enable);
>>>> +
>>>> +	return rc;
> 
> This could be simplified to a return qcom_coincell_chrg_config() too.

OK

> Also, do we even need the chgr structure allocated anywhere besides on 
> the stack? It seems that it will be memory that's just lying around for 
> no use after probe.

Nope. And Agreed.  I'll change this.

Thanks for the help!
 -- Tim

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
