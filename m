From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Wed, 30 Nov 2016 10:27:57 +0100
Message-ID: <20161130102757.9eec1f7f3377d0f4787e3829@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
	<4502748.8rUF7ESxa4@avalon>
	<20161130091208.f38cd79f1cc5d27b27f3b130@free.fr>
	<4614815.L3DQhhBy6d@avalon>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBIFX7LAQKGQELF6WSUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4614815.L3DQhhBy6d@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Nov 2016 10:20:21 +0200
Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> > Well, I don't see what this connector can be.
> > May you give me a DT example?
>=20
> Sure.
>=20
> arch/arm/boot/dts/r8a7791-koelsch.dts
>=20
>         /* HDMI encoder */
>=20
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
>                 interrupt-parent =3D <&gpio3>;
>                 interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
>=20
>                 adi,input-depth =3D <8>;
>                 adi,input-colorspace =3D "rgb";
>                 adi,input-clock =3D "1x";
>                 adi,input-style =3D <1>;
>                 adi,input-justification =3D "evenly";
>=20
>                 ports {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>=20
>                         port@0 {
>                                 reg =3D <0>;
>                                 adv7511_in: endpoint {
>                                         remote-endpoint =3D <&du_out_rgb>=
;
>                                 };
>                         };
>=20
>                         port@1 {
>                                 reg =3D <1>;
>                                 adv7511_out: endpoint {
>                                         remote-endpoint =3D <&hdmi_con>;
>                                 };
>                         };
>                 };
>         };
>=20
>         /* HDMI connector */
>=20
>         hdmi-out {
>                 compatible =3D "hdmi-connector";
>                 type =3D "a";
>=20
>                 port {
>                         hdmi_con: endpoint {
>                                 remote-endpoint =3D <&adv7511_out>;
>                         };
>                 };
>         };

Hi Laurent,

Sorry for I don't see the interest:
- it is obvious that the HDMI connector is a 'hdmi-connector'!
- the physical connector type may be changed on any board by a soldering
  iron or a connector to connector cable.
- what does the software do with the connector type?
- why not to put the connector information in the HDMI device?

And, if I follow you, the graph of ports could also be used to describe
the way the various parts of the SoCs are powered, to describe the pin
connections, to describe the USB connectors, to describe the board
internal hubs and bridges...

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
