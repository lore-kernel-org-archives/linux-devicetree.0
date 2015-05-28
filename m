From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Thu, 28 May 2015 10:21:21 +0200
Message-ID: <2213825.tVCdU15Dcu@wuerfel>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de> <5386954.hrl5VLbdYc@wuerfel> <55663B48.5060306@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55663B48.5060306-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 27 May 2015 23:46:48 Hauke Mehrtens wrote:
> On 05/27/2015 09:37 AM, Arnd Bergmann wrote:
> > On Sunday 24 May 2015 20:32:29 Hauke Mehrtens wrote:
> >> @@ -124,17 +124,7 @@
> >>                         <0x00026000 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
> >>  
> >>                         /* Ethernet Controller 3 */
> >> -                       <0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> >> -
> >> -                       /* NAND Controller */
> >> -                       <0x00028000 0 &gic GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 1 &gic GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 2 &gic GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 3 &gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 4 &gic GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 5 &gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 6 &gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> >> -                       <0x00028000 7 &gic GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       <0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
> >>  
> >>                 chipcommon: chipcommon@0 {
> >>                         reg = <0x00000000 0x1000>;
> >> @@ -143,4 +133,30 @@
> >>                         #gpio-cells = <2>;
> >>                 };
> >>         };
> >> +
> >> +       nand: nand@18028000 {
> >> +               compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
> >> +               reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
> >> +               reg-names = "nand", "iproc-idm", "iproc-ext";
> >> +               interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> > 
> > I think I'd rather leave the interrupt-map in the brcm node, and use
> > 
> > 	interrupts = <0>;
> > 
> > here.
> 
> There are two conflicting interests ;-)
> 
> In the first approach we probed the NAND controller through bcma and
> just added the additional information we can not probe through device
> tree. That was this version:
> https://patchwork.ozlabs.org/patch/473181/
> 
> This version needs some changes to the brcmnand driver and this
> additional part:
> https://patchwork.ozlabs.org/patch/473182/
> 
> This code is simular to the iproc_nand.c
> 
> Brian wanted us to use the iproc_nand.c which is possible, but then we
> completely ignore what we have probed in bcma and only use device tree.
> And this nand driver is not a subnode of the bcma bus any more so we can
> not use the irqs defined there.

Ok, I see. Maybe we should however leave the interrupt map entries
in the bcma node, to leave the option of doing it either way?

> > 
> >> +               status = "disabled";
> >> +
> >> +               #address-cells = <1>;
> >> +               #size-cells = <0>;
> >> +
> >> +               brcm,nand-has-wp;
> >> +
> >> +               nandcs@0 {
> >> +                       compatible = "brcm,nandcs";
> >> +                       reg = <0>;
> >> +                       #address-cells = <1>;
> >> +                       #size-cells = <1>;
> >> +
> >> +                       nand-ecc-strength = <8>;
> >> +                       nand-ecc-step-size = <512>;
> >> +
> >> +                       linux,part-probe = "ofpart", "bcm47xxpart";
> >> +               };
> >> +       };
> > 
> > This seems fine in principle, once the exact binding has been nailed down.
> > 
> > "bcm47xxpart" does not seem like an appropriate string here.
> 
> We are already thinking and talking about how to solve this problem.
> There are some parsers that are able to parse some partition layout
> based on information various sources or some vendor headers and some are
> also guessing in addition, like they are assuming that the bootloader is
> in the first block and n bytes long. The current module is that the
> flash driver defines which partition parsers to take, it is hard coded
> into the code. I do not like that. ;-)
> 
> I am trying to get a simple patch in which makes it possible to
> overwrite the defaults from the flash driver with device tree.
> As it uses the same format it should be easy to convert devices from the
> old style to the new one. This deice tree attribute is already supported
> by one driver I moved the code to make it available for all drivers.
> 
> The patch I am talking about: https://patchwork.ozlabs.org/patch/475988/

I was mainly referring to the use of 'xx' wildcards in the bcm47xxpart
string. We try to avoid wildcards in compatible strings, and I think it
makes sense to follow the same model here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
