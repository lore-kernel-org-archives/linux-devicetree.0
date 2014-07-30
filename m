From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 3/4] usb: dwc2: add compatible data for rockchip soc
Date: Wed, 30 Jul 2014 19:00:50 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844C2F88@US01WEMBX2.internal.synopsys.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406684102-18313-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406684102-18313-1-git-send-email-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Kever Yang [mailto:kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org]
> Sent: Tuesday, July 29, 2014 6:35 PM
> 
> This patch add compatible data for dwc2 controller found on
> rk3066, rk3188 and rk3288 processors from rockchip.
> 
> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  drivers/usb/dwc2/platform.c |   29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index a10e7a3..cc5983c 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -75,6 +75,34 @@ static const struct dwc2_core_params params_bcm2835 = {
>  	.uframe_sched			= 0,
>  };
> 
> +static const struct dwc2_core_params params_rk3066 = {
> +	.otg_cap			= 2,	/* no HNP/SRP capable */
> +	.otg_ver			= 0,	/* 1.3 */
> +	.dma_enable			= 1,
> +	.dma_desc_enable		= 0,
> +	.speed				= 0,	/* High Speed */
> +	.enable_dynamic_fifo		= 1,
> +	.en_multiple_tx_fifo		= 1,
> +	.host_rx_fifo_size		= 520,	/* 520 DWORDs */
> +	.host_nperio_tx_fifo_size	= 128,	/* 128 DWORDs */
> +	.host_perio_tx_fifo_size	= 256,	/* 256 DWORDs */
> +	.max_transfer_size		= 65536,
> +	.max_packet_count		= 512,
> +	.host_channels			= 9,
> +	.phy_type			= 1,	/* UTMI */
> +	.phy_utmi_width			= 16,	/* 8 bits */

The comment doesn't match the value.

> +	.phy_ulpi_ddr			= 0,	/* Single */
> +	.phy_ulpi_ext_vbus		= 0,
> +	.i2c_enable			= 0,
> +	.ulpi_fs_ls			= 0,
> +	.host_support_fs_ls_low_power	= 0,
> +	.host_ls_low_power_phy_clk	= 0,	/* 48 MHz */
> +	.ts_dline			= 0,
> +	.reload_ctl			= 1,
> +	.ahbcfg				= 0x17, /* dma enable &  INCR16 */

Don't set the dma enable bit here, the driver will set that bit
according to the '.dma_enable' member above.

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
