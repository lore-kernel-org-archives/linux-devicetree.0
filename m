From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] MFD: RK808: Add new mfd device for RK808
Date: Sun, 17 Aug 2014 09:13:41 -0500
Message-ID: <20140817141341.GH14537@sirena.org.uk>
References: <1408240705-29472-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKijDXBCEH69PxaN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408240705-29472-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gKijDXBCEH69PxaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 17, 2014 at 09:58:25AM +0800, Chris Zhong wrote:

> +static void rk808_device_shutdown(void)
> +{
> +	int ret;
> +	struct rk808 *rk808 = g_rk808;
> +
> +	if (!rk808) {
> +		dev_err(rk808->dev, "%s have no g_rk808\n", __func__);
> +		return;
> +	}

This is a bit dodgy but I can't think of a better way of doing it :/

> +
> +	ret = regmap_update_bits(rk808->regmap,
> +				 RK808_INT_STS_MSK_REG1,
> +				 (0x3 << 5), (0x3 << 5));
> +	/* close rtc int when power off */
> +	ret = regmap_update_bits(rk808->regmap,
> +				 RK808_RTC_INT_REG,
> +				 (0x3 << 2), 0);
> +	/* close rtc int when power off */
> +	ret = regmap_update_bits(rk808->regmap,
> +				 RK808_DEVCTRL_REG,
> +				 (0x1 << 3), (0x1 << 3));
> +	if (ret < 0)
> +		dev_err(rk808->dev, "rk808 power off error!\n");

Defines for these bits would be good, though if this turns off the RTC
alarm then it might be better not to do it - one thing people do with
RTC alarms is use them to wake the system up from deep sleep.

> +	while (1)
> +		wfi();
> +}

Just let the kernel shut down by itself - or is that last write a system
power off request?

> +	ret = regmap_read(rk808->regmap, 0x2f, &val);
> +	if (ret < 0) {
> +		dev_err(rk808->dev, "The device is not rk808 %d\n", ret);
> +		return ret;
> +	}

That error message is misleading - an error from regmap_read() means
that I/O failed, usually "device is not rk808" would mean that you'd
read back and ID register on the device and it didn't match what was
expected.

--gKijDXBCEH69PxaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT8LiRAAoJELSic+t+oim9kTcP/jVwefUBbKMRbwYGCPiO4OWR
3rx1WXCQ4fmZNZ9sxKnrxya42W60vluuhddgCEuhn459If/5Ybq83Fe93dEjJyky
3cYu1CpaC9kdwMwT3iZdqDope3lo8l7njtlI57Z2b+m59Aipa67AkWGCa+53UxZQ
e87oMR9mfRN1Q8TKofATAr2DuM5+ogOTLwfPXqvfCP/Ei2DNIEuYy2zoqbqNJdLT
1rh2w/VkFtjnFdFbVX/CvBIA8Sr9tumjP93usrxWH7LmJHUC03ANFBeIDXw1fu2W
lRdPp1gj3LWK5Q0B/0TSYX2PLa8Hp7znJOyaakh5ClJAseJRC6h1YcdwM2DBSSEq
EsVxnc1Ann6g2Gco5D6RM0lkogKTW4aYCxYuHn+yJ1oB8zavxTMhByRBAxkeby1P
dR452/cJwf6Czy9Pkl0Gkfk+iYwl3AyemgZ7ipgL1ZaIOYf2S33Y1k5zvT3zHhWP
BdVxlV+623XJjpTiLpYMC0fyCUYDL/YV9nLG8S5H+HP9OcaZHWBBKIUdI0f1Q9KA
U7YAaQO8P9bi1vhJUoV5jGAe7oKBBvvMWMImT79z4f1LMqJ65VDa4JvjxLXdcbBV
UVmr4571HyKXL/aIBjsxYUY5ZozrNYGWkuPtCd1JxhDFkBodKVLJBbG0u8mwih7k
vFPk/MI83eF5xp3UF/+J
=VwfY
-----END PGP SIGNATURE-----

--gKijDXBCEH69PxaN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
