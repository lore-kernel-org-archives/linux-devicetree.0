From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] drm/tinydrm: export mipi_dbi_buf_copy and
 mipi_dbi_spi_cmd_max_speed
Date: Wed, 22 Nov 2017 15:21:52 +0100
Message-ID: <677eb642-8dc5-4992-6f32-414fcaefa241@tronnes.org>
References: <1511122328-31133-1-git-send-email-david@lechnology.com>
 <1511122328-31133-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511122328-31133-4-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 19.11.2017 21.12, skrev David Lechner:
> This exports the mipi_dbi_buf_copy() and mipi_dbi_spi_cmd_max_speed()
> functions so that they can be shared with other drivers.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---

Reviewed-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>

> v2 changes:
> * new patch in v2
>
>   drivers/gpu/drm/tinydrm/mipi-dbi.c | 24 ++++++++++++++++++++----
>   include/drm/tinydrm/mipi-dbi.h     |  4 +++-
>   2 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm/mipi-dbi.c
> index 347f9b2..aa6b6ce 100644
> --- a/drivers/gpu/drm/tinydrm/mipi-dbi.c
> +++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
> @@ -154,8 +154,18 @@ int mipi_dbi_command_buf(struct mipi_dbi *mipi, u8 cmd, u8 *data, size_t len)
>   }
>   EXPORT_SYMBOL(mipi_dbi_command_buf);
>   
> -static int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
> -				struct drm_clip_rect *clip, bool swap)
> +/**
> + * mipi_dbi_buf_copy - Copy a framebuffer, transforming it if necessary
> + * @dst: The destination buffer
> + * @fb: The source framebuffer
> + * @clip: Clipping rectangle of the area to be copied
> + * @swap: When true, swap MSB/LSB of 16-bit values
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
> +		      struct drm_clip_rect *clip, bool swap)
>   {
>   	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
>   	struct dma_buf_attachment *import_attach = cma_obj->base.import_attach;
> @@ -192,6 +202,7 @@ static int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>   					     DMA_FROM_DEVICE);
>   	return ret;
>   }
> +EXPORT_SYMBOL(mipi_dbi_buf_copy);
>   
>   static int mipi_dbi_fb_dirty(struct drm_framebuffer *fb,
>   			     struct drm_file *file_priv,
> @@ -444,18 +455,23 @@ EXPORT_SYMBOL(mipi_dbi_display_is_on);
>   
>   #if IS_ENABLED(CONFIG_SPI)
>   
> -/*
> +/**
> + * mipi_dbi_spi_cmd_max_speed - get the maximum SPI bus speed
> + * @spi: SPI device
> + * @len: The transfer buffer length.
> + *
>    * Many controllers have a max speed of 10MHz, but can be pushed way beyond
>    * that. Increase reliability by running pixel data at max speed and the rest
>    * at 10MHz, preventing transfer glitches from messing up the init settings.
>    */
> -static u32 mipi_dbi_spi_cmd_max_speed(struct spi_device *spi, size_t len)
> +u32 mipi_dbi_spi_cmd_max_speed(struct spi_device *spi, size_t len)
>   {
>   	if (len > 64)
>   		return 0; /* use default */
>   
>   	return min_t(u32, 10000000, spi->max_speed_hz);
>   }
> +EXPORT_SYMBOL(mipi_dbi_spi_cmd_max_speed);
>   
>   /*
>    * MIPI DBI Type C Option 1
> diff --git a/include/drm/tinydrm/mipi-dbi.h b/include/drm/tinydrm/mipi-dbi.h
> index 83346dd..5d0e82b 100644
> --- a/include/drm/tinydrm/mipi-dbi.h
> +++ b/include/drm/tinydrm/mipi-dbi.h
> @@ -72,10 +72,12 @@ void mipi_dbi_pipe_enable(struct drm_simple_display_pipe *pipe,
>   void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe);
>   void mipi_dbi_hw_reset(struct mipi_dbi *mipi);
>   bool mipi_dbi_display_is_on(struct mipi_dbi *mipi);
> +u32 mipi_dbi_spi_cmd_max_speed(struct spi_device *spi, size_t len);
>   
>   int mipi_dbi_command_read(struct mipi_dbi *mipi, u8 cmd, u8 *val);
>   int mipi_dbi_command_buf(struct mipi_dbi *mipi, u8 cmd, u8 *data, size_t len);
> -
> +int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
> +		      struct drm_clip_rect *clip, bool swap);
>   /**
>    * mipi_dbi_command - MIPI DCS command with optional parameter(s)
>    * @mipi: MIPI structure

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
