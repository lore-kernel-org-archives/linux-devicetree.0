From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6qdl-nitrogen6x: remove duplicate iomux
 entry
Date: Fri, 30 Dec 2016 11:01:18 +0800
Message-ID: <20161230030116.GM6177@dragon>
References: <20161124231638.12840-1-gary.bisson@boundarydevices.com>
 <20161124234247.18397-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161124234247.18397-1-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 25, 2016 at 12:42:47AM +0100, Gary Bisson wrote:
> The NANDF_CS2 pad is also part of the wlan-vmmcgrp iomux group.
> 
> Removing is from the usdhc2grp group avoids the following error:
> imx6q-pinctrl 20e0000.iomuxc: pin MX6Q_PAD_NANDF_CS2 already requested
> by regulators:regulator@4; cannot claim for 2194000.usdhc
> imx6q-pinctrl 20e0000.iomuxc: pin-187 (2194000.usdhc) status -22
> imx6q-pinctrl 20e0000.iomuxc: could not request pin 187
> (MX6Q_PAD_NANDF_CS2) from group usdhc2grp on device 20e0000.iomuxc
> 
> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
