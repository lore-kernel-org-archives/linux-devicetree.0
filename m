From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] phy: phy-stih407-usb: Add usb picoPHY driver found
 on stih407 SoC family
Date: Tue, 09 Sep 2014 13:52:54 +0200
Message-ID: <1706244.K6iQdujHby@amdc1032>
References: <1410253218-18318-1-git-send-email-peter.griffin@linaro.org>
 <1410253218-18318-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1410253218-18318-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi,

On Tuesday, September 09, 2014 10:00:15 AM Peter Griffin wrote:
> This is the generic phy driver for the picoPHY ports used by the
> USB2 and USB3 Host controllers when controlling usb2/1.1 devices. It
> is found on STiH407 SoC family from STMicroelectronics.
> 
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/phy/Kconfig           |   8 ++
>  drivers/phy/Makefile          |   2 +
>  drivers/phy/phy-stih407-usb.c | 185 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 195 insertions(+)
>  create mode 100644 drivers/phy/phy-stih407-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 0dd7427..58018f7 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -230,4 +230,12 @@ config PHY_XGENE
>  	help
>  	  This option enables support for APM X-Gene SoC multi-purpose PHY.
>  
> +config PHY_STIH407_USB
> +	tristate "STMicroelectronics USB2 picoPHY driver for STiH407 family"
> +	depends on ARCH_STI
> +	depends on GENERIC_PHY

I believe that this should use

	select GENERIC_PHY

instead (just like all other PHY drivers except PHY_MIPHY365X which
also should be fixed to use select).

> +	help
> +	  Enable this support to enable the picoPHY device used by USB2
> +	  and USB3 controllers on STMicroelectronics STiH407 SoC families.
> +

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
