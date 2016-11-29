From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Tue, 29 Nov 2016 22:10:01 +0200
Message-ID: <4502748.8rUF7ESxa4@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <6356753.Ekaj7GdA0W@avalon> <20161129210455.d0c8450d3ceb83c1abe521b0@free.fr>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBC6B67AQKGQEUUBVQLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161129210455.d0c8450d3ceb83c1abe521b0-GANU6spQydw@public.gmane.org>
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

On Tuesday 29 Nov 2016 21:04:55 Jean-Francois Moine wrote:
> On Tue, 29 Nov 2016 21:33 +0200 Laurent Pinchart wrote:
> >>> You need a third port for the HDMI encoder output, connected to an
> >>> HDMI connector DT node.
> >>=20
> >> I don't see what you mean. The HDMI device is both the encoder
> >> and connector (as the TDA998x):
> >
> > The driver might create both an encoder and a connector, but I very muc=
h
> > doubt that the "allwinner,sun8i-a83t-hdmi" hardware contains a connecto=
r,
> > unless the SoC package has an HDMI connector coming out of it :-)
> >=20
> >> plane -> DE2 mixer ---> TCON -----> HDMI -----> display device
> >> ----- plane ------    - CRTC -   - encoder  \
> >>                                    connector -- (HDMI cable)
> >>          audio-controller -   - audio-codec /
>=20
> The schema is the same as the Dove Cubox: the TDA998x is just a chip
> with some wires going out and the physical connector is supposed to be
> at the end of the wires.

I've missed the Dove Cubox DT bindings when they were submitted. Fortunatel=
y=20
(or unfortunately for you, depending on how you look at it ;-)) I've paid m=
ore=20
attention this time.

> Here, the HDMI pins of the SoC go to a pure hardware chip and then to
> the physical connector. Which software entity do you want to add?

I don't want to add a software entity, I just want to model the connector i=
n=20
DT as it's present in the system. Even though that's more common for other =
bus=20
types than HDMI (LVDS for instance) it wouldn't be inconceivable to connect=
=20
the HDMI signals to an on-board chim instead of an HDMI connector, so the H=
DMI=20
encoder output should be modelled by a port and connected to a connector DT=
=20
node in this case.

--=20
Regards,

Laurent Pinchart

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
