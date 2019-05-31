From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v6 0/6] Add support for Orange Pi 3
Date: Fri, 31 May 2019 14:52:46 +0200
Message-ID: <20190531125246.qqfvmgmw2mv442tq@core.my.home>
References: <20190527162237.18495-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBH6HYTTQKGQEV7MZ7EI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190527162237.18495-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, May 27, 2019 at 06:22:31PM +0200, megous via linux-sunxi wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> 
> This series implements support for Xunlong Orange Pi 3 board.
> 
> Unfortunately, this board needs some small driver patches, so I have
> split the boards DT patch into chunks that require patches for drivers
> in various subsystems.
> 
> Suggested merging plan/dependencies:
> 
> - stmmac patches are needed for ethernet support (patches 1-3)
>   - these should be ready now
> - HDMI support (patches 4-6)
>   - should be ready

If there are no futher comments, can all these patches please be merged?

thank you and kind regards,
	Ondrej

> Changes in v2:
> - added dt-bindings documentation for the board's compatible string
>   (suggested by Clement)
> - addressed checkpatch warnings and code formatting issues (on Maxime's
>   suggestions)
> - stmmac: dropped useless parenthesis, reworded description of the patch
>   (suggested by Sergei)
> - drop useles dev_info() about the selected io bias voltage
> - docummented io voltage bias selection variant macros
> - wifi: marked WiFi DTS patch and realted mmc1_pins as "DO NOT MERGE",
>   because wifi depends on H6 RTC support that's not merged yet (suggested
>   by Clement)
> - added missing signed-of-bys
> - changed &usb2otg dr_mode to otg, and added a note about VBUS
> - improved wording of HDMI driver's DDC power supply patch
> 
> Changes in v3:
> - dropped already applied patches
> - changed pinctrl I/O bias selection constants to enum and renamed
> - added /omit-if-no-ref/ to mmc1_pins
> - made mmc1_pins default pinconf for mmc1 in H6 dtsi
> - move ddc-supply to HDMI connector node, updated patch descriptions,
>   changed dt-bindings docs
> 
> Changes in v4:
> - fix checkpatch warnings/style issues
> - use enum in struct sunxi_desc_function for io_bias_cfg_variant
> - collected acked-by's
> - fix compile error in drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c:156
>   caused by missing conversion from has_io_bias_cfg struct member
>   (I've kept the acked-by, because it's a trivial change, but feel free
>   to object.) (reported by Martin A. on github)
>   I did not have A80 pinctrl enabled for some reason, so I did not catch
>   this sooner.
> - dropped brcm firmware patch (was already applied)
> - dropped the wifi dts patch (will re-send after H6 RTC gets merged,
>   along with bluetooth support, in a separate series)
> 
> Changes in v5:
> - dropped already applied patches (pinctrl patches, mmc1 pinconf patch)
> - rename GMAC-3V3 -> GMAC-3V to match the schematic (Jagan)
> - changed hdmi-connector's ddc-supply property to ddc-en-gpios
>   (Rob Herring)
> 
> Changes in v6:
> - added dt-bindings reviewed-by tag
> - fix wording in stmmac commit (as suggested by Sergei)
> 
> Please take a look.
> 
> thank you and regards,
>   Ondrej Jirman
> 
> Icenowy Zheng (2):
>   net: stmmac: sun8i: add support for Allwinner H6 EMAC
>   net: stmmac: sun8i: force select external PHY when no internal one
> 
> Ondrej Jirman (4):
>   arm64: dts: allwinner: orange-pi-3: Enable ethernet
>   dt-bindings: display: hdmi-connector: Support DDC bus enable
>   drm: sun4i: Add support for enabling DDC I2C bus to sun8i_dw_hdmi glue
>   arm64: dts: allwinner: orange-pi-3: Enable HDMI output
> 
>  .../display/connector/hdmi-connector.txt      |  1 +
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 70 +++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         | 55 ++++++++++++++-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |  3 +
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 ++++++
>  5 files changed, 147 insertions(+), 3 deletions(-)
> 
> -- 
> 2.21.0
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190527162237.18495-1-megous%40megous.com.
> For more options, visit https://groups.google.com/d/optout.
