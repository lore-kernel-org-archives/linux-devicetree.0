From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dts: add Okaya LCD display for Nitrogen and
 Sabrelite
Date: Wed, 27 May 2015 11:06:37 +0800
Message-ID: <20150527030636.GB16165@dragon>
References: <1432314867-30888-1-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432314867-30888-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 22, 2015 at 07:14:25PM +0200, Gary Bisson wrote:
> This series adds the Okaya 7" LCD display that is a WVGA (800x480) panel with
> a 18-bit parallel interface for both Nitrogen and Sabrelite.
> 
> A U-Boot script to configure the displays based on detection of the
> touch controller is available for reference here:
> https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_bootscript-mainline.txt
> 
> Gary Bisson (2):
>   ARM: dts: imx6qdl-nitrogen6x: add Okaya LCD display
>   ARM: dts: imx6qdl-sabrelite: add Okaya LCD display

Philipp,

Are you okay with these two patches?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
