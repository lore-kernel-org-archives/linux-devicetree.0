From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 01/18] regmap: mmio: Add function to attach a clock
Date: Thu, 20 Jul 2017 16:44:25 +0200
Message-ID: <20170720144425.7tvmme6llqmmj3ls@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <02f409ad80afed68e02660f161fc26d588a86fa7.1499955058.git-series.maxime.ripard@free-electrons.com>
 <20170713160142.2buaie6ebqbxunin@sirena.org.uk>
 <20170717090107.cpjxoxfqcc3qwabh@flea>
 <20170718132147.uzexelksygjeasmw@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1563120470=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170718132147.uzexelksygjeasmw@sirena.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1563120470==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dp3hwis4746bxiur"
Content-Disposition: inline


--dp3hwis4746bxiur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2017 at 02:21:47PM +0100, Mark Brown wrote:
> On Mon, Jul 17, 2017 at 11:01:07AM +0200, Maxime Ripard wrote:
> > On Thu, Jul 13, 2017 at 05:01:42PM +0100, Mark Brown wrote:
>=20
> > > > This might be problematic if the clock to enable is stored in anoth=
er node.
> > > > Let's add a function that allows to attach a clock that has already=
 been
> > > > retrieved to a regmap in order to fix this.
>=20
> > > What is the use case for this?
>=20
> > This is useful when the clock you want to be handled by the regmap is
> > not described in the device node that probed the driver, but one of
> > its subnode, or an another node entirely.
>=20
> > We're in the latter case, where we have two controllers in the DT, but
> > are driven by the same driver. We'll create two regmaps, but one will
> > not have the proper of_node used to retrieve the clock.
>=20
> I'm sorry but I'm still not seeing why you're doing this.  Can you be
> more concrete please?

We have two devices needed to bring DSI: the DSI controller itself and
its associated PHY.

The PHY configuration cannot be done through a framework because it
requires more information than the various phy frameworks allow to
pass through to the driver.

Therefore, we have a single driver, attached to the DSI controller,
which handles both the PHY and the DSI controller.

Both the PHY and the DSI controller are separate device, with
different memory regions. Therefore, we need to create two regmaps,
with clocks attached to them.

However, the default clock retrieval mechanism doesn't work for the
phy regmap, since only the DSI controller device of_node is
considered, while its clock is stored in a separate node.

I hope it's clearer,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dp3hwis4746bxiur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcMHJAAoJEBx+YmzsjxAgBSMP/1kVsye0dGMLr1gTaKedg6SS
W88+XDVBh+gC4RId8XRW9YboEVOBihJXKx65XnoanfQZYqygO94oronzzt15kpKG
LBnj8sdwPO5EppYenQR/JuF1Gix98vKBaj7evPhempmn9Wj9RbA8H/vMhOIDlBDl
NDnNj5ubVLcZpmmn5nLZKI849/3EDxXmY39213IUH+h3gT6GgCuhh5y/ByUVpuUa
vvsRHFaUP2WlrVSp51p1s9ioqQYxxjsfxG8mA25cv2aOFb1tc5OX2jrVWbklBSZp
wt0XTKaptsxxfExB7INobom5KflDAdB7USiW0WzYn71/L9SkcunvXMXHnHvTnEmz
yUJUdKM9kg75NBA9ehBUPFw8sVkFcYIBKKkjkLfMNMmz+IP6gExLkI5hTQw5Z8zx
DYgLeY7lPST7y4MXJOO7bAG//vkjFgopSMD3e23BpxUPlSegu5BVaA7vUO5Spahu
d1XcHmuB9dCravdGDOfcF/OV+k9Cbj39Rz/W6rnd6x1pGdpcWMK7wgB2qaVXM9/t
wJ9LaSpEcmghFyM6FCFcrYWJEywZhXYCQIfAzC9ydYI5cJ0RoDNa/PVTHYn8KKYl
6GQA1D4vTpUfnL390wktPmOCVH9+fIDRQzlu06z7LEZRlKATGyK6PQYhAqyOE79l
dgKORn5RYBpvX6pwO+9W
=T/4C
-----END PGP SIGNATURE-----

--dp3hwis4746bxiur--

--===============1563120470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1563120470==--
