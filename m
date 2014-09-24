From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Wed, 24 Sep 2014 09:44:19 +0200
Message-ID: <2990737.4KzKXPZhaB@wuerfel>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com> <62705234.gKJDtUQLyT@wuerfel> <20140924022736.GA5307@peterchendt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140924022736.GA5307@peterchendt>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 24 September 2014 10:27:52 Peter Chen wrote:
> 
> Antoine is adding a generic chipdea glue layer driver, which like ehci generic
> platform driver: drivers/usb/host/ehci-platform.c, since other architectures
> like MIPS (Someone submitted mips chipidea driver before) may not have device
> tree support, I think non-dt support is also needed.

Right.

> It is a good suggestion for adding DT support for core driver, Since we did
> not do it at the first, it is a little embarrass at current situation.
> 
> - For the new chipidea glue drivers, it is ok we can have a child node
> for core device at glue device node, and some common entries can be there
> like: phy, vbus, dr_mode, etc. We need to add support for getting
> these common things for both through device tree and platform data
> (parent is DT support and parent is non-DT support) at core driver.

I don't really want to see the child devices show up in DT, as this is
really an implementation detail of the way that the driver currently works,
and IMHO we should change that.

I know that Felipe disagrees with me on this, but almost every other
driver that has soc-specific specializations does not use parent/child
nodes, neither in DT nor in Linux. Instead you have a single device
node that gets distinguished by "compatible" string.

> - For the existing glue drivers, since we can't change existed dts, we can
> only do it from future SoC support. Then, in this kinds of glue drivers,
> we need to support for both create core driver by node and by current
> calling platform_device_add way.

We should be able to easily change the ci_hdrc_add_device call into
a different exported function that calls a version of the probe()
code directly, as we do in all sorts of other drivers (ehci, ohci,
dwc2, ..., but not dwc3 and musb as they are maintained by Felipe).

We can also gradually move in some of the other glue drivers into
the main driver if the differences are small enough.

Moving the PCI driver over to this model requires a little more
work but is absolutely doable (again, see ehci, ahci, sdhci examples)
by moving the platform_device handling out of core.c and changing
it just operate on the plain 'struct device', with an exported
probe function that gets called on either the platform device
or the pci device.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
