From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] dt-bindings: Add schemas for simple-framebuffer
Date: Tue, 26 Mar 2019 22:35:26 +0100
Message-ID: <20190326213526.w3t7fga7uzkkliq7@flea>
References: <20190325135414.9728-1-maxime.ripard@bootlin.com>
 <CAL_JsqKep7B6LKUMRRxonKV48YEHtYow9TjKJwDUVN0S2BX3Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6419337784756979708=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKep7B6LKUMRRxonKV48YEHtYow9TjKJwDUVN0S2BX3Ww@mail.gmail.com>
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


--===============6419337784756979708==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mizbkw563ycmwfqp"
Content-Disposition: inline


--mizbkw563ycmwfqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Mar 25, 2019 at 11:27:36AM -0500, Rob Herring wrote:
> On Mon, Mar 25, 2019 at 8:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The simple framebuffer is a binding that allows the bootloader to setup a
> > framebuffer, describe it in the Device Tree for the OS to pick it up and
> > use it as is.
> >
> > Replace the current binding by a schema to allow the validation tools to
> > check those nodes.
> >
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Maxime Jourdan <mjourdan@baylibre.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > ---
> >
> > Rob,
> >
> > Even though the node itself is properly described, I still end up with some
> > validation warnings when the chosen node is validated (basically
> > complaining that ranges, and the framebuffer nodes shouldn't be here, since
> > we haven't described them in the chosen schemas).
>
> Having 'ranges' is a bit strange because 'chosen' doesn't have an
> address. We can add #address-cells, #size-cells and framebuffer child
> node to the base chosen schema.

Maybe that's just cargo cult, but both the amlogic and the sunxi DT
have ranges in chosen. Shouldn't we need it so that the address is
decoded properly?

> > I've tried to expand it, but I failed, using that patch:
> > http://code.bulix.org/mimu5z-634661?raw
>
> That should work, but you will still get warnings from the core
> schema. Also, I guess you really want to match on the child compatible
> which isn't possible with the current tools. I think for now at least,
> we don't need to validate that simple-fb is a child of chosen.

Ok, so the current patch would be good enough for now I guess.

> Maybe we could add a '$parent' property which the tools add like
> $nodename. I'd rather wait and see how frequently we need something
> like this.

ACK.

I'll address the rest of your comments, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mizbkw563ycmwfqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXJqbHgAKCRDj7w1vZxhR
xdtHAP9BjNYudQekRuOXzOK/yYb2NLPkJLbzftWO+0dhJV+wsAEAnSmxLsszA/ag
YhS3941NvOU6l1rLXyzFyAInmmG6oAQ=
=evz6
-----END PGP SIGNATURE-----

--mizbkw563ycmwfqp--


--===============6419337784756979708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6419337784756979708==--
