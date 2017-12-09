From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tinydrm: add driver for ST7735R panels
Date: Sat, 9 Dec 2017 13:21:02 +0100
Message-ID: <927ddfa7-92b5-7dd0-44c4-0b02a998cd88@tronnes.org>
References: <1511924469-11448-1-git-send-email-david@lechnology.com>
 <1511924469-11448-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511924469-11448-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 29.11.2017 04.01, skrev David Lechner:
> This adds a new driver for Sitronix ST7735R display panels.
>
> This has been tested using an Adafruit 1.8" TFT.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
<snip>
> diff --git a/drivers/gpu/drm/tinydrm/st7735r.c b/drivers/gpu/drm/tinydrm/st7735r.c
<snip>
> +static struct drm_driver st7735r_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
> +				  DRIVER_ATOMIC,
> +	.fops			= &st7735r_fops,
> +	TINYDRM_GEM_DRIVER_OPS,
> +	.lastclose		= tinydrm_lastclose,

I was reminded of this since it would have made it easy to turn off the
panel and see if it turned white. Adding this makes it possible to send
commands from userspace for testing:

     .debugfs_init        = mipi_dbi_debugfs_init,

If you do that you have to set this to NULL since it's not possible to
read from the controller in this panel:

     mipi->read_commands = NULL;

Noralf.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
