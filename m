From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH RESEND v2 06/12] drm/sun4i: rgb: Add 1%
 tolerance to dclk frequency check when bridge is connected
Date: Tue, 5 Feb 2019 16:41:56 +0100
Message-ID: <20190205154156.o3aa4cy6uxenkwol@flea>
References: <20190203185501.8958-1-anarsoul@gmail.com>
 <20190203185501.8958-7-anarsoul@gmail.com>
 <20190204142036.vd42nvyjnjr5yeoi@flea>
 <CA+E=qVfTfJ9E29gz83tdVGx5_KGWSQVJOAxKTzC+-n7=gdj0cA@mail.gmail.com>
 <0F6CBEA4-6DB6-40F1-A2FD-65101AF64F1F@aosc.io>
 <CA+E=qVd7yh=JNZSvrfY4Diu+VJWFK6yLUJ5MavBcZ8Cftn6f-Q@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f4nwjulqvuyeoq2w"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSG543RAKGQENUO7HFQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CA+E=qVd7yh=JNZSvrfY4Diu+VJWFK6yLUJ5MavBcZ8Cftn6f-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--f4nwjulqvuyeoq2w
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Feb 04, 2019 at 10:50:17AM -0800, Vasily Khoruzhick wrote:
> On Mon, Feb 4, 2019 at 8:29 AM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > >> IIRC, from the previous discussion, HDMI had a tolerancy requirement
> > >> in the standard. Do you know if there's such a thing for eDP? That
> > >> would solve the issue for all the eDP displays at once.
> > >
> > >I don't have access to eDP standard - vesa.org says it's available to
> > >members only.
> >
> > Try out to grab an old version?
> >
> > I remember 1.0 is open.
> 
> I can't find anything regarding dot clock tolerance in DisplayPort
> specification.

I guess since the DP is a VESA spec, it's probably .5%, just like on
the EDID (well, CVT).

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--f4nwjulqvuyeoq2w--
