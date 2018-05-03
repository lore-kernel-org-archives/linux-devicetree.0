From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 6/8] drm/panel: Add Ilitek ILI9881c panel driver
Date: Thu, 3 May 2018 15:59:04 +0200
Message-ID: <20180503135904.bxobnijc3qadpz4f@flea>
References: <cover.a3617c4362eac8783f412525e52cf5552d19095d.1522835818.git-series.maxime.ripard@bootlin.com>
 <a99bb44577ae18e77e60dba904618db23ee5dca7.1522835818.git-series.maxime.ripard@bootlin.com>
 <20180426150712.GF31888@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0538574378=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180426150712.GF31888@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0538574378==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlm2nnhy75vsga56"
Content-Disposition: inline


--qlm2nnhy75vsga56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

Thanks for your review, I'll fix the other things you pointed out.

On Thu, Apr 26, 2018 at 05:07:12PM +0200, Thierry Reding wrote:
> > +static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 dat=
a)
> > +{
> > +	u8 buf[2] =3D { cmd, data };
> > +	int ret;
> > +
> > +	ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, buf, sizeof(buf));
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
>=20
> According to this you're sending DCS commands, but none of the above
> look like valid DCS commands. Do you know what's going on here?

It looks to me that they are custom DCS commands.

> Also, can you include a reference to a datasheet where these
> instructions come from?

I'm not sure an Excel spreadsheet coming from the panel supplier would
be a good thing to include in a driver :)

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--qlm2nnhy75vsga56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrrFacACgkQ0rTAlCFN
r3Rd5w/+L3D/cUYcXj2rREM7Lt+SiwZWXdV7pIkLbY+MtKn7rxLqPewXTO/oSaoX
ylzyDJ+nftxiVJIFf+iU+EyI/zjjvGBeJ+QsMcT0Iqpz3SeR0qdjWTOL7VZ4HaEQ
TAexYkBHRhONKuc5g1boRwZ9a0sa8jhAy+C2kQKO+kC018GgU6/jg+TYKux9Sekn
jzglGTsIEpq5TJv9XfbzfTJ6zQmL482a+8EIqz66aIY+TbZUjAk3z7Kqac4bM7fl
OlyjRSK9Pa5U0O7kxjGsVEyJ45Wgl9UZOnNSfJYeLLqu/H1qyWOOwzuf6oyKnPda
q4YdZg8gYqhlZ671AA38M6xlGVmGWL0bvAwPHHEvhbm5ct6ezACeY5kSfBUjpE7e
FwdMIniPisqqP+ZHaRq7oi8SNQ6mWx208jL7I+tU9YnI+pptPjKbuyDQJEDC+3l9
k1AA4YE0BORG4PEaLsNwj4kBBRh80EeUbBhfd15kTDwmqXkF/7IOPnjqte22O/Wg
KW9O7pStLON1cguU+VvDIYDHmkQx0cgyMc3hJ4J99rlEtPv6q2mVSRBmb4WEVGNI
wmkioOUSWN3h46ez2mNTLOK2pK5ED+Jmo6jVxo55K5Elx+h7KiojS+/NzQygA3Ml
KqygE4kaJyZiWNFlEH0B7zzOt/SdCqwxngRs6QGtZCtqSzlRzAQ=
=CZiK
-----END PGP SIGNATURE-----

--qlm2nnhy75vsga56--

--===============0538574378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0538574378==--
