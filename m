From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 4/7] drm/bridge: Prepare Analogix anx6345 support
Date: Wed, 12 Jun 2019 09:43:37 +0200
Message-ID: <3533d7ba-5d07-89c7-a86d-8f66660413a8@samsung.com>
References: <20190604122150.29D6468B05@newverein.lst.de>
        <CGME20190604122327epcas3p40004116ce83af448b156583d0fc7b37f@epcas3p4.samsung.com>
        <20190604122258.664D468BFE@newverein.lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604122258.664D468BFE@newverein.lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04.06.2019 14:22, Torsten Duwe wrote:
> Add bit definitions required for the anx6345 and add a
> sanity check in anx_dp_aux_transfer.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Signed-off-by: Torsten Duwe <duwe@suse.de>


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej



> ---
>  drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c     | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.h     | 8 ++++++++
>  drivers/gpu/drm/bridge/analogix/analogix-i2c-txcommon.h | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
> index d6016f789d80..e9d2ed4d410d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
> @@ -124,7 +124,7 @@ ssize_t anx_dp_aux_transfer(struct regmap *map_dptx,
>  	else	/* For non-zero-sized set the length field. */
>  		ctrl1 |= (msg->size - 1) << SP_AUX_LENGTH_SHIFT;
>  
> -	if ((msg->request & DP_AUX_I2C_READ) == 0) {
> +	if ((msg->size > 0) && ((msg->request & DP_AUX_I2C_READ) == 0)) {
>  		/* When WRITE | MOT write values to data buffer */
>  		err = regmap_bulk_write(map_dptx,
>  					SP_DP_BUF_DATA0_REG, buffer,
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.h b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.h
> index 30436c88f181..95ab89eecc60 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.h
> @@ -83,7 +83,11 @@
>  #define SP_CHA_STA			BIT(2)
>  /* Bits for DP System Control Register 3 */
>  #define SP_HPD_STATUS			BIT(6)
> +#define SP_HPD_FORCE			BIT(5)
> +#define SP_HPD_CTRL			BIT(4)
>  #define SP_STRM_VALID			BIT(2)
> +#define SP_STRM_FORCE			BIT(1)
> +#define SP_STRM_CTRL			BIT(0)
>  /* Bits for DP System Control Register 4 */
>  #define SP_ENHANCED_MODE		BIT(3)
>  
> @@ -128,6 +132,9 @@
>  #define SP_LINK_BW_SET_MASK		0x1f
>  #define SP_INITIAL_SLIM_M_AUD_SEL	BIT(5)
>  
> +/* DP Lane Count Setting Register */
> +#define SP_DP_LANE_COUNT_SET_REG	0xa1
> +
>  /* DP Training Pattern Set Register */
>  #define SP_DP_TRAINING_PATTERN_SET_REG	0xa2
>  
> @@ -141,6 +148,7 @@
>  
>  /* DP Link Training Control Register */
>  #define SP_DP_LT_CTRL_REG		0xa8
> +#define SP_DP_LT_INPROGRESS		0x80
>  #define SP_LT_ERROR_TYPE_MASK		0x70
>  #  define SP_LT_NO_ERROR		0x00
>  #  define SP_LT_AUX_WRITE_ERROR		0x01
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-i2c-txcommon.h b/drivers/gpu/drm/bridge/analogix/analogix-i2c-txcommon.h
> index f48293f86f9d..e3391a50b5d1 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-i2c-txcommon.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-i2c-txcommon.h
> @@ -188,6 +188,9 @@
>  #define SP_VBIT				BIT(1)
>  #define SP_AUDIO_LAYOUT			BIT(0)
>  
> +/* Analog Debug Register 1 */
> +#define SP_ANALOG_DEBUG1_REG		0xdc
> +
>  /* Analog Debug Register 2 */
>  #define SP_ANALOG_DEBUG2_REG		0xdd
>  #define SP_FORCE_SW_OFF_BYPASS		0x20
