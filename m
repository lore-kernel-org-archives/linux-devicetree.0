From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Wed, 30 Nov 2016 10:20:21 +0200
Message-ID: <4614815.L3DQhhBy6d@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <4502748.8rUF7ESxa4@avalon> <20161130091208.f38cd79f1cc5d27b27f3b130@free.fr>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBN4X7LAQKGQEZ5Z2NVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130091208.f38cd79f1cc5d27b27f3b130-GANU6spQydw@public.gmane.org>
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

On Wednesday 30 Nov 2016 09:12:08 Jean-Francois Moine wrote:
> On Tue, 29 Nov 2016 22:10:01 +0200 Laurent Pinchart wrote:
> > On Tuesday 29 Nov 2016 21:04:55 Jean-Francois Moine wrote:
> >> On Tue, 29 Nov 2016 21:33 +0200 Laurent Pinchart wrote:
> >>>>> You need a third port for the HDMI encoder output, connected to an
> >>>>> HDMI connector DT node.
> >>>>=20
> >>>> I don't see what you mean. The HDMI device is both the encoder
> >>>=20
> >>>> and connector (as the TDA998x):
> >>> The driver might create both an encoder and a connector, but I very
> >>> much doubt that the "allwinner,sun8i-a83t-hdmi" hardware contains a
> >>> connector, unless the SoC package has an HDMI connector coming out of
> >>> it :-)
> >>>=20
> >>>> plane -> DE2 mixer ---> TCON -----> HDMI -----> display device
> >>>> ----- plane ------    - CRTC -   - encoder  \
> >>>>                                    connector -- (HDMI cable)
> >>>>          audio-controller -   - audio-codec /
> >>=20
> >> The schema is the same as the Dove Cubox: the TDA998x is just a chip
> >> with some wires going out and the physical connector is supposed to be
> >> at the end of the wires.
> >=20
> > I've missed the Dove Cubox DT bindings when they were submitted.
> > Fortunately (or unfortunately for you, depending on how you look at it
> > ;-)) I've paid more attention this time.
> >=20
> >> Here, the HDMI pins of the SoC go to a pure hardware chip and then to
> >> the physical connector. Which software entity do you want to add?
> >=20
> > I don't want to add a software entity, I just want to model the connect=
or
> > in DT as it's present in the system. Even though that's more common for
> > other bus types than HDMI (LVDS for instance) it wouldn't be
> > inconceivable to connect the HDMI signals to an on-board chim instead o=
f
> > an HDMI connector, so the HDMI encoder output should be modelled by a
> > port and connected to a connector DT node in this case.
>=20
> Well, I don't see what this connector can be.
> May you give me a DT example?

Sure.

arch/arm/boot/dts/r8a7791-koelsch.dts

        /* HDMI encoder */

        hdmi@39 {
                compatible =3D "adi,adv7511w";
                reg =3D <0x39>;
                interrupt-parent =3D <&gpio3>;
                interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;

                adi,input-depth =3D <8>;
                adi,input-colorspace =3D "rgb";
                adi,input-clock =3D "1x";
                adi,input-style =3D <1>;
                adi,input-justification =3D "evenly";

                ports {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;

                        port@0 {
                                reg =3D <0>;
                                adv7511_in: endpoint {
                                        remote-endpoint =3D <&du_out_rgb>;
                                };
                        };

                        port@1 {
                                reg =3D <1>;
                                adv7511_out: endpoint {
                                        remote-endpoint =3D <&hdmi_con>;
                                };
                        };
                };
        };

        /* HDMI connector */

        hdmi-out {
                compatible =3D "hdmi-connector";
                type =3D "a";

                port {
                        hdmi_con: endpoint {
                                remote-endpoint =3D <&adv7511_out>;
                        };
                };
        };

--=20
Regards,

Laurent Pinchart

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
