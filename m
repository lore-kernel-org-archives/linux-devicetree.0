From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 07/23] usb: common: add API to update usb otg capabilities
 by device tree
Date: Wed, 8 Jul 2015 12:13:51 +0300
Message-ID: <559CE9CF.5070206@ti.com>
References: <1435564082-14583-1-git-send-email-jun.li@freescale.com> <1435564082-14583-8-git-send-email-jun.li@freescale.com> <559BD2C2.3050509@ti.com> <20150708020529.GA11714@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150708020529.GA11714@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/07/15 05:05, Li Jun wrote:
> On Tue, Jul 07, 2015 at 04:23:14PM +0300, Roger Quadros wrote:
>> Hi,
>>
>> On 29/06/15 10:47, Li Jun wrote:
>>> Check property of usb hardware to update otg version and disable SRP, HNP
>>> and ADP if its disable flag is present.
>>>
>>> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> ---
>>>  drivers/usb/common/common.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
>>>  include/linux/usb/of.h      |  7 +++++++
>>>  2 files changed, 54 insertions(+)
>>>
>>> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
>>> index b530fd4..10c986b 100644
>>> --- a/drivers/usb/common/common.c
>>> +++ b/drivers/usb/common/common.c
>>> @@ -154,6 +154,53 @@ bool of_usb_host_tpl_support(struct device_node *np)
>>>  	return false;
>>>  }
>>>  EXPORT_SYMBOL_GPL(of_usb_host_tpl_support);
>>> +
>>> +/**
>>> + * of_usb_update_otg_caps - to update usb otg capabilities according to
>>> + * the passed properties in DT.
>>> + * @np: Pointer to the given device_node
>>> + * @otg_caps: Pointer to the target usb_otg_caps to be set
>>> + *
>>> + * The function updates the otg capabilities
>>> + */
>>> +int of_usb_update_otg_caps(struct device_node *np,
>>> +			struct usb_otg_caps *otg_caps)
>>> +{
>>> +	u32 otg_rev;
>>> +
>>> +	if (!otg_caps)
>>> +		return -EINVAL;
>>> +
>>> +	if (!of_property_read_u32(np, "otg-rev", &otg_rev)) {
>>> +		switch (otg_rev) {
>>> +		case 0x0100:
>>> +		case 0x0120:
>>> +		case 0x0130:
>>> +		case 0x0200:
>>> +		case 0x0300:
>>
>> we don't support 0x300 yet. I guess it is best to leave it out till
>> we have real otg 3.0 support.
>>
> okay.
> 
>>> +			otg_caps->otg_rev = otg_rev;

Now consider this case. Lets say controller otg_rev is 0x0130
and DT passes 0x0200.

or (in the future) if controller otg_rev is 0x0300 and DT passes 0x0200.

Do we want to set otg_rev to the lesser one?
e.g.
	if (otg_caps->otg_rev)
		otg_caps->otg_rev = min(otg_rev, otg_caps->otg_rev);
	else
		otg_caps->otg_rev = otg_rev;

we could simplify that to just
	otg_caps->otg_rev = min(otg_rev, otg_caps->otg_rev);

if we mandate that controllers calling of_usb_update_otg_caps()
must pass a non zero otg_caps->otg_rev.

>>> +			break;
>>> +		default:
>>> +			pr_err("%s: unsupported otg-rev: 0x%x\n",
>>> +						np->full_name, otg_rev);
>>> +			return -EINVAL;
>>> +		}
>>> +	} else {
>>> +		otg_caps->otg_rev = 0;
>>
>> Why do we set this to 0 here?
>> controller might have set a valid otg_rev and we want to
>> maintain it if nothing was passed in DT.
>>
> Considering otg-rev is mandatory for non-legacy platformsr,
> Now you mean what I did in previous version: do not set initial otg-rev
> in controller driver, just let it to be 0, and wait it to be updated by DT
> or by platform layer code.
> 
> Current idea is:
> set otg capabilities in controller driver as otg _ability_ like below:
> otg-rev = 0x0200;
> hnp_support = true;
> 
> a) Call to this function to update otg caps if pass by DT, and then/or
> 
> b) Update otg caps if some platforms want to update it directly(not by DT). 
> 
> If both above 2 update not happen, then I need keep otg-rev to be 0 which will
> be used to judge this is a legacy platform, so I set otg-rev to be 0 if it not
> passed in DT in a).

Let's stick to this idea. We could just add a short comment in the code
as to why we set otg_rev to 0 so that future readers can understand.

cheers,
-roger

> 
> We also can do this like my previous version:
> In controller driver, only set HNP/SRP/ADP as otg ability:
> hnp_support = true;
> 
> a) Call to this function to update otg caps if pass by DT, and then/or
> 
> b) Update otg caps if some platforms want to update it directly(not by DT). 
> 
> If both above 2 update not happen, otg-rev is still 0, so I need not set it
> to be 0 if nothing pass in DT.
> 
> Either way is okay I think.
> 
> Li Jun
> 
>>> +	}
>>> +
>>> +	if (of_find_property(np, "hnp-disable", NULL))
>>> +		otg_caps->hnp_support = false;
>>> +	if (of_find_property(np, "srp-disable", NULL))
>>> +		otg_caps->srp_support = false;
>>> +	if (of_find_property(np, "adp-disable", NULL) ||
>>> +				(otg_caps->otg_rev < 0x0200))
>>> +		otg_caps->adp_support = false;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(of_usb_update_otg_caps);
>>> +
>>>  #endif
>>
>> cheers,
>> -roger
>>
>>>
>>>  MODULE_LICENSE("GPL");
>>> diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
>>> index cfe0528..8c5a818 100644
>>> --- a/include/linux/usb/of.h
>>> +++ b/include/linux/usb/of.h
>>> @@ -15,6 +15,8 @@
>>>  enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
>>>  enum usb_device_speed of_usb_get_maximum_speed(struct device_node *np);
>>>  bool of_usb_host_tpl_support(struct device_node *np);
>>> +int of_usb_update_otg_caps(struct device_node *np,
>>> +			struct usb_otg_caps *otg_caps);
>>>  #else
>>>  static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
>>>  {
>>> @@ -30,6 +32,11 @@ static inline bool of_usb_host_tpl_support(struct device_node *np)
>>>  {
>>>  	return false;
>>>  }
>>> +static inline int of_usb_update_otg_caps(struct device_node *np,
>>> +				struct usb_otg_caps *otg_caps)
>>> +{
>>> +	return 0;
>>> +}
>>>  #endif
>>>
>>>  #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
>>>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
