From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Tue, 29 Nov 2016 20:27:51 +0100
Message-ID: <20161129202751.e94f72a1b9e2c2fb064e9933@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
	<cd1caff75b6069af98680f78d672546748cb43c5.1480414715.git.moinejf@free.fr>
	<5996605.Gh0PjPIAcn@avalon>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBO5N67AQKGQE46JULDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5996605.Gh0PjPIAcn@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Nov 2016 20:46:22 +0200
Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
	[snip]
> > +Example:
> > +
> > +	hdmi: hdmi@01ee0000 {
> > +		compatible =3D "allwinner,sun8i-a83t-hdmi";
> > +		reg =3D <0x01ee0000 0x20000>;
> > +		clocks =3D <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
> > +			 <&ccu CLK_HDMI_DDC>;
> > +		clock-names =3D "bus", "clock", "ddc-clock";
> > +		resets =3D <&ccu RST_HDMI0>, <&ccu RST_HDMI1>;
> > +		reset-names =3D "hdmi0", "hdmi1";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&hdmi_pins_a>;
> > +		status =3D "disabled";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		port@0 {			/* video */
> > +			reg =3D <0>;
> > +			hdmi_tcon1: endpoint {
> > +				remote-endpoint =3D <&tcon1_hdmi>;
> > +			};
> > +		};
> > +		port@1 {			/* audio */
> > +			reg =3D <1>;
> > +			hdmi_i2s2: endpoint {
> > +				remote-endpoint =3D <&i2s2_hdmi>;
> > +			};
> > +		};
>=20
> You need a third port for the HDMI encoder output, connected to an HDMI=
=20
> connector DT node.

I don't see what you mean. The HDMI device is both the encoder
and connector (as the TDA998x):

plane -> DE2 mixer ---> TCON -----> HDMI -----> display device
----- plane ------    - CRTC -   - encoder  \
                                   connector -- (HDMI cable)
         audio-controller -   - audio-codec /

> > +	};

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
