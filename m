From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 3/3] phy: cygnus-usbphy: Add Broadcom Cygnus USB phy
 driver
Date: Thu, 26 Mar 2015 05:31:02 +0530
Message-ID: <55134C3E.4060400@ti.com>
References: <1426886727-537-1-git-send-email-arun.ramamurthy@broadcom.com> <1426886727-537-4-git-send-email-arun.ramamurthy@broadcom.com> <551336A2.1050704@ti.com> <20150325224253.GA16950@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150325224253.GA16950@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thursday 26 March 2015 04:12 AM, Dmitry Torokhov wrote:
> Hi Kishon,
> 
> On Thu, Mar 26, 2015 at 03:58:50AM +0530, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Saturday 21 March 2015 02:55 AM, Arun Ramamurthy wrote:
>>> +struct bcm_phy_driver {
>>> +	void __iomem *usbphy_regs;
>>> +	void __iomem *usb2h_idm_regs;
>>> +	void __iomem *usb2d_idm_regs;
>>> +	struct bcm_phy_instance *ports[MAX_PHY_PORTS];
>>
>> er.. can't we allocate this dynamically?
> 
> The chip has support for only 3 phys, so I believe allocating array of 3
> pointers is simplest.
> 
> [...]
> 
>>> +
>>> +static struct phy *bcm_usb_phy_xlate(struct device *dev,
>>> +				     struct of_phandle_args *args)
>>> +{
>>> +	struct bcm_phy_driver *phy_driver = dev_get_drvdata(dev);
>>> +	struct bcm_phy_instance *port = NULL;
>>> +	int i;
>>> +
>>> +	if (!phy_driver)
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	if (WARN_ON(args->args_count != 1))
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	if (WARN_ON(args->args[0] < 0 || args->args[0] > 1))
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(phy_driver->ports); i++) {
>>> +		struct bcm_phy_instance *p = phy_driver->ports[i];
>>> +
>>> +		if (p && p->generic_phy->dev.of_node == args->np) {
>>> +			port = p;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (!port) {
>>> +		dev_err(dev, "Failed to locate phy %s\n", args->np->name);
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>> +	port->host_mode = args->args[0];
>>> +
>>> +	return port->generic_phy;
>>> +}
>>
>> The xlate function here shouldn't be needed at all. Use of_phy_simple_xlate
>> instead.
> 
> of_phy_simple_xlate() will not allow specifying host vs device mode when
> requesting phy though...

indeed!

-Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
