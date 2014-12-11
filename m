From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] pci: iProc: define Broadcom iProc PCIe binding
Date: Wed, 10 Dec 2014 17:37:03 -0800
Message-ID: <5488F53F.5060805@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>	 <1418169871-19232-1-git-send-email-rjui@broadcom.com>	 <1418169871-19232-2-git-send-email-rjui@broadcom.com> <1418207427.7616.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418207427.7616.5.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/10/2014 2:30 AM, Lucas Stach wrote:
>> +Example:
>> +
>> +SoC specific DT Entry:
>> +
>> +	pcie0: pcie@18012000 {
>> +		compatible = "brcm,iproc-pcie";
>> +		reg = <0x18012000 0x1000>,
>> +			<0x18002000 0x1000>;
>> +		interrupts = <GIC_SPI 96 IRQ_TYPE_NONE>,
>> +			     <GIC_SPI 97 IRQ_TYPE_NONE>,
>> +			     <GIC_SPI 98 IRQ_TYPE_NONE>,
>> +			     <GIC_SPI 99 IRQ_TYPE_NONE>,
>> +			     <GIC_SPI 100 IRQ_TYPE_NONE>,
>> +			     <GIC_SPI 101 IRQ_TYPE_NONE>;
>
> This is missing the interrupt-map and interrupt-map-mask for the legacy
> INTx interrupts. If you add this you don't need to have a special map
> function in your driver, but can just use the standard
> of_irq_parse_and_map_pci() function.
>
> Regards,
> Lucas
>
Thanks for pointing this out. I will look into this and try it out.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
