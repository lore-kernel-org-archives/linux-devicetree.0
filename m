From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [RFC 00/13] arm64: allwinner: Add A64 DE2 pipeline support
Date: Wed, 25 Apr 2018 19:59:53 +0200
Message-ID: <3749004.y60xFsjo5d@jernej-laptop>
References: <20180424133425.24291-1-jagan@amarulasolutions.com> <4355590.Ql03JAEh1C@jernej-laptop> <CAMty3ZCTtB__eWub2PbHK_DHSVQsf4V1eECX6bfwDq99pXaLJQ@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBLMEQPLQKGQEN73PCXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZCTtB__eWub2PbHK_DHSVQsf4V1eECX6bfwDq99pXaLJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Dne sreda, 25. april 2018 ob 12:34:09 CEST je Jagan Teki napisal(a):
> On Tue, Apr 24, 2018 at 9:02 PM, Jernej =C5=A0krabec <jernej.skrabec@siol=
.net>=20
wrote:
> > Hi,
> >=20
> > Dne torek, 24. april 2018 ob 15:34:12 CEST je Jagan Teki napisal(a):
> >> Allwinner A64 has display engine pipeline like other Allwinner SOC's
> >> A83T/H3/H5.
> >>=20
> >> A64 DE2 behaviour similar to Allwinner A83T where mixer0, connected to
> >> tcon0 with RGB, LVDS MIPI-DSI and mixer1, connected to tcon1 with HDMI=
.
> >> This series merely concentrated on HDMI pipeline and rest will add
> >> eventually.
> >>=20
> >> patch 1: dt-bindings for a64 DE2 CCU
> >>=20
> >> patch 2: a64 DE2 CCU node addition
> >>=20
> >> patch 3: dt-bindings for a64 DE2 pipeline
> >>=20
> >> patch 4 - 5: dt-bindings for a64 mixer0 and tcon-lcd
> >>=20
> >> patch 6: a64 DE2 pipeline node addition
> >>=20
> >> patch 7 - 8: dt-bindings for a64 HDMI and HDMI PHY
> >>=20
> >> patch 9: a64 HDMI nodes addition
> >>=20
> >> patch 10 - 11: dt-bindings for a64 mixer1 and tcon-tv
> >>=20
> >> patch 12: a64 HDMI pipeline
> >>=20
> >> patch 13: enable HDMI out on bananpi-m64
> >>=20
> >> Tested HDMI on bananapi-m64 (along with DE2 SRAM C changes from [1]
> >> thread), able to detect the HDMI but, no penguins on screen.
> >>=20
> >> Request for any suggestions.
> >=20
> > You are mising sunxi-ng clock patches. PLL_VIDEO0 and PLL_VIDEO1 need
> > fixes by setting minimum stable frequency. Please note that datasheet m=
ay
> > have wrong information. That was obvious in H3 case and I had to check
> > minimum stable PLL_VIDEO frequency in BSP driver.
>=20
> Can you point me the clock patches?=20

Here is my A64 HDMI wip repo, which includes my clock changes:
https://github.com/jernejsk/linux-1/tree/a64_hdmi_wip

At some point HDMI output worked ok, I'm not sure in what state I left the=
=20
code.

> I've phadled only CLK_PLL_VIDEO0
> on hdmi_phy So we need CLK_PLL_VIDEO1 as fourth clock?

I'm not sure what is the best way. I guess some research is needed. There i=
s=20
even the possibility that one bit (SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL) in hdm=
i=20
phy needs to be toggled depending on which clock is selected as HDMI source=
. I=20
never finished my research since I'm waiting to SRAM C claiming patches.

At the end, HDMI driver should be tested by both, PLL_VIDEO0 and PLL_VIDEO1=
 as=20
a HDMI clock source, otherwise there is no guarantee that we got binding=20
right. A83T, H3 and H5 has only one possible HDMI parent clock, so it was m=
uch=20
easier in this regard.

Unfortunately, BSP driver is not much of a help, since it was always=20
distributed as a blob. Disassembly looks much like H3 driver, with few bits=
=20
added. However, BSP clocks are pretty much hardcoded so they don't tell all=
=20
the story.

Best regards,
Jernej


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
