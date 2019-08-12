From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v8 0/4] Add support for Orange Pi 3
Date: Mon, 12 Aug 2019 15:54:03 +0800
Message-ID: <CAGb2v67JVG2rhOdUwBmfsO0+RYb4DNOPmUo=Q_UhL3N+niLiEg@mail.gmail.com>
References: <20190806155744.10263-1-megous@megous.com> <2218280.0sI6yjypBf@jernej-laptop>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKNWYTVAKGQEPO5QTXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2218280.0sI6yjypBf@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 3:45 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
>
> Dne torek, 06. avgust 2019 ob 17:57:39 CEST je megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org napisal(=
a):
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > This series implements support for Xunlong Orange Pi 3 board. There
> > are only a few patches remaining.
> >
> > - ethernet support - just a DT change (patch 1)
> > - HDMI support (patches 2-4)
> >
> > For some people, ethernet doesn't work after reboot because u-boot does=
n't
> > support AXP805 PMIC, and will not turn off the etherent PHY regulators.
> > So the regulator controlled by gpio will be shut down, but the other on=
e
> > controlled by the AXP PMIC will not.
> >
> > This is a problem only when running with a builtin driver. This needs
> > to be fixed in u-boot.
> >
> >
> > Please take a look.
>
> Is there anything missing? It would be nice to get this in 5.4. There is =
a lot
> of H6 boards which needs DDC bus enable mechanism (part of H6 reference
> design), including Beelink GS1 which already has HDMI node in mainline ke=
rnel
> DT, but due to disabled DDC lines works only with 1024x768 (fallback
> resolution in DRM core).

I have a few minor comments about patch 1.

I think the HDMI bits are good, but I don't have maintainership / commit
permissions for drm-misc, so I'll have to wait until someone applies patche=
s
2 and 3 before I apply patch 4.

ChenYu

> Best regards,
> Jernej
>
> >
> > thank you and regards,
> >   Ondrej Jirman
> >
> > Changes in v8:
> > - added reviewed-by tags
> > - dropped already applied patches
> > - added more info about the phy initialization issue after reset
> >
> > Changes in v7:
> > - dropped stored reference to connector_pdev as suggested by Jernej
> > - added forgotten dt-bindings reviewed-by tag
> >
> > Changes in v6:
> > - added dt-bindings reviewed-by tag
> > - fix wording in stmmac commit (as suggested by Sergei)
> >
> > Changes in v5:
> > - dropped already applied patches (pinctrl patches, mmc1 pinconf patch)
> > - rename GMAC-3V3 -> GMAC-3V to match the schematic (Jagan)
> > - changed hdmi-connector's ddc-supply property to ddc-en-gpios
> >   (Rob Herring)
> >
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
> >
> > Changes in v3:
> > - dropped already applied patches
> > - changed pinctrl I/O bias selection constants to enum and renamed
> > - added /omit-if-no-ref/ to mmc1_pins
> > - made mmc1_pins default pinconf for mmc1 in H6 dtsi
> > - move ddc-supply to HDMI connector node, updated patch descriptions,
> >   changed dt-bindings docs
> >
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
> >
> > Ondrej Jirman (4):
> >   arm64: dts: allwinner: orange-pi-3: Enable ethernet
> >   dt-bindings: display: hdmi-connector: Support DDC bus enable
> >   drm: sun4i: Add support for enabling DDC I2C bus to sun8i_dw_hdmi glu=
e
> >   arm64: dts: allwinner: orange-pi-3: Enable HDMI output
> >
> >  .../display/connector/hdmi-connector.txt      |  1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 70 +++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         | 54 ++++++++++++--
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |  2 +
> >  4 files changed, 123 insertions(+), 4 deletions(-)
>
>
>
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> To view this discussion on the web, visit https://groups.google.com/d/msg=
id/linux-sunxi/2218280.0sI6yjypBf%40jernej-laptop.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/CAGb2v67JVG2rhOdUwBmfsO0%2BRYb4DNOPmUo%3DQ_UhL3N%2BniLiEg%40ma=
il.gmail.com.
