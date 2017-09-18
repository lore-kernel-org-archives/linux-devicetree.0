From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH v2 06/10] arm64: allwinner: a64: Add
 devicetree binding for DMA controller
Date: Mon, 18 Sep 2017 13:38:50 +0000
Message-ID: <13822703.glkPkggzn6@sbruens-linux>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-7-stefan.bruens@rwth-aachen.de>
 <20170918081134.obpoaiwd7dgzdcak@flea.lan>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRB3EY77GQKGQENYMDY6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170918081134.obpoaiwd7dgzdcak-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
Content-ID: <29E16918749D36448517A33892830162-KnNo0XtUZUuELgA04lAiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Montag, 18. September 2017 10:11:34 CEST Maxime Ripard wrote:
> On Sun, Sep 17, 2017 at 05:19:52AM +0200, Stefan Br=C3=BCns wrote:
> > The A64 is register compatible with the H3, but has a different number
> > of dma channels and request ports.
> >=20
> > Attach additional properties to the node to allow future reuse of the
> > compatible for controllers with different number of channels/requests.
> >=20
> > If dma-requests is not specified, the register layout defined maximum
> > of 32 is used.
> >=20
> > Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> > ---
> >=20
> >  .../devicetree/bindings/dma/sun6i-dma.txt          | 26
> >  ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> > b/Documentation/devicetree/bindings/dma/sun6i-dma.txt index
> > 98fbe1a5c6dd..6ebc79f95202 100644
> > --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> >=20
> > @@ -27,6 +27,32 @@ Example:
> >  		#dma-cells =3D <1>;
> >  =09
> >  	};
> >=20
> > +----------------------------------------------------------------------=
---
> > ----- +For A64 DMA controller:
> > +
> > +Required properties:
> > +- compatible:	"allwinner,sun50i-a64-dma"
> > +- dma-channels: Number of DMA channels supported by the controller.
> > +		Refer to Documentation/devicetree/bindings/dma/dma.txt
> > +- all properties above, i.e. reg, interrupts, clocks, resets and
> > #dma-cells +
> > +Optional properties:
> > +- dma-requests: Number of DMA request signals supported by the
> > controller.
> > +		Refer to Documentation/devicetree/bindings/dma/dma.txt
>=20
> You're error'ing out if dma-requests, so it isn't optional. I guess we
> should just make it mandatory.

No, it defaults to DMA_CHAN_MAX_DRQ =3D 31, see patch 07/10.

Kind regards,

Stefan

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
