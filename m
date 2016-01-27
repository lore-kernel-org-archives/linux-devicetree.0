From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: imx6*-hummingboard: fix pcie reset GPIO specification
Date: Wed, 27 Jan 2016 19:07:38 -0200
Message-ID: <CAOMZO5Ciq-kq4xQm4TH+dF3cdYxFfWUmvuykvorZ-oaEoyBWFQ@mail.gmail.com>
References: <E1aOWdF-00058a-0X@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1aOWdF-00058a-0X-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 6:24 PM, Russell King
<rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> PCIe reset signals are active low, and our GPIO for this is directly
> connected to the PCIe reset.  However, as the PCIe driver does not use
> the flag, the specification of '0' flags (which means active high) has
> not been noticed.  Correct this oversight, and switch to using the

Yes, the mx6 pci driver did not use the flag, but it does now since 5c5fb40de8f1
("PCI: imx6: Add support for active-low reset GPIO"), so it would be
better to adjust the commit log.

Apart from that, patch looks good.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
