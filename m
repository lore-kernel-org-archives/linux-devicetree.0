From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Tue, 29 Jan 2013 10:10:37 -0700
Message-ID: <5108028D.5030605@wwwdotorg.org>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de> <5107D253.5030400@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5107D253.5030400-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon <kishon-l0cyMroinI0@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/29/2013 06:44 AM, kishon wrote:
> Hi,
> 
> On Tuesday 29 January 2013 04:52 PM, Sascha Hauer wrote:
>> From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> This adds two little devicetree helper functions for determining the
>> dr_mode (host, peripheral, otg) and phy_type (utmi, ulpi,...) from
>> the devicetree.

>> +/**
>> + * of_get_usbphy_mode - Get phy mode for given device_node
>> + * @np:    Pointer to the given device_node
>> + *
>> + * The function gets phy interface string from property 'phy_type',
>> + * and returns the correspondig enum usb_phy_interface
>> + */
>> +enum usb_phy_interface of_usb_get_phy_mode(struct device_node *np)
>> +{
>> +    const char *phy_type;
>> +    int err, i;
>> +
>> +    err = of_property_read_string(np, "phy_type", &phy_type);
>> +    if (err < 0)
>> +        return USBPHY_INTERFACE_MODE_NA;
> 
> Why don't we use a u32 property type for the *phy-type*? IMHO we should
> use string property only when the property should be absolutely
> unambiguous (e.g., compatible property should be string).

Well, this DT property is already defined an in-use, so while a
different decision might (or might not) be made today about the property
name/content, it's already defined and widely in use, so can't really be
changed.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
