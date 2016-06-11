From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: Use generic uart-has-rtscts DT property
Date: Sat, 11 Jun 2016 14:48:26 +0800
Message-ID: <20160611064826.GC20243@tiger>
References: <1464705112-21609-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464705112-21609-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 31, 2016 at 04:31:49PM +0200, Geert Uytterhoeven wrote:
> 	Hi Shawn, Sascha, Barry,
> 
> As of v4.7-rc1, the Freescale MXS AUART and IMX UART drivers, and the
> SiRF UART driver, recognize the generic "uart-has-rtscts" DT property,
> deprecating the vendor-specific "<vendor>,uart-has-rtscts" DT
> properties.  This series updates all DTS files to replace the latter by
> the former.
> 
> Thanks for applying!
> 
> Geert Uytterhoeven (3):
>   ARM: dts: imx28: Use generic uart-has-rtscts DT property
>   ARM: dts: imx: Use generic uart-has-rtscts DT property

Applied these two, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
