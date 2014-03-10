From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 6/7] DMA: sun6i: Add driver for the
 Allwinner A31 DMA controller
Date: Mon, 10 Mar 2014 13:05:58 +0100
Message-ID: <20140310120558.GF2815@lukather>
References: <1393949884-892-1-git-send-email-maxime.ripard@free-electrons.com>
 <1393949884-892-7-git-send-email-maxime.ripard@free-electrons.com>
 <1394028474.28803.172.camel@smile.fi.intel.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBG6X62MAKGQEQSX76QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394028474.28803.172.camel-XvqNBM/wLWRrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andriy,

On Wed, Mar 05, 2014 at 02:07:55PM +0000, Shevchenko, Andriy wrote:
> > +		return PTR_ERR(pll6);
> > +	}
> > +
> > +	ret =3D clk_set_parent(mux, pll6);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Couldn't reparent AHB1 on PLL6\n");
> > +		return ret;
> > +	}
> > +
> > +	devm_clk_put(&pdev->dev, mux);
> > +	devm_clk_put(&pdev->dev, pll6);
>=20
> Since you put those here, would it be better to use plain
> clk_get/clk_put ?

Actually, this allows to have no exit path for the case where one of
the calls between the first clk_get, and here. devm_clk_* makes error
handling much easier here, that's just all

I'll fix the other comments you had, and send a new version.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTHaqlAAoJEBx+YmzsjxAgUrsP/R3AjphaZbpaJGAQua0RghUQ
U2khP8K6Z6dHvkUumqAh43mnrDydDxbVzLqSdCkg9FGoq1jjp5rLPORutCtC/Ybz
l8eHUi2aiaL5shT48XlJ/hKLaicrl6ZSPG0uOEsHqZtaaSFc3bK6RWSRozLmhiWz
DyToIg0xh4xetWGWaw2pZKeGZdnuUSurfMh4Bk9ZoQunxtZn7o61vs6RZ0kpaoH2
QIPmufn+TMuuVzTQY7yyx0nwp1vGH9am6AZRr52SDqvHVfzcnXiJF6W1N+6rh7OP
3Ag+YnxYZKXe+2LLEzbaPh6JzqgmYfuChYJ9zuIgcJZyuoKw0YvG2XgDO/KTjguG
Q/ZPX+mOAHlfc5+eT4BaiJ1457wXZ95jpcN3mhnrAswIkzMKwcNKdBrHtAuCaEFv
AwPR1bNZP1KYCFxW6O3mQl9/UmQJhXITzvBwGmlZN31CebF4eZ9MmgpuNGS0GYeA
+aqAFhm224Wp35+phn5H+Tj42p37jEiN1nCkvXu2tlTjhWq6AnxF1xpyysnWRpAi
MofIDPnaEWsDFZ5fKOiBf5MURz1hjY9uIRpbSiDYIqHuR2T+ukGkLlBrSKkX0Df6
hVCfykbjtiX+vJ3AysnTCewla0H1MIDGS7o7sTaa1kYMINoVEwIFAOPWPZ5m+Jch
AZK/yREPcCqyDr6GVJ4v
=xrpl
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--
