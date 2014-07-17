From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi
 working
Date: Thu, 17 Jul 2014 10:58:12 +0100
Message-ID: <20140717095812.GQ17528@sirena.org.uk>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
 <20140714120051.GF6800@sirena.org.uk>
 <53C3C77F.7080208@kpanic.de>
 <20140714181338.GR6800@sirena.org.uk>
 <53C525A2.8080609@kpanic.de>
 <20140716212340.GZ17528@sirena.org.uk>
 <53C78B20.6010602@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/pvEKOcHgREgBce"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53C78B20.6010602-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--J/pvEKOcHgREgBce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 17, 2014 at 10:36:48AM +0200, Stefan Assmann wrote:
> On 16.07.2014 23:23, Mark Brown wrote:

> >Why not just add this to (or create a new) clock driver for the chip?

> Problem is that twl_i2c_write_u8() calls twl_get_regmap() to get the
> regmap. This requires struct twl_priv to be populated which does not
> happen until twl_probe has run. That hasn't happened at the point when
> omap4xxx_dt_clk_init() gets called.
> Is there a way to defer a clock driver until twl_probe() has run?

Why would probe deferral not work the same way as it does for
everything, and what does the core SoC clocking have to do with this?

--J/pvEKOcHgREgBce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTx54xAAoJELSic+t+oim9FW0P/R0z132TlvsROV/JKd8YLyk5
j7Oms4L+eOU0VNpiR3CVG2VTJmh7jM7cwndNCIMcEDAFz2ZQeVJ6J25yNgyRZQ3V
PBpqUNmwHtNFhRUcI2s4sT61NTnE9YbTK35klxe1D89yfPPPnAo91JI1Ro+DhC+l
WO+Z6Zt12IJwJ3tdxL2DDOIfxiB10QqI/MWqg0OLc8rH1Guku7hh/lDY8PDKVl+/
WL2xqVJJsG4PnfUdDEYk/BaMfcu+ZFkb2sFHZEJW+ssJBhrmUUJxOWpjYvVfhdcg
ERa3dnZeyNriroxIeBlpbfEHLStUm9L4AIm0S/z4WtZwVOx0crZACLxOAEnpHCp2
VsTClvTW8i3DN78cjGAbWWKiQ57kYluUMETwdy+3mRsnNmZD5Mr9jKGNynor9D30
K/R1ahjsZ9B4cOQ2ks2jF5bIi5RHA7tAp7rocDv0syVHostL8wC6M+Lo8QfFkYbS
Bqj0Y1ARYRtJQwmVHTeWY2kfg4bE1vBNmZORcv+WuOQ2lfZiZ5M6g2ptdQGcXOtM
6rg2uM628/kRl2tgBT1R8CCWpM3Uw28hfOYE7SVX5kshcd7iyKfP3JNDrexvivjZ
8S9OBwmHBuNNqHL4nSeYHfDsYd778Bc35CbE9Fr7RZpBXtbhTBWoTUX66/awAveR
9Op3HRHKSnu4JAb/IOAm
=mZFi
-----END PGP SIGNATURE-----

--J/pvEKOcHgREgBce--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
