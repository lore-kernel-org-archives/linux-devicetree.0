From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/5] soc: sunxi: Add driver for Allwinner
 Reduced Serial Bus
Date: Wed, 23 Sep 2015 09:45:32 -0700
Message-ID: <20150923164532.GT30445@sirena.org.uk>
References: <1443024323-9115-1-git-send-email-wens@csie.org>
 <1443024323-9115-3-git-send-email-wens@csie.org>
Reply-To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rfCqmLcWnxF2yz6F"
Return-path: <linux-sunxi+bncBDQ2L75W5QGBB4WOROYAKGQE7BTSXHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443024323-9115-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--rfCqmLcWnxF2yz6F
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Sep 24, 2015 at 12:05:18AM +0800, Chen-Yu Tsai wrote:

> +static int sunxi_rsb_device_probe(struct device *dev)
> +{
> +	const struct sunxi_rsb_driver *drv = to_sunxi_rsb_driver(dev->driver);
> +	struct sunxi_rsb_device *rdev = to_sunxi_rsb_device(dev);
> +	int ret;
> +
> +	if (dev->bus != &sunxi_rsb_bus)
> +		return 0;

That's a bit worrying...  why might this get called for something other
than a rsb device?

> +struct regmap *devm_regmap_init_sunxi_rsb(struct sunxi_rsb_device *rdev,
> +					  const struct regmap_config *config);

This should work most of the time but you might want to take a look at
the changes introduced in 3cfe7a74d42b (regmap: Use different lockdep
class for each regmap init call) and follow a similar pattern for RSB to
avoid spurious lockdep warnings in some configurations - see the commit
log for that change for a full explanation.

Otherwise the regmap bit of this looks good, I'll try to have another
look through at the rest of the code later.
--rfCqmLcWnxF2yz6F--
