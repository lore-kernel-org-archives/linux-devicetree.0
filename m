From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 00/13] arm64: allwinner: Add A64 DE2 pipeline support
Date: Wed, 25 Apr 2018 15:55:48 +0200
Message-ID: <20180425135548.ayeqo7t2dtbwq3of@flea>
References: <20180424133425.24291-1-jagan@amarulasolutions.com>
 <20180424140850.ptxpmtusour7u6nb@flea>
 <CAMty3ZCLOkdmCoh4uBhYKXgDEiAnw+b_z=d0Om2bjH7HLCa7Tg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bimpxlhks3s6pru5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4ERQLLQKGQEKPNKGBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZCLOkdmCoh4uBhYKXgDEiAnw+b_z=d0Om2bjH7HLCa7Tg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bimpxlhks3s6pru5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Apr 25, 2018 at 06:29:05PM +0530, Jagan Teki wrote:
> On Tue, Apr 24, 2018 at 7:38 PM, Maxime Ripard
> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Tue, Apr 24, 2018 at 07:04:12PM +0530, Jagan Teki wrote:
> >> Allwinner A64 has display engine pipeline like other Allwinner SOC's A83T/H3/H5.
> >>
> >> A64 DE2 behaviour similar to Allwinner A83T where mixer0, connected to tcon0 with
> >> RGB, LVDS MIPI-DSI and mixer1, connected to tcon1 with HDMI.
> >> This series merely concentrated on HDMI pipeline and rest will add eventually.
> >>
> >> patch 1: dt-bindings for a64 DE2 CCU
> >>
> >> patch 2: a64 DE2 CCU node addition
> >>
> >> patch 3: dt-bindings for a64 DE2 pipeline
> >>
> >> patch 4 - 5: dt-bindings for a64 mixer0 and tcon-lcd
> >>
> >> patch 6: a64 DE2 pipeline node addition
> >>
> >> patch 7 - 8: dt-bindings for a64 HDMI and HDMI PHY
> >>
> >> patch 9: a64 HDMI nodes addition
> >>
> >> patch 10 - 11: dt-bindings for a64 mixer1 and tcon-tv
> >>
> >> patch 12: a64 HDMI pipeline
> >>
> >> patch 13: enable HDMI out on bananpi-m64
> >>
> >> Tested HDMI on bananapi-m64 (along with DE2 SRAM C changes from [1]
> >> thread), able to detect the HDMI but, no penguins on screen.
> >>
> >> Request for any suggestions.
> >>
> >> Test log on Bananpi-m64:
> >> [    0.247631] sun4i-drm display-engine: bound 1100000.mixer (ops sun8i_mixer_ops)
> >> [    0.256717] sun4i-drm display-engine: bound 1200000.mixer (ops sun8i_mixer_ops)
> >> [    0.256783] sun4i-tcon 1c0c000.lcd-controller: Missing LVDS properties, Please upgrade your DT
> >> [    0.256792] sun4i-tcon 1c0c000.lcd-controller: LVDS output disabled
> >
> > That doesn't seem to work so well for LVDS.
> >
> >> [    0.257081] sun4i-drm display-engine: No panel or bridge found... RGB output disabled
> >> [    0.257099] sun4i-drm display-engine: bound 1c0c000.lcd-controller (ops sun4i_tcon_ops)
> >> [    0.257273] sun4i-drm display-engine: No panel or bridge found... RGB output disabled
> >> [    0.257288] sun4i-drm display-engine: bound 1c0d000.lcd-controller (ops sun4i_tcon_ops)
> >> [    0.258176] sun8i-dw-hdmi 1ee0000.hdmi: Detected HDMI TX controller v1.32a with HDCP (sun8i_dw_hdmi_p)
> >> [    0.258596] sun8i-dw-hdmi 1ee0000.hdmi: registered DesignWare HDMI I2C bus driver
> >> [    0.259188] sun4i-drm display-engine: bound 1ee0000.hdmi (ops sun8i_dw_hdmi_ops)
> >> [    0.259199] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> >> [    0.259205] [drm] No driver support for vblank timestamp query.
> >> [    0.259308] [drm] Cannot find any crtc or sizes
> >
> > A good guess would be that you can't get the EDIDs for some
> > reason. Have you tried forcing a mode to see if the display part
> > already works?
> 
> Yes I've forced and used custom EDID with 1024x786 bin and observed
> that the bin is able to load.
> 
> [    0.262973] [drm] No driver support for vblank timestamp query.
> [    0.263842] [drm] Got built-in EDID base block and 0 extensions
> from "edid/1024x768.bin" for connector

It's not really clear, is it displaying something?

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--bimpxlhks3s6pru5--
