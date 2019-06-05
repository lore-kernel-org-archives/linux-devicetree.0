From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Date: Wed, 5 Jun 2019 14:02:37 +0200
Message-ID: <20190605120237.ekmytfxcwbjaqy3x@flea>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qiya5ip3hgidvmzq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605101317.GA9345@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--qiya5ip3hgidvmzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2019 at 12:13:17PM +0200, Torsten Duwe wrote:
> On Tue, Jun 04, 2019 at 08:08:40AM -0700, Vasily Khoruzhick wrote:
> > On Tue, Jun 4, 2019 at 5:23 AM Torsten Duwe <duwe@lst.de> wrote:
> > >
> > > Teres-I has an anx6345 bridge connected to the RGB666 LCD output, and
> > > the I2C controlling signals are connected to I2C0 bus. eDP output goes
> > > to an Innolux N116BGE panel.
> > >
> > > Enable it in the device tree.
> > >
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > Signed-off-by: Torsten Duwe <duwe@suse.de>
> > > ---
> > >  .../boot/dts/allwinner/sun50i-a64-teres-i.dts      | 65 ++++++++++++++++++++--
> > >  1 file changed, 61 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > index 0ec46b969a75..a0ad438b037f 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > @@ -65,6 +65,21 @@
> > >                 };
> > >         };
> > >
> > > +       panel: panel {
> > > +               compatible ="innolux,n116bge", "simple-panel";
> >
> > It's still "simple-panel". I believe I already mentioned that Rob
> > asked it to be edp-connector.
>
> For which there are neither bindings nor drivers.
>
> Is anybody seriously proposing to hold back support for existing
> (open source!) hardware in favour of an *imaginable* *possibly*
> better solution? Especially when this exact line is already used in
> some other places?  (there's a space missing btw...)

It's non-existent and imaginable only because you've been ignoring
everyone that said that you should do it. So it's self-inflicted,
really.

And the DT is considered an ABI, so yeah, we will witheld everything
that doesn't fit what we would like. Your point of view is that it's
more work and for no particular benefit, ours is that it's a
short-term pain for a long-term gain, and the benefits will be in the
maintainance cost.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qiya5ip3hgidvmzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPevXQAKCRDj7w1vZxhR
xRaUAP4rsNSfzJsmzwtJIlX1UQvArevsqZjEbly5zQoUU26FyAEAsSQVhJt3Xdhr
y/w4nPyt47sTpjL2pjXHbkTaW+M7hw0=
=y5GR
-----END PGP SIGNATURE-----

--qiya5ip3hgidvmzq--
