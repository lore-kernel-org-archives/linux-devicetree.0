From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [RFC 00/13] arm64: allwinner: Add A64 DE2 pipeline support
Date: Tue, 24 Apr 2018 17:32:54 +0200
Message-ID: <4355590.Ql03JAEh1C@jernej-laptop>
References: <20180424133425.24291-1-jagan@amarulasolutions.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBNU47XLAKGQEGNWSN3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180424133425.24291-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Dne torek, 24. april 2018 ob 15:34:12 CEST je Jagan Teki napisal(a):
> Allwinner A64 has display engine pipeline like other Allwinner SOC's
> A83T/H3/H5.
> 
> A64 DE2 behaviour similar to Allwinner A83T where mixer0, connected to tcon0
> with RGB, LVDS MIPI-DSI and mixer1, connected to tcon1 with HDMI.
> This series merely concentrated on HDMI pipeline and rest will add
> eventually.
> 
> patch 1: dt-bindings for a64 DE2 CCU
> 
> patch 2: a64 DE2 CCU node addition
> 
> patch 3: dt-bindings for a64 DE2 pipeline
> 
> patch 4 - 5: dt-bindings for a64 mixer0 and tcon-lcd
> 
> patch 6: a64 DE2 pipeline node addition
> 
> patch 7 - 8: dt-bindings for a64 HDMI and HDMI PHY
> 
> patch 9: a64 HDMI nodes addition
> 
> patch 10 - 11: dt-bindings for a64 mixer1 and tcon-tv
> 
> patch 12: a64 HDMI pipeline
> 
> patch 13: enable HDMI out on bananpi-m64
> 
> Tested HDMI on bananapi-m64 (along with DE2 SRAM C changes from [1]
> thread), able to detect the HDMI but, no penguins on screen.
> 
> Request for any suggestions.

You are mising sunxi-ng clock patches. PLL_VIDEO0 and PLL_VIDEO1 need fixes by 
setting minimum stable frequency. Please note that datasheet may have wrong 
information. That was obvious in H3 case and I had to check minimum stable 
PLL_VIDEO frequency in BSP driver.

Without clock fixes, you might not see anything on the screen.

Best regards,
Jernej

> 
> Test log on Bananpi-m64:
> [    0.247631] sun4i-drm display-engine: bound 1100000.mixer (ops
> sun8i_mixer_ops) [    0.256717] sun4i-drm display-engine: bound
> 1200000.mixer (ops sun8i_mixer_ops) [    0.256783] sun4i-tcon
> 1c0c000.lcd-controller: Missing LVDS properties, Please upgrade your DT [  
>  0.256792] sun4i-tcon 1c0c000.lcd-controller: LVDS output disabled [   
> 0.257081] sun4i-drm display-engine: No panel or bridge found... RGB output
> disabled [    0.257099] sun4i-drm display-engine: bound
> 1c0c000.lcd-controller (ops sun4i_tcon_ops) [    0.257273] sun4i-drm
> display-engine: No panel or bridge found... RGB output disabled [   
> 0.257288] sun4i-drm display-engine: bound 1c0d000.lcd-controller (ops
> sun4i_tcon_ops) [    0.258176] sun8i-dw-hdmi 1ee0000.hdmi: Detected HDMI TX
> controller v1.32a with HDCP (sun8i_dw_hdmi_p) [    0.258596] sun8i-dw-hdmi
> 1ee0000.hdmi: registered DesignWare HDMI I2C bus driver [    0.259188]
> sun4i-drm display-engine: bound 1ee0000.hdmi (ops sun8i_dw_hdmi_ops) [   
> 0.259199] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013). [   
> 0.259205] [drm] No driver support for vblank timestamp query. [   
> 0.259308] [drm] Cannot find any crtc or sizes
> [    0.259824] [drm] Initialized sun4i-drm 1.0.0 20150629 for display-engine
> on minor 0
> 
> [1] https://lkml.org/lkml/2018/3/16/1096
> 
> Jagan Teki (13):
>   dt-bindings: clock: Add compatible for A64 DE2 CCU
>   arm64: dts: allwinner: a64: Add DE2 CCU
>   bindings: display: Add compatible for A64 DE2 pipeline
>   bindings: display: Add compatible for A64 Mixer0
>   bindings: display: Add compatible for A64 tcon-lcd
>   arm64: dts: allwinner: a64: Add DE2 pipeline
>   bindings: display: Add compatible for A64 HDMI
>   bindings: display: Add compatible for A64 HDMI PHY
>   arm64: dts: allwinner: a64: Add HDMI support
>   bindings: display: Add compatible for A64 Mixer1
>   bindings: display: Add compatible for A64 tcon-tv
>   arm64: dts: allwinner: a64: Add HDMI pipeline
>   arm64: dts: allwinner: a64: bananapi-m64: Enable HDMI output
> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        |   1 +
>  .../bindings/display/sunxi/sun4i-drm.txt           |   7 +
>  .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |  26 +++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 181
> +++++++++++++++++++++ drivers/gpu/drm/sun4i/sun4i_drv.c                  | 
>  1 +
>  include/dt-bindings/clock/sun50i-a64-ccu.h         |   2 +
>  6 files changed, 218 insertions(+)
> 
> --
> 2.14.3
