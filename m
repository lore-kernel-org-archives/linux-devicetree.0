From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v3 05/11] drm/bridge: Add Analogix anx6345 support
Date: Fri, 15 Feb 2019 08:23:31 +0000
Message-ID: <20190215082331.7wq6arctd4hdjcnh@plaes.org>
References: <20190215050957.20755-1-anarsoul@gmail.com>
 <20190215050957.20755-6-anarsoul@gmail.com>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDB4J47M7YERBBXOTHRQKGQEP7XWYYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190215050957.20755-6-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 09:09:51PM -0800, Vasily Khoruzhick wrote:
> From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> 
> The ANX6345 is an ultra-low power DisplayPower/eDP transmitter designed
> for portable devices. This driver adds initial support for RGB to eDP
> mode, without HPD and interrupts.
> 
> This is a configuration usually seen in eDP applications.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig       |  11 +
>  drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
>  .../drm/bridge/analogix/analogix-anx6345.c    | 845 ++++++++++++++++++
>  .../drm/bridge/analogix/analogix-i2c-dptx.c   |   2 +-
>  .../drm/bridge/analogix/analogix-i2c-dptx.h   |   8 +
>  .../bridge/analogix/analogix-i2c-txcommon.h   |   3 +
>  6 files changed, 869 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> 

[ ... ]

> +
> +static int anx6345_start(struct anx6345 *anx6345)
> +{
> +	int err;
> +
> +	if (!anx6345->powered)
> +		anx6345_poweron(anx6345);
> +
> +	/* Power on needed modules */
> +	err = anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
> +				 SP_POWERDOWN_CTRL_REG,
> +				 SP_VIDEO_PD | SP_LINK_PD);
> +
> +	err = anx6345_tx_initialization(anx6345);
> +	if (err) {
> +		DRM_ERROR("Failed transmitter initialization: %d\n", err);
> +		goto err_poweroff;

You can move the whole err_poweroff section from below here and drop the goto.

> +	}
> +
> +	/*
> +	 * This delay seems to help keep the hardware in a good state. Without
> +	 * it, there are times where it fails silently.
> +	 */
> +	usleep_range(10000, 15000);
> +
> +	return 0;
> +
> +err_poweroff:
> +	DRM_ERROR("Failed DisplayPort transmitter initialization: %d\n", err);
> +	anx6345_poweroff(anx6345);
> +
> +	return err;
> +}
> +

[ ... ]
