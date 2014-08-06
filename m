From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/6] usb: host: usb-st-common: Add common code required by ohci-st and ehci-st
Date: Wed, 6 Aug 2014 22:59:10 +0200
Message-ID: <201408062259.10697.arnd@arndb.de>
References: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org> <1407344589-24863-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407344589-24863-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 06 August 2014, Peter Griffin wrote:
> +int st_usb_platform_power_on(struct st_platform_priv *priv)
> +{
> +	int clk, ret;
> +
> +	if (priv->pwr) {
> +		ret = reset_control_deassert(priv->pwr);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (priv->rst) {
> +		ret = 
> (priv->rst);
> +		if (ret)
> +			goto err_assert_power;
> +	}

I wouldn't make these optional, just call the functions
unconditionally and fail the probe function if they are
not available.

I'm not sure if it's worth keeping these functions in a
common file. You are adding complexity this way and I don't
think you are even saving a significant number of code lines
compared to just having two copies of them.

> +EXPORT_SYMBOL(st_usb_platform_power_on);

If you want to keep them, it would be best to make

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
