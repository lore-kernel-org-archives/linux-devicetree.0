From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 3/4] arm: dts: gr-peach: Add ETHER pin group
Date: Wed, 30 Aug 2017 09:25:42 +0200
Message-ID: <20170830072542.GH10398@verge.net.au>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
 <1503564523-31899-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUoMU=qN3Qjoqmf6uxcS3j5hqthhuBDMPZzA+wSD_BH5A@mail.gmail.com>
 <20170824114656.GA3905@w540>
 <CAMuHMdU5Vep+m7XtjcbSvyXUzD_Pn2crcQ68VRmS4bgY44ut0w@mail.gmail.com>
 <20170824125359.GB3905@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170824125359.GB3905@w540>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 02:53:59PM +0200, jmondi wrote:
> Thanks Geert,
> 
> On Thu, Aug 24, 2017 at 01:56:16PM +0200, Geert Uytterhoeven wrote:
> > Hi Jacopo,
> >
> 
> [snip]
> 
> > > I haven't find any mention in device tree bindings documentation of a
> > > "reset-gpio" property for sh_eth, in the code examples I've seen in
> > > u-boot and mbed, the interface is reset before any actual
> > > configuration is performed. I feel like that should be the place where
> > > that gpio is requested and cycled...
> >
> > Documentation/devicetree/bindings/net/mdio.txt says
> >
> > These are generic properties that can apply to any MDIO bus.
> >
> 
> I have now used mdio defined generic properties
> 
> &ether {
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&ether_pins>;
> 
> 	status = "okay";
> 
> 	reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
> 	reset-delay-us = <5>;
> 
> 	renesas,no-ether-link;
> 	phy-handle = <&phy0>;
> 	phy0: ethernet-phy@0 {
>                reg = <0>;
> 	};
> };
> 
> I see the gpio being cycled, but same results as before: device gets
> probed, address set, but I cannot ping, device gets probed, address
> gets set, but I cannot ping
> 
> --- target ---
> [    0.000000] libphy: sh_mii: probed
> [    0.000000] sh-eth e8203000.ethernet eth0: Base address at 0xe8203000, 68:14:97:20:97:00, IRQ 22.
> 
> # ifconfig eth0 192.168.100.50
> [    0.000000] Generic PHY e8203000.ethernet-ffffffff:00: attached PHY driver [Generic PHY] (mii_bus:phy_addr=e8203000.ethernet-f)
> 
> --- host ---
> $ping 192.168.100.50
> PING 192.168.100.50 (192.168.100.50) 56(84) bytes of data.
> >From 192.168.100.18 icmp_seq=1 Destination Host Unreachable
> >From 192.168.100.18 icmp_seq=1 Destination Host Unreachable
> >From 192.168.100.18 icmp_seq=1 Destination Host Unreachable
> 
> 
> Let's leave this out of the DTS series I've just sent for now, ok?

I'm a little confused by this. Am I right in thinking that you don't want
this patch applied at this time and may resubmit it or an updated version
later? With that understanding I have marked it as "Rejected" for now. Feel
free to resubmit when you are ready.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
