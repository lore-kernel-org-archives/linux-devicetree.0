From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx7d: create i.MX 7Solo base device tree
Date: Sun, 12 Jun 2016 09:35:26 +0800
Message-ID: <20160612013526.GV20243@tiger>
References: <20160608023709.32090-1-stefan@agner.ch>
 <20160608023709.32090-2-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160608023709.32090-2-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, max.krummenacher-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 07:37:07PM -0700, Stefan Agner wrote:
> The i.MX 7 series currently consists of two SoCs: i.MX 7Solo and
> 7Dual. The i.MX 7Solo implements a subset of features available on
> i.MX 7Dual, hence create imx7s.dtsi as the base device tree. The
> i.MX 7Dual's additional features over i.MX 7Solo are:
> - Second Cortex-A7 core
> - Second Gigabit Ethernet controller
> - EPD (Electronc Paper Display, not yet part of the device tree)
> - PCIe (not yet part of the device tree)
> - Additional USB2.0 OTG controller
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 923 +++----------------------------------------
>  arch/arm/boot/dts/imx7s.dtsi | 880 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 928 insertions(+), 875 deletions(-)

We should probably have a beforehand patch to rename the file, so that
we can avoid this dramatic diffstat.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
