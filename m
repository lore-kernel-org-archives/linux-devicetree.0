From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 08/10] ARM: dts: sun4i: Enable HDMI support
 on some A10 devices
Date: Tue, 17 Oct 2017 20:10:05 +0200
Message-ID: <20171017181005.7x6wwuidzsm7kep3@flea.lan>
References: <20171017121807.2994-1-wens@csie.org>
 <20171017121807.2994-9-wens@csie.org>
 <CAGb2v65Z2N24AZp=Y-_YgKuZiT1uSDX5pzMrceU3+TY=+Zdf7g@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6nrfvyrqwqmsnmkm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7UOTHHQKGQEDTPJY2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v65Z2N24AZp=Y-_YgKuZiT1uSDX5pzMrceU3+TY=+Zdf7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6nrfvyrqwqmsnmkm
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Oct 17, 2017 at 10:38:45PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
> > index 2d1b4329f54a..e39ec9beef75 100644
> > --- a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
> > +++ b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
> > @@ -58,6 +58,17 @@
> >                 stdout-path = "serial0:115200n8";
> >         };
> >
> > +       hdmi-connector {
> > +               compatible = "hdmi-connector";
> > +               type = "a";
> > +
> > +               port {
> > +                       hdmi_con_in: endpoint {
> > +                               remote-endpoint = <&hdmi_out_con>;
> > +                       };
> > +               };
> > +       };
> > +
> >         leds {
> >                 compatible = "gpio-leds";
> >                 pinctrl-names = "default";
> > @@ -106,6 +117,16 @@
> >         status = "okay";
> >  };
> 
> The LIME's dts change is missing the &de part. :(
> I can fix this when applying.

I've applied all of rest, I'll leave that one up to you, with my
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--6nrfvyrqwqmsnmkm--
