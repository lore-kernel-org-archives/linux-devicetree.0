From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 5/6] drm: sun4i: Add support for enabling
 DDC I2C bus to sun8i_dw_hdmi glue
Date: Tue, 21 May 2019 13:46:11 +0200
Message-ID: <20190521114611.ylmbo2oqeanveil4@flea>
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-6-megous@megous.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rjlukvbwopyqxnek"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC6KR7TQKGQERTU6VUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190520235009.16734-6-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rjlukvbwopyqxnek
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Tue, May 21, 2019 at 01:50:08AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> Orange Pi 3 board requires enabling a voltage shifting circuit via GPIO
> for the DDC bus to be usable.
>
> Add support for hdmi-connector node's optional ddc-en-gpios property to
> support this use case.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 55 +++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  3 ++
>  2 files changed, 55 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 39d8509d96a0..59b81ba02d96 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -98,6 +98,30 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
>  	return crtcs;
>  }
>
> +static int sun8i_dw_hdmi_find_connector_pdev(struct device *dev,
> +					     struct platform_device **pdev_out)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *remote;
> +
> +	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	if (!of_device_is_compatible(remote, "hdmi-connector")) {
> +		of_node_put(remote);
> +		return -ENODEV;
> +	}
> +
> +	pdev = of_find_device_by_node(remote);
> +	of_node_put(remote);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	*pdev_out = pdev;
> +	return 0;
> +}
> +
>  static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  			      void *data)
>  {
> @@ -151,16 +175,29 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  		return PTR_ERR(hdmi->regulator);
>  	}
>
> +	ret = sun8i_dw_hdmi_find_connector_pdev(dev, &hdmi->connector_pdev);
> +	if (!ret) {
> +		hdmi->ddc_en = gpiod_get_optional(&hdmi->connector_pdev->dev,
> +						  "ddc-en", GPIOD_OUT_HIGH);
> +		if (IS_ERR(hdmi->ddc_en)) {
> +			platform_device_put(hdmi->connector_pdev);
> +			dev_err(dev, "Couldn't get ddc-en gpio\n");
> +			return PTR_ERR(hdmi->ddc_en);
> +		}
> +	}
> +
>  	ret = regulator_enable(hdmi->regulator);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable regulator\n");
> -		return ret;
> +		goto err_unref_ddc_en;
>  	}
>
> +	gpiod_set_value(hdmi->ddc_en, 1);
> +

Do you really need this to be done all the time? I'm guessing you
would only need this when running .get_modes, right?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--rjlukvbwopyqxnek--
