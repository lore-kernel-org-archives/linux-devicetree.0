From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to get related device pointer via DT?
Date: Wed, 15 Feb 2017 18:01:36 +0800
Message-ID: <20170215100136.GB26227@b29397-desktop>
References: <HK2PR06MB054824526D2975ADE8EA0405D85B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <HK2PR06MB054824526D2975ADE8EA0405D85B0-jAC1QCBx2F3DOGFS7+tQZW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 02:21:55AM +0000, Yoshihiro Shimoda wrote:
> Hi,
> 
> I would like to get a related device pointer on usb EHCI drivers (or USB framework)
> because related device (e.g. OHCI or UHCI, called "companion controllers") has to
> finish resuming. I discussed this topic with Alan:
> http://marc.info/?t=148653514200001&r=1&w=2
> 
> In PCI bus, USB framework already has such a feature in drivers/usb/core/hcd-pci.c.
> However, in platform devices, we don't have it for now. So, I would like to add it.
> 
> Then, I have 2 ideas to get the related device pointer:
> 
> A) We add a new property "companion" as usb-generic.txt and EHCI node(s) have
>    such a property to bind a companion controller.
> B) We assume EHCI controller binds a companion controller if some resources
>    (irq or clock) are the same and it has a compatible strings as "generic-[uo]hci"
>    for instance.
> 
> My environment is R-Car H3, and it has 3 EHCI and 3 OHCI controllers.
> For example (I only wrote channel 0 of EHCI and OHCI):
> 		ehci0: usb@ee080100 {
> 			compatible = "generic-ehci";
> 			reg = <0 0xee080100 0 0x100>;
> 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> 			clocks = <&cpg CPG_MOD 703>;
> 			phys = <&usb2_phy0>;
> 			phy-names = "usb";
> 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> 			status = "disabled";
> 		};
> 
> 		ohci0: usb@ee080000 {
> 			compatible = "generic-ohci";
> 			reg = <0 0xee080000 0 0x100>;
> 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> 			clocks = <&cpg CPG_MOD 703>;
> 			phys = <&usb2_phy0>;
> 			phy-names = "usb";
> 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> 			status = "disabled";
> 		};
> 
> If my idea A), ehci0 will have companion = <&ohci>;
> If my idea B), no need to add any property.
> 
> What do you think?
> Anyway, I will start to study DT programming :)
> 

>From my point, idea A is better. It seems you have similar idea when you
tried Dual-role framework before. [1]

[1] https://patchwork.kernel.org/patch/9169745/

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
