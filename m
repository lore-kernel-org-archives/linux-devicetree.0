From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Wed, 30 Nov 2016 11:52:25 +0200
Message-ID: <3478036.d2UQM8n6lv@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <4614815.L3DQhhBy6d@avalon> <20161130102757.9eec1f7f3377d0f4787e3829@free.fr>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBS6C7LAQKGQEWRRELLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130102757.9eec1f7f3377d0f4787e3829-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jean-Fran=C3=A7ois,

On Wednesday 30 Nov 2016 10:27:57 Jean-Francois Moine wrote:
> On Wed, 30 Nov 2016 10:20:21 +0200 Laurent Pinchart wrote:
> >> Well, I don't see what this connector can be.
> >> May you give me a DT example?
> >=20
> > Sure.
> >=20
> > arch/arm/boot/dts/r8a7791-koelsch.dts
> >=20
> >         /* HDMI encoder */
> >        =20
> >         hdmi@39 {
> >                 compatible =3D "adi,adv7511w";
> >                 reg =3D <0x39>;
> >                 interrupt-parent =3D <&gpio3>;
> >                 interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
> >                =20
> >                 adi,input-depth =3D <8>;
> >                 adi,input-colorspace =3D "rgb";
> >                 adi,input-clock =3D "1x";
> >                 adi,input-style =3D <1>;
> >                 adi,input-justification =3D "evenly";
> >                =20
> >                 ports {
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <0>;
> >                        =20
> >                         port@0 {
> >                                 reg =3D <0>;
> >                                 adv7511_in: endpoint {
> >                                         remote-endpoint =3D <&du_out_rg=
b>;
> >                                 };
> >                         };
> >                        =20
> >                         port@1 {
> >                                 reg =3D <1>;
> >                                 adv7511_out: endpoint {
> >                                         remote-endpoint =3D <&hdmi_con>=
;
> >                                 };
> >                         };
> >                 };
> >        =20
> >         };
> >        =20
> >         /* HDMI connector */
> >        =20
> >         hdmi-out {
> >                 compatible =3D "hdmi-connector";
> >                 type =3D "a";
> >                =20
> >                 port {
> >                         hdmi_con: endpoint {
> >                                 remote-endpoint =3D <&adv7511_out>;
> >                         };
> >                 };
> >         };
>=20
> Hi Laurent,
>=20
> Sorry for I don't see the interest:
> - it is obvious that the HDMI connector is a 'hdmi-connector'!

It still has to be told to the drivers, they don't know how to identify a=
=20
connector by looking at it :-)

> - the physical connector type may be changed on any board by a soldering
>   iron or a connector to connector cable.

Which is also true for any other component on the board. DT (and for that=
=20
matter any firmware description of the platform) isn't soldering-proof.

> - what does the software do with the connector type?

That's up to the software to decide, the DT bindings should describe the=20
hardware in the most accurate and usable way for the OS as possible. One of=
 my=20
longer term goals is to add connector drivers to handle DDC and HPD when=20
they're not handled by the encoder (they are in the above example).

If the DDC was connected to a general-purpose I2C bus of the SoC, and the H=
PD=20
to a GPIO, we would have

	hdmi-out {
		compatible =3D "hdmi-connector";
		type =3D "a";
		/* I2C bus and GPIO references are made up for the example */
		ddc-i2c-bus =3D <&i2c4>;
		hpd-gpios =3D <&gpio4 7 GPIO_ACTIVE_HIGH>

		port {
			hdmi_con: endpoint {
				remote-endpoint =3D <&adv7511_out>;
			};
		};
	};

and both HPD and EDID reading should be handled by the connector driver.

> - why not to put the connector information in the HDMI device?

Because the connector is separate from the encoder. It's not uncommon=20
(depending on the encoder type) to have the encoder output connected to a n=
on-
connector entity such as another chained encoder.

For example most LVDS encoders are connected to a panel, but I have a board=
=20
with the following encoders chain.

CRTC -- parallel RGB --> on-SoC LVDS encoder -- LVDS --> on-board LVDS deco=
der=20
-- parallel RGB --> HDMI encoder -- HDMI --> HDMI connector

I can't support that if the LVDS encoder driver hardcodes the assumption th=
at=20
the encoder output is connected to a panel. This kind of usage might be les=
s=20
common for HDMI but is certainly not inconceivable.

> And, if I follow you, the graph of ports could also be used to describe
> the way the various parts of the SoCs are powered, to describe the pin
> connections, to describe the USB connectors, to describe the board
> internal hubs and bridges...

It should be used where applicable, it's not meant as the only possible=20
hardware description for all pieces of the system.

--=20
Regards,

Laurent Pinchart

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
