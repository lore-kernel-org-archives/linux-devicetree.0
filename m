From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/7] clk: sunxi: unify sun6i AHB1 clock with
 proper PLL6 pre-divider
Date: Thu, 11 Sep 2014 23:02:11 +0200
Message-ID: <20140911210211.GM31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-4-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tfmLD+Hxjexp/STe"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB744ZCQAKGQEFC5HM4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410000448-9999-4-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tfmLD+Hxjexp/STe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 06, 2014 at 06:47:24PM +0800, Chen-Yu Tsai wrote:
> This patch unifies the sun6i AHB1 clock, originally supported
> with separate mux and divider clks. It also adds support for
> the pre-divider on the PLL6 input, thus allowing the clock to
> be muxed to PLL6 with proper clock rate calculation.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

It looks fine, but I'd rather see this in a separate file, especially
since we don't seem to have any order dependency.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tfmLD+Hxjexp/STe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEg3TAAoJEBx+YmzsjxAgsscQAJXGoMjLvNVhbJ4xlia3jgX+
Ds4NU1RAuq7ZX5Y1YpKb+XUDNwxF7tlwg8GZIjpnMohO/17FWDE/KPzFiYQNnSRb
jJKqWr036jwMAwd+19RwTAIvzf0qAuYyB5K420QjOENDO0dM2c5cCywbmw978To5
JFN76KDuWmsVHTUfxdpIUFPyPBGZq/d9HYCWFOIf9KaWvcWheNy2kqFefOB0+31r
g3fRMbHjcFHtqoTRiLV8Ge2cBDJFLisYyrYhiUDDYS1K9zzc0XPM0ab77jFQys6+
s/pBIaz1CGI2QW0ETIjRUH3C96B/uqp9gt18+hh2+n3Viz8F6XsZXHIlQMEoUXqM
b1XmpM89xmxjRjhAdFylMLf2B0zut2huPPjaOXQEySxfZitELl56urTcrzknJVeW
MCLAYCPltxg0v2ThHAdmQmp+I8DCVcHff8WOiSPiFCjzUVlCRmSYBD/Be9uBgLes
3j8eJ2DLqqa5YKLA9IhgiTrPcEoRdKM7OJX610KwkvWgo+KYHHdDdnTQga1aJAlG
z6jAlqc6Xg1VDGJTtG4H5JsGPHsjQl0q4JvsemTSfVrXpvqN677cQW5VJ1als+oW
0OjquWqPaP7cefMm6N3XKJL+vf5CNAOvbLFAV6buv7vd+GCtt2i42Ru2nicqxt3g
3eLIx/t0v+430M1XElQD
=BJYJ
-----END PGP SIGNATURE-----

--tfmLD+Hxjexp/STe--
