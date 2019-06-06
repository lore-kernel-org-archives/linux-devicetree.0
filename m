From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
Date: Thu, 6 Jun 2019 16:10:30 -0700
Message-ID: <92ca6e6e-2ebd-cec4-4f75-2674fd2c3d99@infradead.org>
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
 <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: devicetree@vger.kernel.org

On 6/6/19 8:38 AM, Sébastien Szymanski wrote:
> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
> to imx7-media-csi driver.
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> 
> Changes for v2:
>  - rebase on top of linuxtv/master
>  - mention i.MX6UL/L in header and Kconfig help text
>  - rename csi_type to csi_soc_id
> 
>  drivers/staging/media/imx/Kconfig          |  4 +-
>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
>  2 files changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index ad3d7df6bb3c..8b6dc42c39e0 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>  	  A video4linux camera sensor interface driver for i.MX5/6.
>  
>  config VIDEO_IMX7_CSI
> -	tristate "i.MX7 Camera Sensor Interface driver"
> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>  	default y

Hi,
I realize that this "default y" is not part of this patch set, but we have
pretty strong guidance that a driver should not default to 'y' unless it is
needed for a system to boot.  If this driver is optional, then please drop
the 2 occurrences of "default y" in this Kconfig file.

thanks.
>  	help
>  	  Enable support for video4linux camera sensor interface driver for
> -	  i.MX7.
> +	  i.MX6UL/L or i.MX7.
>  endmenu
>  endif


-- 
~Randy
