From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add dual-role OTG support for
 Allwinner H3
Date: Tue, 7 Mar 2017 00:48:05 +0100
Message-ID: <e110a2c0-ee91-b6eb-9e94-e32034aae4d7@megous.com>
References: <20170306223449.21404-1-icenowy@aosc.xyz>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X0SpftqfW4WVmLdMvGpA7PLo9Rk9srqqU"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBNXK67CQKGQEWUHS7VI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170306223449.21404-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-ymACFijhrKM@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X0SpftqfW4WVmLdMvGpA7PLo9Rk9srqqU
Content-Type: multipart/mixed; boundary="pqQci491ihOpSGkF8HhOsCco5xwcgREbL";
 protected-headers="v1"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
To: icenowy-ymACFijhrKM@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>,
 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>,
 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Message-ID: <e110a2c0-ee91-b6eb-9e94-e32034aae4d7-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v3 0/5] Add dual-role OTG support for
 Allwinner H3
References: <20170306223449.21404-1-icenowy-ymACFijhrKM@public.gmane.org>
In-Reply-To: <20170306223449.21404-1-icenowy-ymACFijhrKM@public.gmane.org>

--pqQci491ihOpSGkF8HhOsCco5xwcgREbL
Content-Type: text/plain; charset=UTF-8

Hi Icenowy,

when I was trying to add OTG support I found an issue with powercycling.
When I have USB cable connecting PC and the OTG port on the SBC, when
the board enables the vbus, it would become impossible to power cycle
the board after poweroff. The reason being that when vbus is enabled,
the board is powered from the OTG port even if you disconnect the barrel
plug.

Should kernel turn off the vbus before shutting down/restarting? What do
you think?

regards,
  o.

Dne 6.3.2017 v 23:34 Icenowy Zheng napsal(a):
> Allwinner H3 have a its USB PHY0 routed to two USB controllers: one is
> a MUSB controller, which can work in peripheral mode, but works badly in
> host mode (several hardware will fail on the MUSB controller, even connect
> one MUSB controller in peripheral mode to another one in host mode cannot
> work); the other is a pair of EHCI/OHCI controller, which can work only
> in host mode, but have better compatibillity. The route is controlled in
> a register, which we have set it to HCI only when we do not know about
> it well.
> 
> Add support to route to the best controller according to current USB mode
> (host/peripheral).
> 
> Note: Currently even if hardware only support hostmode, we should still
> enable the MUSB controller, as it controls the USB mode. (Some this kind
> of hardware can also work in peripheral mode by settings in the sysfs
> node of MUSB, then connect it to another host via a USB Type-A to Type-A
> cable.)
> 
> Patch 1 changes the device tree binding to include the "pmu0" for HCI pair.
> 
> Patch 2 adds support for auto routing of PHY0. It's currently only enabled
> on H3, but it's easy to extend it to other SoCs which feature this
> route control.
> 
> Patch 3 adds necessary device tree nodes to the H3 DTSI file. Note: The
> phy is not bind for OHCI/EHCI0, as OHCI/EHCI drivers will keep the VBUS
> on. Only MUSB driver can properly handle a dual-role PHY.
> 
> Patch 4 enables USB OTG functionality on Orange Pi One board, which is
> the only H3 board I have that have proper OTG function. It's easy to
> enable OTG on other boards with their schematics.
> 
> Patch 5 enables USB OTG functionality on Orange Pi Zero board, as the
> board cannot output power on Vbus, I only enabled peripheral mode by
> default.
> 
> The USB PHY on V3s/A64 SoCs also feature this capability, and it will
> be soon enabled on these SoCs after this patchset is merged.
> 
> Icenowy Zheng (5):
>   dt: bindings: add pmu0 regs for USB PHYs on Allwinner H3/V3s/A64
>   phy: sun4i-usb: support automatically switch PHY0 route to MUSB/HCI
>   ARM: dts: sun8i: h3: add usb_otg and OHCI/EHCI for usbc0 on H3
>   ARM: dts: sun8i: h3: enable USB OTG on Orange Pi One
>   ARM: dts: sun8i: h2+: enable USB OTG for Orange Pi Zero board
> 
>  .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  1 +
>  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts  | 14 ++++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-one.dts        | 22 +++++++++-
>  arch/arm/boot/dts/sun8i-h3.dtsi                    | 32 ++++++++++++++
>  drivers/phy/phy-sun4i-usb.c                        | 50 ++++++++++++++--------
>  5 files changed, 101 insertions(+), 18 deletions(-)
> 

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--pqQci491ihOpSGkF8HhOsCco5xwcgREbL--

--X0SpftqfW4WVmLdMvGpA7PLo9Rk9srqqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEmrE4sgaRYhzUz5ICbmQmxnfP7/EFAli99TUACgkQbmQmxnfP
7/FC/A//dCPfU0IC85OCHuQnKxrZcjpjcL9Ske9+4ZGTucHazJ26i2HE45bKDGy2
E8e5tAQMpoOZWhvN5dmOEaiL2oKj+lR+FLZMBLSStpJ5HN6iMJhZqrNDEvYkWyMB
kupGl36k4hEiQsshmgQm+gnrj/ilhoM409enLPuFu/4h2/9YN7AHg/sOKRXU43Ip
Hnor4EPXL9ln5h/XupUeJseoOVQGN+3lpbKg5N4iI3pNgQTAC4z0uNpuN4kQ4xKe
lF3h8g0BeTAsNG2ZSO0kwaygww8eiEVJ0PfISAKOI2cpu6mujYRjZ7Q2QKcSi3cF
nhOvVadwb9PnLs1YvIm26LcUScILfpFY5i6huRzmQL/2i276wlZ+LJ5vw9CZqayE
tZhngt/73TCZuFx/uJeOOXBVuEE6pA0Ms2DPQFFRYlHWCidYdV8b01yOd1XBk22e
2GwYguK5FA3bDmoopJewjR9hOH9fyaAGvhaHAqnxhPCKxwrV9F7HNwze/EnahScv
0qGgfe+WYypqwmgolMolO+7RK1gw0bKhNAn//11I8f4lV8lGHKOPNTHt9YehZqDW
NTBgqILSx94ssssnVi47VXcXIC99zEyTaywipKq2HkPle+X0SUTMS/2dVP/hXVpl
+HeAmfikaXJ6TfPelU0E6MvqsUX6uNPeKH/mhWKOpEAdWJjPFks=
=LHEV
-----END PGP SIGNATURE-----

--X0SpftqfW4WVmLdMvGpA7PLo9Rk9srqqU--
