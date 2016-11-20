From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v6 0/5] drm: sun8i: Add DE2 HDMI video support
Date: Sun, 20 Nov 2016 12:32:03 +0100
Message-ID: <cover.1479641523.git.moinejf@free.fr>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB7VDY3AQKGQEIFIJA7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset series adds HDMI video support to the Allwinner
sun8i SoCs which include the display engine 2 (DE2).
The driver contains the code for the A83T and H3, but it could be
used/extended for other SoCs as the A64, H2 and H5.

v6:
	- remove audio support (other patchset to come)
	- use DRM modeset data for HDMI configuration
		(thanks to Jernej =C5=A0krabec)
	- more meaningfull register names
	- use a mutex for DE I/O protection
	- merge DE and plane into one file
	- don't activate the video hardware when video not started
		(Maxime Ripard)
	- remove 'type =3D "video" in DT graph ports
		(Rob Herring)
	- change the I/O accesses by #define instead of struct
		(Maxime Ripard, Andr=C3=A9 Przywara)
	- remove pm functions (Maxime Ripard)
	- set the pll-de/de clocks in the DT (Maxime Ripard)
	- use platform_get_irq instead of irq_of_parse_and_map
		(Maxime Ripard)
	- rename sunxi to sun8i (Maxime Ripard)
	- fix coding style errors (Maxime Ripard)
	- subclass the drm structure in private data (Daniel Vetter)
	- move drm_dev_register at end of init (Daniel Vetter)
v5:
	- add overlay plane
	- add audio support
	- add support for the A83T
	- add back the HDMI driver
	- many bug fixes
v4:=20
	- drivers/clk/sunxi/Makefile was missing (Emil Velikov)
v3:
	- add the hardware cursor
	- simplify and fix the DE2 init sequences
	- generation for all SUNXI SoCs (Andre Przywara)
v2:
	- remove the HDMI driver
	- remarks from Chen-Yu Tsai and Russell King
	- DT documentation added

Jean-Francois Moine (5):
  drm: sun8i: Add a basic DRM driver for Allwinner DE2
  drm: sunxi: add HDMI video support to A83T and H3
  ARM: dts: sun8i-h3: add HDMI video nodes
  ARM: dts: sun8i-h3: Add HDMI video to the Banana Pi M2+
  ARM: dts: sun8i-h3: Add HDMI video to the Orange PI 2

 .../devicetree/bindings/display/sunxi/hdmi.txt     |  53 ++
 .../bindings/display/sunxi/sun8i-de2.txt           |  83 ++
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    |  13 +
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          |  13 +
 arch/arm/boot/dts/sun8i-h3.dtsi                    |  51 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/sun8i/Kconfig                      |  26 +
 drivers/gpu/drm/sun8i/Makefile                     |   9 +
 drivers/gpu/drm/sun8i/de2_crtc.c                   | 440 +++++++++++
 drivers/gpu/drm/sun8i/de2_crtc.h                   |  50 ++
 drivers/gpu/drm/sun8i/de2_drm.h                    |  48 ++
 drivers/gpu/drm/sun8i/de2_drv.c                    | 379 ++++++++++
 drivers/gpu/drm/sun8i/de2_hdmi.c                   | 394 ++++++++++
 drivers/gpu/drm/sun8i/de2_hdmi.h                   |  51 ++
 drivers/gpu/drm/sun8i/de2_hdmi_io.c                | 839 +++++++++++++++++=
++++
 drivers/gpu/drm/sun8i/de2_plane.c                  | 712 +++++++++++++++++
 17 files changed, 3164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sunxi/hdmi.tx=
t
 create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun8i-d=
e2.txt
 create mode 100644 drivers/gpu/drm/sun8i/Kconfig
 create mode 100644 drivers/gpu/drm/sun8i/Makefile
 create mode 100644 drivers/gpu/drm/sun8i/de2_crtc.c
 create mode 100644 drivers/gpu/drm/sun8i/de2_crtc.h
 create mode 100644 drivers/gpu/drm/sun8i/de2_drm.h
 create mode 100644 drivers/gpu/drm/sun8i/de2_drv.c
 create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi.c
 create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi.h
 create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi_io.c
 create mode 100644 drivers/gpu/drm/sun8i/de2_plane.c

--=20
2.10.2

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
