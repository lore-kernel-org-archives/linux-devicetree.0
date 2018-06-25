From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 00/24] Add support for R40 HDMI pipeline
Date: Mon, 25 Jun 2018 18:43:01 +0200
Message-ID: <20180625164300.vivzyu3g52d2pjdn@flea>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fedf5x4px5amfvpi"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFVXYTMQKGQEND6CFPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180625120304.7543-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fedf5x4px5amfvpi
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jun 25, 2018 at 02:02:40PM +0200, Jernej Skrabec wrote:
> This series adds support for R40 HDMI pipeline. It is a bit special
> than other already supported pipelines because it has additional unit
> called TCON TOP responsible for relationship configuration between
> mixers, TCONs and HDMI. Additionally, it has additional gates for DSI
> and TV TCONs, TV encoder clock settings and pin muxing between LCD
> and TV encoders.
> 
> However, it seems that TCON TOP will become a norm, since newer
> Allwinner SoCs like H6 also have this unit.
> 
> I tested different possible configurations:
> - mixer0 <> TCON-TV0 <> HDMI
> - mixer0 <> TCON-TV1 <> HDMI
> - mixer1 <> TCON-TV0 <> HDMI
> - mixer1 <> TCON-TV1 <> HDMI
> 
> Please review.

This looks all fine by me, thanks!

I'd still like some more review (by Chen-Yu and Rob) before applying
it, but you can add my Acked-by for the next round if needed.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--fedf5x4px5amfvpi--
