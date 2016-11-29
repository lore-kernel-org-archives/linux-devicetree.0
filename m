From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Tue, 29 Nov 2016 21:04:55 +0100
Message-ID: <20161129210455.d0c8450d3ceb83c1abe521b0@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
	<5996605.Gh0PjPIAcn@avalon>
	<20161129202751.e94f72a1b9e2c2fb064e9933@free.fr>
	<6356753.Ekaj7GdA0W@avalon>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB3N667AQKGQEY7ZIOMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6356753.Ekaj7GdA0W@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Nov 2016 21:33 +0200
Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> > > You need a third port for the HDMI encoder output, connected to an HD=
MI
> > > connector DT node.
> >=20
> > I don't see what you mean. The HDMI device is both the encoder
> > and connector (as the TDA998x):
>=20
> The driver might create both an encoder and a connector, but I very much =
doubt=20
> that the "allwinner,sun8i-a83t-hdmi" hardware contains a connector, unles=
s the=20
> SoC package has an HDMI connector coming out of it :-)
>=20
> > plane -> DE2 mixer ---> TCON -----> HDMI -----> display device
> > ----- plane ------    - CRTC -   - encoder  \
> >                                    connector -- (HDMI cable)
> >          audio-controller -   - audio-codec /

The schema is the same as the Dove Cubox: the TDA998x is just a chip
with some wires going out and the physical connector is supposed to be
at the end of the wires.

Here, the HDMI pins of the SoC go to a pure hardware chip and then to
the physical connector. Which software entity do you want to add?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
