From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 6/7] clk: sunxi-ng: Add A23 CCU
Date: Thu, 8 Sep 2016 10:29:39 +0200
Message-ID: <20160908082939.GJ8913@lukather>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
 <20160906121837.7517-7-maxime.ripard@free-electrons.com>
 <CAGb2v64jDTWB4faaBdCBCcFrt1WNf=PYwc16kpgsUhaMRudHnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7591381871276344866=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v64jDTWB4faaBdCBCcFrt1WNf=PYwc16kpgsUhaMRudHnQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============7591381871276344866==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline


--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 03:24:11PM +0800, Chen-Yu Tsai wrote:
> > +               [CLK_BUS_MSGBOX]        =3D &bus_msgbox_clk.common.hw,
>=20
> A23 manual and Allwinner sources say there is a bus gate for SPINLOCK.
> Tested it myself, and it indeed exists.

Yes, sorry. It was supposed to be spinlock instead of msgbox.

> > +       [RST_BUS_SPINLOCK]      =3D  { 0x2c4, BIT(22) },
>=20
> Allwinner sources say there is a reset control for MSGBOX.
> Tested it myself, and it indeed exists.

However, the msgbox is mentionned nowhere in the datasheet.

I'd prefer to be able to test that it actually works before adding it
to the clock driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0SFzAAoJEBx+YmzsjxAglxgQAJpW5yqCk7jzPIlDLtkHOATG
0gz6F25GjQYSwW5b96KNbaa/crd8V0OphN/FijwO3frPqV+kzTxk0GHPt83SEqMG
rlVr0Dq7eBtyMhc3xySX3Irk//2kyGerbpLB6+j+byWbDryuvzWqx7j3TUBBYyq6
dd3yhp2zT6dDGpo6xzwSAe7KVPx28rh7LGYSwleKs19T451mxXk1huwlb3nSnYrT
vBoKXsGVALG9MHMsxFT9Liawbt9nGDhm/63MAmeCHyv02GuStZwKqNt1lFjBFekd
GbD1xpzv9kvy2f9+Vrditpe9RXIasa26w13ZKgiL8gnMUIMwufasnjr/r190Nw35
2cX5icBaUrjT9wBnSn6YA3s49tCB18j7I4O4jfAQ79i5HCYBrpZpDEwlmtv24JWP
84nvhzxSdu9M0GHYFAhFiFUr0n3sRe4GOCpsPDZI1Hz9dbwO6aSa5V+P0092K0SX
mZdxBnQK89E5S5LYU20pupyui/8gkTNXCAJvEgX/vKrrRLyL5jGc2VElIaCpmF1L
dRv96KKknZRK0Px6YmjMMfYYTbJ0MMDOwknfFt83UPlFUxjFA32T4gd9qKdrtqF3
xF7wkpMRxzzvsLrJ6pJOakMT9wbRI+v/hPo5CccDG86B54X8RQPpeWB9F2FCaSf5
6RkKtiX/9ZmEseykJoDN
=6JMo
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--


--===============7591381871276344866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7591381871276344866==--
