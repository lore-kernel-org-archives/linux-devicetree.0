From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] dt-bindings: Add schemas for simple-framebuffer
Date: Mon, 1 Apr 2019 12:52:53 +0200
Message-ID: <20190401105253.oakh3uboz3vcgaj7@flea>
References: <20190325135414.9728-1-maxime.ripard@bootlin.com>
 <CAL_JsqKep7B6LKUMRRxonKV48YEHtYow9TjKJwDUVN0S2BX3Ww@mail.gmail.com>
 <20190326213526.w3t7fga7uzkkliq7@flea>
 <CAL_JsqK=sazBCP7BBvzaBtvCxrtHVB0jbSqY4XmWgEz6B-5y7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6240477670821120452=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqK=sazBCP7BBvzaBtvCxrtHVB0jbSqY4XmWgEz6B-5y7Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Jourdan <mjourdan@baylibre.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6240477670821120452==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ver4pxryopk6mkpe"
Content-Disposition: inline


--ver4pxryopk6mkpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Wed, Mar 27, 2019 at 08:20:18AM -0500, Rob Herring wrote:
> On Tue, Mar 26, 2019 at 4:35 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > On Mon, Mar 25, 2019 at 11:27:36AM -0500, Rob Herring wrote:
> > > On Mon, Mar 25, 2019 at 8:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > >
> > > > The simple framebuffer is a binding that allows the bootloader to setup a
> > > > framebuffer, describe it in the Device Tree for the OS to pick it up and
> > > > use it as is.
> > > >
> > > > Replace the current binding by a schema to allow the validation tools to
> > > > check those nodes.
> > > >
> > > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > > Cc: Maxime Jourdan <mjourdan@baylibre.com>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > > >
> > > > ---
> > > >
> > > > Rob,
> > > >
> > > > Even though the node itself is properly described, I still end up with some
> > > > validation warnings when the chosen node is validated (basically
> > > > complaining that ranges, and the framebuffer nodes shouldn't be here, since
> > > > we haven't described them in the chosen schemas).
> > >
> > > Having 'ranges' is a bit strange because 'chosen' doesn't have an
> > > address. We can add #address-cells, #size-cells and framebuffer child
> > > node to the base chosen schema.

I've just sent a github PR to do that.

> > Maybe that's just cargo cult, but both the amlogic and the sunxi DT
> > have ranges in chosen. Shouldn't we need it so that the address is
> > decoded properly?
>
> I don't think so. If you have #{size,address}-cells then that should
> be enough. Lack of ranges should just mean that any translation stops
> at that level. But it is possible that the kernel code requires
> translation to go all the way to the root for memory addresses. I
> haven't checked.

I tested it, and it looks like of_translate_address returns EINVAL if
ranges is missing. If that's not desired, then I can look into it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ver4pxryopk6mkpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKHthQAKCRDj7w1vZxhR
xbmUAQCTkmDrLqtWqobnC14Z6+AF71RCc1xM7mDnUCuVn1+P6gEA98D8TPwM+Agm
mairFtF8LX6JqtsGj/rwbm38fl8eFAg=
=/QXO
-----END PGP SIGNATURE-----

--ver4pxryopk6mkpe--


--===============6240477670821120452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6240477670821120452==--
