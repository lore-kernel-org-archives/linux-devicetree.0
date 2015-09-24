From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: fix usb pin control for imx-rex dts
Date: Thu, 24 Sep 2015 05:15:15 -0700
Message-ID: <20150924121514.GO3529@tiger>
References: <1442425232-21451-1-git-send-email-eu@felipetonello.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442425232-21451-1-git-send-email-eu-NLnRV5p3vwDxYxTyqlRmvgC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eu-NLnRV5p3vwDxYxTyqlRmvgC/G2K4zDHf@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 06:40:32PM +0100, eu-NLnRV5p3vwDxYxTyqlRmvgC/G2K4zDHf@public.gmane.org wrote:
> From: "Felipe F. Tonello" <eu-NLnRV5p3vwDxYxTyqlRmvgC/G2K4zDHf@public.gmane.org>
> 
> This fixes a duplicated pin control causing this error:
> 
> imx6q-pinctrl 20e0000.iomuxc: pin MX6Q_PAD_GPIO_1 already
> requested by regulators:regulator@2; cannot claim for 2184000.usb
> imx6q-pinctrl 20e0000.iomuxc: pin-137 (2184000.usb) status -22
> imx6q-pinctrl 20e0000.iomuxc: could not request pin 137
> (MX6Q_PAD_GPIO_1) from group usbotggrp  on device 20e0000.iomuxc
> imx_usb 2184000.usb: Error applying setting, reverse things
> back
> imx6q-pinctrl 20e0000.iomuxc: pin MX6Q_PAD_EIM_D31 already
> requested by regulators:regulator@1; cannot claim for 2184200.usb
> imx6q-pinctrl 20e0000.iomuxc: pin-52 (2184200.usb) status -22
> imx6q-pinctrl 20e0000.iomuxc: could not request pin 52 (MX6Q_PAD_EIM_D31)
> from group usbh1grp  on device 20e0000.iomuxc
> imx_usb 2184200.usb: Error applying setting, reverse things
> back
> 
> Signed-off-by: Felipe F. Tonello <eu-NLnRV5p3vwDxYxTyqlRmvgC/G2K4zDHf@public.gmane.org>

Applied and copied stable, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
