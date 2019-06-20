From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
Date: Thu, 20 Jun 2019 18:34:36 +0200
Message-ID: <20190620163436.upg5pkpspyz64brh@core.my.home>
References: <20190620134748.17866-1-megous@megous.com>
 <2263144.KN5DhQ2VKD@jernej-laptop>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBHPLV3UAKGQEBOO4UMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2263144.KN5DhQ2VKD@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jernej,

On Thu, Jun 20, 2019 at 05:53:58PM +0200, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne =C4=8Detrtek, 20. junij 2019 ob 15:47:42 CEST je megous via linux-sun=
xi=20
> napisal(a):
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >=20
> > This series implements support for Xunlong Orange Pi 3 board.
> >=20
> > - ethernet support (patches 1-3)
>=20
> Correct me if I'm wrong, but patches 1-2 aren't strictly necessary for=20
> OrangePi 3, right? H6 DTSI already has emac node with dual compatible (H6=
 and=20
> A64) and since OrangePi 3 uses gigabit ethernet, quirk introduced by patc=
hes=20
> 1-2 are not needed.

I've checked with u-boot and md.l 0x03000030 (syscon_field) and the actual
default value there on cold boot is 0x58000, just like on H3.

H3_EPHY_SELECT is BIT(15)

That means that those patches (1 and 2) are both doing the same thing, basi=
caly.
H3_EPHY_SELECT bit needs to be cleared, and it is cleared either explicitly=
, or
via default_syscon_value =3D 0x50000. It's also cleared incidentally by usi=
ng
emac_variant_a64, because it has default_syscon_value set to 0.

Meaning of those remaining set bits on H6[1] are the same as on H3. Bit 16 =
is
SHUTDOWN (on 1) and bit 18 is CLK_SEL. At least SHUTDOWN bit should be kept
high, as it keeps the EPHY shut down. Normally that would be ensured by the
code, but only if soc_has_internal_phy is true, which it is not for
emac_variant_a64.

Thus the patch adds the emac_variant_h6 with a different default_syscon_val=
ue
from A64.

Dose the SHUTDOWN bit matter on H6? I don't know. I'm just trying to keep t=
he
default values of these bits unchanged. Maybe it would be nicer to have
default_syscon_value be 0x58000 on H6, to avoid the boot warning.

dwmac-sun8i 5020000.ethernet: Current syscon value is not the default 58000=
 (expect 50000)

The same warning is there with A64 compatible (with "expect 0").

[1] See page 238 in H6 manual.

regards,
	o.

> However, it is nice to have this 100 Mbit fix, because most STB DTS will =
need=20
> it.
>=20
> Best regards,
> Jernej
>=20
> > - HDMI support (patches 4-6)
> >=20
> > For some people, ethernet doesn't work after reboot (but works on cold
> > boot), when the stmmac driver is built into the kernel. It works when
> > the driver is built as a module. It's either some timing issue, or powe=
r
> > supply issue or a combination of both. Module build induces a power
> > cycling of the phy.
> >=20
> > I encourage people with this issue, to build the driver into the kernel=
,
> > and try to alter the reset timings for the phy in DTS or
> > startup-delay-us and report the findings.
> >=20
> >=20
> > Please take a look.
> >=20
> > thank you and regards,
> >   Ondrej Jirman
> >=20
> >=20
> > Changes in v7:
> > - dropped stored reference to connector_pdev as suggested by Jernej
> > - added forgotten dt-bindings reviewed-by tag
> >=20
> > Changes in v6:
> > - added dt-bindings reviewed-by tag
> > - fix wording in stmmac commit (as suggested by Sergei)
> >=20
> > Changes in v5:
> > - dropped already applied patches (pinctrl patches, mmc1 pinconf patch)
> > - rename GMAC-3V3 -> GMAC-3V to match the schematic (Jagan)
> > - changed hdmi-connector's ddc-supply property to ddc-en-gpios
> >   (Rob Herring)
> >=20
> > Changes in v4:
> > - fix checkpatch warnings/style issues
> > - use enum in struct sunxi_desc_function for io_bias_cfg_variant
> > - collected acked-by's
> > - fix compile error in drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c:156
> >   caused by missing conversion from has_io_bias_cfg struct member
> >   (I've kept the acked-by, because it's a trivial change, but feel free
> >   to object.) (reported by Martin A. on github)
> >   I did not have A80 pinctrl enabled for some reason, so I did not catc=
h
> >   this sooner.
> > - dropped brcm firmware patch (was already applied)
> > - dropped the wifi dts patch (will re-send after H6 RTC gets merged,
> >   along with bluetooth support, in a separate series)
> >=20
> > Changes in v3:
> > - dropped already applied patches
> > - changed pinctrl I/O bias selection constants to enum and renamed
> > - added /omit-if-no-ref/ to mmc1_pins
> > - made mmc1_pins default pinconf for mmc1 in H6 dtsi
> > - move ddc-supply to HDMI connector node, updated patch descriptions,
> >   changed dt-bindings docs
> >=20
> > Changes in v2:
> > - added dt-bindings documentation for the board's compatible string
> >   (suggested by Clement)
> > - addressed checkpatch warnings and code formatting issues (on Maxime's
> >   suggestions)
> > - stmmac: dropped useless parenthesis, reworded description of the patc=
h
> >   (suggested by Sergei)
> > - drop useles dev_info() about the selected io bias voltage
> > - docummented io voltage bias selection variant macros
> > - wifi: marked WiFi DTS patch and realted mmc1_pins as "DO NOT MERGE",
> >   because wifi depends on H6 RTC support that's not merged yet (suggest=
ed
> >   by Clement)
> > - added missing signed-of-bys
> > - changed &usb2otg dr_mode to otg, and added a note about VBUS
> > - improved wording of HDMI driver's DDC power supply patch
> >=20
> > Icenowy Zheng (2):
> >   net: stmmac: sun8i: add support for Allwinner H6 EMAC
> >   net: stmmac: sun8i: force select external PHY when no internal one
> >=20
> > Ondrej Jirman (4):
> >   arm64: dts: allwinner: orange-pi-3: Enable ethernet
> >   dt-bindings: display: hdmi-connector: Support DDC bus enable
> >   drm: sun4i: Add support for enabling DDC I2C bus to sun8i_dw_hdmi glu=
e
> >   arm64: dts: allwinner: orange-pi-3: Enable HDMI output
> >=20
> >  .../display/connector/hdmi-connector.txt      |  1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 70 +++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         | 54 ++++++++++++--
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |  2 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 ++++++
> >  5 files changed, 144 insertions(+), 4 deletions(-)
>=20
>=20
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190620163436.upg5pkpspyz64brh%40core.my.home.
For more options, visit https://groups.google.com/d/optout.
