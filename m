From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Tue, 28 Jan 2014 10:44:27 +0100
Message-ID: <20140128094427.GZ3867@lukather>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com>
 <1390426587-16287-3-git-send-email-hdegoede@redhat.com>
 <20140127144349.GJ3867@lukather>
 <52E67316.5020906@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ulNsWUvGrZAj8PMr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIHYTWLQKGQEMEMC3VY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E67316.5020906-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ulNsWUvGrZAj8PMr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2014 at 03:54:14PM +0100, Hans de Goede wrote:
> >> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
> >=20
> > Maybe we can just remove the gates from there? Even though they
> > are gates, they are also (a bit) more than that.
>=20
> To be clear you mean s/usb-gates-clk/usb-clk/ right ?

Yep, exactly

> > I guess that means that we will have the OHCI0 gate declared with
> > <&...-gates-clk 6>, while it's actually the first gate for this
> > clock?
>=20
> Correct.
>=20
> > Maybe introducing an offset field in the gates_data would be a
> > good idea, so that we always start from indexing the gates from 0
> > in the DT?
>=20
> Well for the other "gates" type clks we also have holes in the
> range, and we always refer to the clk with the bit number in the reg
> as the clock-cell value.

Yes, we have holes, but I see two majors differences here:
  - the other gates are just gates, while the usb clocks are a bit
    more than that.
  - the other gates' gating bits thus all start at bit 0, while here,
    since it's kind of a "mixed" clock, the gating bits start at bit 6
    (on the A20 at least)


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ulNsWUvGrZAj8PMr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS53v7AAoJEBx+YmzsjxAgXesP+wRFmwP8R/nJ/DfSCnGpnV8M
qF9hsdpy1YTFcm8tK7ZriRSYi510Wfg7DNYVQRaFjA8HU54EaFddrv9w70pEIFIF
k9jysJDhk5iZdLXopr1nc2+eMUA7YH7SjMx9POmjXtkOs0Fpqyl1TBi4w811BWG9
CAZkgTlyJKapAKYjp3WpOJ8XBZUiypXC2h1z0U7nxbkD5GpKpRymOaEvkBa+octa
iOgNdErF6mbHBLnoLULFAHJ5LUJWe/KSzeaoolhPGReabD1kXFRRdKleH/Fc0ffp
dAL1rSTsjwccFrhGAyUBoVNIZvCesRpFhU3O3KgFs2EavMdbyQHsvVW7UYOPU2Rp
dB/If5YMJ831gPzvomHAEFqCzRN2HSY5OkqUg2okcsz7fwCQ0bj28JcWej2OCAo3
g4KvJiZbSV5g6A1VuJxeIPzgv5SeEC7xFGjgvQ+KJ+0BiY0dPkQPTxk7GlZks0Kn
KEXBspmNgR7ZtLGnYAQYV4Pd1PHxJvBdZlvcBEMPamdNS18OhMdRFflEi7Mw5bdd
G7o7SzGnZGbHWgyVUZMhsrAhulMjpEwo7D2sqKaJ81YtNTW/HqcteaCpuQcyxWIi
Zo+UbErzMMwP858i3EnuXe/P5oE2U+5tuKUTbOOF7473zvtXnOoV2xZx9O1OHC9R
3fF+o90RzzNVyyRQPjtP
=bLTF
-----END PGP SIGNATURE-----

--ulNsWUvGrZAj8PMr--
