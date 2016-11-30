From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Wed, 30 Nov 2016 11:44:15 +0100
Message-ID: <20161130114415.2280151e2965280733a629e5@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
	<4614815.L3DQhhBy6d@avalon>
	<20161130102757.9eec1f7f3377d0f4787e3829@free.fr>
	<3478036.d2UQM8n6lv@avalon>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBA637LAQKGQE76DMOCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3478036.d2UQM8n6lv@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Nov 2016 11:52:25 +0200
Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> Hi Jean-Fran=C3=A7ois,
>=20
> On Wednesday 30 Nov 2016 10:27:57 Jean-Francois Moine wrote:
> > On Wed, 30 Nov 2016 10:20:21 +0200 Laurent Pinchart wrote:
> > >> Well, I don't see what this connector can be.
> > >> May you give me a DT example?
> > >=20
> > > Sure.
> > >=20
> > > arch/arm/boot/dts/r8a7791-koelsch.dts
> > >=20
> > >         /* HDMI encoder */
	[snip]
> > >         /* HDMI connector */
> > >        =20
> > >         hdmi-out {
> > >                 compatible =3D "hdmi-connector";
> > >                 type =3D "a";
> > >                =20
> > >                 port {
> > >                         hdmi_con: endpoint {
> > >                                 remote-endpoint =3D <&adv7511_out>;
> > >                         };
> > >                 };
> > >         };
	[snip]
> > - what does the software do with the connector type?
>=20
> That's up to the software to decide, the DT bindings should describe the=
=20
> hardware in the most accurate and usable way for the OS as possible. One =
of my=20
> longer term goals is to add connector drivers to handle DDC and HPD when=
=20
> they're not handled by the encoder (they are in the above example).
>=20
> If the DDC was connected to a general-purpose I2C bus of the SoC, and the=
 HPD=20
> to a GPIO, we would have
>=20
> 	hdmi-out {
> 		compatible =3D "hdmi-connector";
> 		type =3D "a";
> 		/* I2C bus and GPIO references are made up for the example */
> 		ddc-i2c-bus =3D <&i2c4>;
> 		hpd-gpios =3D <&gpio4 7 GPIO_ACTIVE_HIGH>
>=20
> 		port {
> 			hdmi_con: endpoint {
> 				remote-endpoint =3D <&adv7511_out>;
> 			};
> 		};
> 	};
>=20
> and both HPD and EDID reading should be handled by the connector driver.
	[snip]

Hi Laurent,

OK. I understand. This connector complexity should be added in all DTs,
and the same code would be used.

Actually, for component binding, I use drm_of_component_probe():

- from the DRM master, loop on the "ports" phandle array and bind the
  CRTCs,

- for each CRTC, loop on the first remote port level and bind the
  encoders/connectors

Now, this should be:

- from the DRM master, loop on the first remote ports level and bind
  the CRTCs,

- for each CRTC, loop on the second remote port level and bind the
  encoders (and bridges?),

- for each encoder, loop on the third remote port level and bind the
  connectors.

Then, it would be nice to have a generic function for doing this job.

Otherwise, from your description:

> 	hdmi-out {
> 		compatible =3D "hdmi-connector";
> 		type =3D "a";
> 		/* I2C bus and GPIO references are made up for the example */
> 		ddc-i2c-bus =3D <&i2c4>;
> 		hpd-gpios =3D <&gpio4 7 GPIO_ACTIVE_HIGH>

the "hdmi-connector" is a big piece of software. It must handle a lot
of more and more exotic connectors.
So, I hope that you have written a "simple-hdmi-connector" which does
nothing but setting the connector type.
Where is it?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
