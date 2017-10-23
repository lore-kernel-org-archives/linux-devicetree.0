From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: hisi: add PCIe driver support for HiSilicon STB SoCs
Date: Mon, 23 Oct 2017 14:32:25 +0800
Message-ID: <20171023063224.GI8700@dragon>
References: <1508043971-23216-1-git-send-email-shawnguo@kernel.org>
 <CAKv+Gu9rY-UuVLGBUoVJqbqMR9Gz1Pcw37W4gnfMPmGAdDE=_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9rY-UuVLGBUoVJqbqMR9Gz1Pcw37W4gnfMPmGAdDE=_A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ard,

On Sun, Oct 22, 2017 at 10:36:47AM +0100, Ard Biesheuvel wrote:
> > +Example:
> > +       pcie@f9860000 {
> > +               compatible = "hisilicon,hi3798cv200-pcie";
> > +               reg = <0xf9860000 0x1000>,
> > +                     <0xf0000000 0x2000>,
> > +                     <0xf2000000 0x01000000>;
> > +               reg-names = "control", "rc-dbi", "config";
> > +               #address-cells = <3>;
> > +               #size-cells = <2>;
> > +               device_type = "pci";
> > +               bus-range = <0 15>;
> > +               num-lanes = <1>;
> > +               ranges=<0x81000000 0 0 0xf4000000 0 0x00010000
> > +                       0x82000000 0 0xf3000000 0xf3000000 0 0x01000000>;
> > +               interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> > +               interrupt-names = "msi";
> > +               #interrupt-cells = <1>;
> > +               interrupt-map-mask = <0 0 0 7>;
> > +               interrupt-map = <0 0 0 1 &gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> 
> I know this is just the example, but this looks wrong to me: this only
> covers INTA, so any multi-function devices that rely on legacy
> interrupts (such as Nvidia GFX cards with HDMI audio device that are
> blacklisted for MSI support) will fail to work. What I /think/ you
> need is:
> 
> interrupt-map-mask = <0 0 0 0>;
> interrupt-map = <0 0 0 0 &gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;

I really appreciate the comment.  Yes, all 4 legacy interrupts should be
mapped to this IRQ.  I will get it fixed.  Thanks again.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
