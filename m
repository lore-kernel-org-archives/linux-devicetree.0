From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 00/27] Add support for R40 HDMI pipeline
Date: Thu, 14 Jun 2018 16:34:45 +0200
Message-ID: <2742773.k39D243pH3@jernej-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <CAMty3ZC-Edg5XJQpqEuwLbSFzmam3zP3zUPak4K7ypyT2+arAg@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBSP2RHMQKGQEA2E7QNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZC-Edg5XJQpqEuwLbSFzmam3zP3zUPak4K7ypyT2+arAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 14. junij 2018 ob 09:12:41 CEST je Jagan Teki napisal(a):
> On Wed, Jun 13, 2018 at 1:30 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>=
=20
wrote:
> > This series adds support for R40 HDMI pipeline. It is a bit special
> > than other already supported pipelines because it has additional unit
> > called TCON TOP responsible for relationship configuration between
> > mixers, TCONs and HDMI. Additionally, it has additional gates for DSI
> > and TV TCONs, TV encoder clock settings and pin muxing between LCD
> > and TV encoders.
> >=20
> > However, it seems that TCON TOP will become a norm, since newer
> > Allwinner SoCs like H6 also have this unit.
> >=20
> > I tested different possible configurations:
> > - mixer0 <> TCON-TV0 <> HDMI
> > - mixer0 <> TCON-TV1 <> HDMI
> > - mixer1 <> TCON-TV0 <> HDMI
> > - mixer1 <> TCON-TV1 <> HDMI
> >=20
> > Please review.
> >=20
> > Best regards,
> > Jernej
> >=20
> > Changes from v1:
> > - Split DT bindings patch and updated description
> > - Split HDMI PHY patch
> > - Move header file from TCON TOP patch to dt bindings patch
> > - Added Rob reviewed-by tag
> > - Used clk_hw_register_gate() instead of custom gate registration code
> > - Reworked TCON TOP to be part of of-graph. Because of that, a lot of
> >=20
> >   new patches were added.
> >=20
> > - Droped mixer index quirk patch
> > - Reworked TCON support for TCON TOP
> > - Updated commit messages
> >=20
> > Jernej Skrabec (27):
> >   clk: sunxi-ng: r40: Add minimal rate for video PLLs
> >   clk: sunxi-ng: r40: Allow setting parent rate to display related
> >  =20
> >     clocks
> >  =20
> >   clk: sunxi-ng: r40: Export video PLLs
> >   dt-bindings: display: sunxi-drm: Add TCON TOP description
> >   drm/sun4i: Add TCON TOP driver
> >   drm/sun4i: Fix releasing node when enumerating enpoints
> >   drm/sun4i: Split out code for enumerating endpoints in output port
> >   drm/sun4i: Add support for traversing graph with TCON TOP
> >   drm/sun4i: Don't skip TCONs if they don't have channel 0
> >   dt-bindings: display: sun4i-drm: Add R40 TV TCON description
> >   drm/sun4i: tcon: Add support for tcon-top gate
> >   drm/sun4i: tcon: Generalize engine search algorithm
> >   drm/sun4i: Don't check for LVDS and RGB when TCON has only ch1
> >   drm/sun4i: Don't check for panel or bridge on TV TCONs
> >   drm/sun4i: Add support for R40 TV TCON
> >   dt-bindings: display: sun4i-drm: Add R40 mixer compatibles
> >   drm/sun4i: Add support for R40 mixers
> >   dt-bindings: display: sun4i-drm: Add description of A64 HDMI PHY
> >   drm/sun4i: Enable DW HDMI PHY clock
> >   drm/sun4i: Don't change clock bits in DW HDMI PHY driver
> >   drm/sun4i: DW HDMI PHY: Add support for second PLL
> >   drm/sun4i: Add support for second clock parent to DW HDMI PHY clk
> >  =20
> >     driver
> >  =20
> >   drm/sun4i: Add support for A64 HDMI PHY
> >   drm: of: Export drm_crtc_port_mask()
> >   drm/sun4i: DW HDMI: Expand algorithm for possible crtcs
> >   ARM: dts: sun8i: r40: Add HDMI pipeline
> >   ARM: dts: sun8i: r40: Enable HDMI output on BananaPi M2 Ultra
>=20
> Tested whole series on top of linux-next.
>=20
> Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Thanks!



--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
