From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] doc: dt-binding: ci-hdrc-usb2: add i.mx specific
 binding "need-three-clocks"
Date: Wed, 16 Sep 2015 00:42:34 -0300
Message-ID: <CAOMZO5CqDQp0xU8Pb8pz9jMyLuCdHXWiL15N6xu7fgwFcxkT4w@mail.gmail.com>
References: <1442368183-8103-1-git-send-email-peter.chen@freescale.com>
	<1442368183-8103-2-git-send-email-peter.chen@freescale.com>
	<CAOMZO5Aj_Txbg-nNH_xoAd=eCW9yfP6GMEE=H8jKvuoH9=e-ag@mail.gmail.com>
	<20150916022454.GA15736@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150916022454.GA15736@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 11:24 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> but drivers/usb/gadget/udc/fsl_mxc_udc.c has three clocks

Ok, looking at the clock driver I see that they used to associate
three clocks with mxc-ehci:

    clk_register_clkdev(clk[usb_div], "per", "mxc-ehci.0");
    clk_register_clkdev(clk[ipg], "ipg", "mxc-ehci.0");
    clk_register_clkdev(clk[usbotg_gate], "ahb", "mxc-ehci.0");

So your approach looks good.

I only think that mx25 and mx35 dtsi should be also updated to have
the 'three-clock' property.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
