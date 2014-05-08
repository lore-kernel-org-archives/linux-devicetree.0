From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 5/7] clk: sunxi: add PRCM
 (Power/Reset/Clock Management) clks support
Date: Wed, 7 May 2014 22:11:49 -0500
Message-ID: <20140508031149.GN7047@lukather>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399483554-8824-6-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3hAdtgBjtgL7p0NQ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBVPOVONQKGQE3DQM57A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399483554-8824-6-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3hAdtgBjtgL7p0NQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 07:25:52PM +0200, Boris BREZILLON wrote:
> The PRCM (Power/Reset/Clock Management) unit provides several clock
> devices:
> - AR100 clk: used to clock the Power Management co-processor
> - AHB0 clk: used to clock the AHB0 bus
> - APB0 clk and gates: used to clk peripherals connected to the APB0 bus
>=20
> Add support for these clks in a separate driver so that they can be probed
> as platform devices instead of registered during early init.
> This is needed to be able to probe PRCM MFD subdevices.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3hAdtgBjtgL7p0NQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTavX0AAoJEBx+YmzsjxAg+1gQAKopdXxjzj9RVSMSMR2q2Fxb
luB8mtq/A8rIHieCLQKVJ04G+3e9d13mrWzml5Uyst1oiIr72y9YcZlIjevYDVSC
AjPxE4M28BuINGki1jw6TREGfbKWWbcOWgQdwbUN3Qt9SC8KlejXsszVwmHQyqfg
E0McrjqWSt5BNREOc44Z2NUDQDZuDYRh3IHodi6+guYfT449zyT+3E1cbbQaq3g8
CoWML0BUXFgCafOrU+0KlmoT03spRtKYpafnRPWGCmn/yUFFZQ5nBNSvUsTrFRGj
i5sDcm+HS7X99ONWShUYG9vYyLCwiUBDMKe0wyGgTbW0Dqonl79BqrTbbXeEgaN2
CFiNaFpWgPGFKbYR56uP/54kiFa9y+b+zeF8Bsfqvu5WAlfTdy8VblNodan2QtUD
9YEbzXMC4VY0ACyMfGrxBsLRMowLqyO3bVqKHogCIY6Ji/I9zewuwY2t49wGnDvP
xHBvopM4Z+C2ecD4JgPk2eVo582WZHz7DXJaGMQe0gHrYGV7YquJZPNVdDq5dqHs
+IsFI22guZypXWJyO4Yx+IwWlTPwzBNfT+tnYA0/jsPn9+h2RdA45ewIHK/KSrk9
nG5kVU6B04zh+Bf7PTDsEfyabcfaau0hXZZo1/WSblxUysy2bSBnr/UhZdPSVtG0
nPH2Zu1yknnWwv3azPK7
=NU5X
-----END PGP SIGNATURE-----

--3hAdtgBjtgL7p0NQ--
