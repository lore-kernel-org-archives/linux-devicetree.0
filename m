From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/6] clk: sunxi: fixes, cleanups and A23
 basic clocks
Date: Thu, 3 Jul 2014 09:26:54 +0200
Message-ID: <20140703072654.GC31996@lukather>
References: <1403798144-32188-1-git-send-email-wens@csie.org>
 <20140702223552.7440.60829@quantum>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHEN2SOQKGQEORBEORA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140702223552.7440.60829@quantum>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Wed, Jul 02, 2014 at 03:35:52PM -0700, Mike Turquette wrote:
> Quoting Chen-Yu Tsai (2014-06-26 08:55:38)
> > Hi everyone,
> >=20
> > This is v4 of the sun8i clock series, which adds basic clock
> > support for the A23 SoC. It is based on my initial sun8i bring
> > up series [1]. This series was split up from the original A23
> > series [2]. Yet to come are more clocks, reset controllers,
> > prcm, pinctrl, and mmc.
>=20
> Hello Chen-Yu,
>=20
> This series looks good to me.
>=20
> Maxime,
>=20
> I see that you Acked it already. Are you planning to roll this into a
> pull request later on?

I think that was an question Emilio asked a few days ago :)

It would probably be easier if we just handle all the sunxi clocks
ourselves, so I guess Emilio can just send you a pull request later
on.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTtQW+AAoJEBx+YmzsjxAgj9oP/2Qo0MeGNM1enHnroPBlpo82
+8Z3bN5CznqlZkshYnCDqa9VNvB/m/3kSo/JGUA80SyeqJ2KLcB1dvjUWjIxFGlR
zUMFdTcD1mU3geWZuG3T09O4Y0ZmcYq54qjKdTz4ZBI9/zZnWIJP1gOGA+qinrmF
1xibnDIy6PS4HiJud0trScKNfVc011ybhvr4A1pCv/jdjTWY//8M5m/5mQeNN0KY
wBcOuEOEFeo7byGYlHy0237JnpfucZAYort1xwtt9h68+6wrg9njHwhjvpuWr5Q1
ps9ZcSET9WRofda1/7kLOF/C44PeI3oSEDBXIbA0eocGyj2HLzzYDDQLcgTrkMaG
8/WtPUN3PWWgZqoDpyZDg7ZflGQon+tV3hqLmQDJ6+gfsV0SJltq3fCRp4wFHXpD
Gw98oRGq5QtfSzmAujF9uILOXYhlglCJaWg8An8Gi77pttWtOalsWSmMTW7FTECN
TkmBpPcDDd9zLhtgFW0S5WtwSXmwxArg+d5MomGwxwLHgpirVZ3ZSYfDSIUR/MdB
Ba8odBVQUJ6FyGTbYAp2SISKmLB17JLHyp769v/MDU7kaVp7/LPhaIrvkD0nESlF
HD14IVoS+UTLhidU+hK6Vl4xiCHPveT+7dtd0+/dS7w9Qv1CAEFIOTiViF+dEg33
fytonWnPLneVn20p2Hs/
=00PN
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
