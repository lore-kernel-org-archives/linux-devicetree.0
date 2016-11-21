From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 0/5] drm: sun8i: Add DE2 HDMI video support
Date: Mon, 21 Nov 2016 01:54:53 +0100
Message-ID: <1c9a02ff-ce6c-7ad7-36fa-8a2ea0b7675e@megous.com>
References: <cover.1479641523.git.moinejf@free.fr>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mN5FvGEOLxKgVJoLD0jCIEi2QFUFCnls5"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBX4LZHAQKGQERI6HUXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1479641523.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mN5FvGEOLxKgVJoLD0jCIEi2QFUFCnls5
Content-Type: multipart/mixed; boundary="B01760V0N2CPtqwoXlxFBxjoeQfGlgrDG";
 protected-headers="v1"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>,
 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>,
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Message-ID: <1c9a02ff-ce6c-7ad7-36fa-8a2ea0b7675e-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v6 0/5] drm: sun8i: Add DE2 HDMI video
 support
References: <cover.1479641523.git.moinejf-GANU6spQydw@public.gmane.org>
In-Reply-To: <cover.1479641523.git.moinejf-GANU6spQydw@public.gmane.org>

--B01760V0N2CPtqwoXlxFBxjoeQfGlgrDG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dne 20.11.2016 v 12:32 Jean-Francois Moine napsal(a):
> This patchset series adds HDMI video support to the Allwinner
> sun8i SoCs which include the display engine 2 (DE2).
> The driver contains the code for the A83T and H3, but it could be
> used/extended for other SoCs as the A64, H2 and H5.

Hi,

I'm trying to test your patches on Orange Pi PC, and I've run into a few
issues: (I'm using sunxi-ng with the same patches as last time, to make
it work with your driver)

1] I just get pink output on the monitor - there's some signal, but it's
pink (or more like magenta).

dmesg ouput indicates no error:

[    1.887823] [drm] Initialized
[    1.888503] sun8i-de2 1000000.de-controller: bound
1c0c000.lcd-controller (ops 0xc0a63894)
[    2.057298] sun8i-de2 1000000.de-controller: bound 1ee0000.hdmi (ops
0xc0a63b54)
[    2.057304] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.057307] [drm] No driver support for vblank timestamp query.
[    2.690862] Console: switching to colour frame buffer device 240x67
[    2.723059] sun8i-de2 1000000.de-controller: fb0:  frame buffer device

>=20
> v6:
> 	- remove audio support (other patchset to come)
> 	- use DRM modeset data for HDMI configuration
> 		(thanks to Jernej =C5=A0krabec)
> 	- more meaningfull register names
> 	- use a mutex for DE I/O protection
> 	- merge DE and plane into one file
> 	- don't activate the video hardware when video not started
> 		(Maxime Ripard)
> 	- remove 'type =3D "video" in DT graph ports
> 		(Rob Herring)
> 	- change the I/O accesses by #define instead of struct
> 		(Maxime Ripard, Andr=C3=A9 Przywara)
> 	- remove pm functions (Maxime Ripard)
> 	- set the pll-de/de clocks in the DT (Maxime Ripard)

This change triggers this dmesg output I suppose:

[    0.000000] bad: scheduling from the idle thread!
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.9.0-rc6-00045-g5347f96 #29
[    0.000000] Hardware name: Allwinner sun8i Family
[    0.000000] [<c010dc64>] (unwind_backtrace) from [<c010ae7c>]
(show_stack+0x10/0x14)
[    0.000000] [<c010ae7c>] (show_stack) from [<c04d3ce0>]
(dump_stack+0x84/0x98)
[    0.000000] [<c04d3ce0>] (dump_stack) from [<c0149984>]
(dequeue_task_idle+0x34/0x40)
[    0.000000] [<c0149984>] (dequeue_task_idle) from [<c0950b54>]
(__schedule+0x244/0x52c)
[    0.000000] [<c0950b54>] (__schedule) from [<c0950eac>]
(schedule+0x44/0x9c)
[    0.000000] [<c0950eac>] (schedule) from [<c0953e58>]
(schedule_hrtimeout_range_clock+0xc4/0x138)
[    0.000000] [<c0953e58>] (schedule_hrtimeout_range_clock) from
[<c0953ee4>] (schedule_hrtimeout_range+0x18/0x20)
[    0.000000] [<c0953ee4>] (schedule_hrtimeout_range) from [<c0953c40>]
(usleep_range+0x4c/0x54)
[    0.000000] [<c0953c40>] (usleep_range) from [<c052c4f0>]
(ccu_helper_wait_for_lock+0x58/0xc8)
[    0.000000] [<c052c4f0>] (ccu_helper_wait_for_lock) from [<c052dd10>]
(ccu_nm_set_rate+0x124/0x148)
[    0.000000] [<c052dd10>] (ccu_nm_set_rate) from [<c052547c>]
(clk_change_rate+0x194/0x248)
[    0.000000] [<c052547c>] (clk_change_rate) from [<c0525598>]
(clk_core_set_rate_nolock+0x68/0xb0)
[    0.000000] [<c0525598>] (clk_core_set_rate_nolock) from [<c0525b58>]
(clk_set_rate+0x20/0x30)
[    0.000000] [<c0525b58>] (clk_set_rate) from [<c0529f84>]
(of_clk_set_defaults+0x1fc/0x334)
[    0.000000] [<c0529f84>] (of_clk_set_defaults) from [<c0526dac>]
(of_clk_add_hw_provider+0x74/0x9c)
[    0.000000] [<c0526dac>] (of_clk_add_hw_provider) from [<c052c608>]
(sunxi_ccu_probe+0xa8/0x130)
[    0.000000] [<c052c608>] (sunxi_ccu_probe) from [<c0c197dc>]
(of_clk_init+0x15c/0x1e8)
[    0.000000] [<c0c197dc>] (of_clk_init) from [<c0c08390>]
(sun6i_timer_init+0xc/0x18)
[    0.000000] [<c0c08390>] (sun6i_timer_init) from [<c0c00bb8>]
(start_kernel+0x248/0x398)
[    0.000000] [<c0c00bb8>] (start_kernel) from [<4000807c>] (0x4000807c)
[    0.000000] arm_arch_timer: Architected cp15 timer(s) running at
24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/time/sched_clock.c:179
sched_clock_register+0x44/0x1dc
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.9.0-rc6-00045-g5347f96 #29
[    0.000000] Hardware name: Allwinner sun8i Family
[    0.000000] [<c010dc64>] (unwind_backtrace) from [<c010ae7c>]
(show_stack+0x10/0x14)
[    0.000000] [<c010ae7c>] (show_stack) from [<c04d3ce0>]
(dump_stack+0x84/0x98)
[    0.000000] [<c04d3ce0>] (dump_stack) from [<c012087c>]
(__warn+0xe0/0xfc)
[    0.000000] [<c012087c>] (__warn) from [<c0120948>]
(warn_slowpath_null+0x20/0x28)
[    0.000000] [<c0120948>] (warn_slowpath_null) from [<c0c0be20>]
(sched_clock_register+0x44/0x1dc)
[    0.000000] [<c0c0be20>] (sched_clock_register) from [<c0c23be4>]
(arch_timer_common_init+0x204/0x22c)
[    0.000000] [<c0c23be4>] (arch_timer_common_init) from [<c0c23ef0>]
(arch_timer_of_init+0x2e4/0x310)
[    0.000000] [<c0c23ef0>] (arch_timer_of_init) from [<c0c232c0>]
(clocksource_probe+0x58/0xac)
[    0.000000] [<c0c232c0>] (clocksource_probe) from [<c0c00bb8>]
(start_kernel+0x248/0x398)
[    0.000000] [<c0c00bb8>] (start_kernel) from [<4000807c>] (0x4000807c)
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000004] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps
every 4398046511097ns
[    0.000010] Switching to timer-based delay loop, resolution 41ns
[    0.000139] clocksource: timer: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 79635851949 ns
[    0.000244] ------------[ cut here ]------------
[    0.000253] WARNING: CPU: 0 PID: 0 at init/main.c:576
start_kernel+0x27c/0x398
[    0.000255] Interrupts were enabled early
[    0.000261] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
4.9.0-rc6-00045-g5347f96 #29
[    0.000263] Hardware name: Allwinner sun8i Family
[    0.000273] [<c010dc64>] (unwind_backtrace) from [<c010ae7c>]
(show_stack+0x10/0x14)
[    0.000283] [<c010ae7c>] (show_stack) from [<c04d3ce0>]
(dump_stack+0x84/0x98)
[    0.000290] [<c04d3ce0>] (dump_stack) from [<c012087c>]
(__warn+0xe0/0xfc)
[    0.000296] [<c012087c>] (__warn) from [<c01208d0>]
(warn_slowpath_fmt+0x38/0x48)
[    0.000303] [<c01208d0>] (warn_slowpath_fmt) from [<c0c00bec>]
(start_kernel+0x27c/0x398)
[    0.000309] [<c0c00bec>] (start_kernel) from [<4000807c>] (0x4000807c)
[    0.000314] ---[ end trace f68728a0d3053b52 ]---
[    0.000383] Console: colour dummy device 80x30
[    0.000395] console [tty1] enabled

Which can be fixed by:

diff --git a/drivers/clk/sunxi-ng/ccu_common.c
b/drivers/clk/sunxi-ng/ccu_common.c
index 51d4bac..9dc970f 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -30,8 +30,8 @@ void ccu_helper_wait_for_lock(struct ccu_common
*common, u32 lock)
        if (!lock)
                return;

-   WARN_ON(readl_relaxed_poll_timeout(common->base + common->reg, reg,
-                                      reg & lock, 100, 70000));
+ WARN_ON(readl_relaxed_poll_timeout_atomic(common->base + common->reg, reg=
,
+                                    reg & lock, 5, 70000));
 }

 int sunxi_ccu_probe(struct device_node *node, void __iomem *reg,

But I'm not sure that's a good approach in general. This is a sunxi-ng
ccu issue, rather than an issue with your patches. Maxime, any ideas?

regards,
  Ondrej

> 	- use platform_get_irq instead of irq_of_parse_and_map
> 		(Maxime Ripard)
> 	- rename sunxi to sun8i (Maxime Ripard)
> 	- fix coding style errors (Maxime Ripard)
> 	- subclass the drm structure in private data (Daniel Vetter)
> 	- move drm_dev_register at end of init (Daniel Vetter)
> v5:
> 	- add overlay plane
> 	- add audio support
> 	- add support for the A83T
> 	- add back the HDMI driver
> 	- many bug fixes
> v4:=20
> 	- drivers/clk/sunxi/Makefile was missing (Emil Velikov)
> v3:
> 	- add the hardware cursor
> 	- simplify and fix the DE2 init sequences
> 	- generation for all SUNXI SoCs (Andre Przywara)
> v2:
> 	- remove the HDMI driver
> 	- remarks from Chen-Yu Tsai and Russell King
> 	- DT documentation added
>=20
> Jean-Francois Moine (5):
>   drm: sun8i: Add a basic DRM driver for Allwinner DE2
>   drm: sunxi: add HDMI video support to A83T and H3
>   ARM: dts: sun8i-h3: add HDMI video nodes
>   ARM: dts: sun8i-h3: Add HDMI video to the Banana Pi M2+
>   ARM: dts: sun8i-h3: Add HDMI video to the Orange PI 2
>=20
>  .../devicetree/bindings/display/sunxi/hdmi.txt     |  53 ++
>  .../bindings/display/sunxi/sun8i-de2.txt           |  83 ++
>  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    |  13 +
>  arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          |  13 +
>  arch/arm/boot/dts/sun8i-h3.dtsi                    |  51 ++
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/sun8i/Kconfig                      |  26 +
>  drivers/gpu/drm/sun8i/Makefile                     |   9 +
>  drivers/gpu/drm/sun8i/de2_crtc.c                   | 440 +++++++++++
>  drivers/gpu/drm/sun8i/de2_crtc.h                   |  50 ++
>  drivers/gpu/drm/sun8i/de2_drm.h                    |  48 ++
>  drivers/gpu/drm/sun8i/de2_drv.c                    | 379 ++++++++++
>  drivers/gpu/drm/sun8i/de2_hdmi.c                   | 394 ++++++++++
>  drivers/gpu/drm/sun8i/de2_hdmi.h                   |  51 ++
>  drivers/gpu/drm/sun8i/de2_hdmi_io.c                | 839 +++++++++++++++=
++++++
>  drivers/gpu/drm/sun8i/de2_plane.c                  | 712 +++++++++++++++=
++
>  17 files changed, 3164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sunxi/hdmi.=
txt
>  create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun8i=
-de2.txt
>  create mode 100644 drivers/gpu/drm/sun8i/Kconfig
>  create mode 100644 drivers/gpu/drm/sun8i/Makefile
>  create mode 100644 drivers/gpu/drm/sun8i/de2_crtc.c
>  create mode 100644 drivers/gpu/drm/sun8i/de2_crtc.h
>  create mode 100644 drivers/gpu/drm/sun8i/de2_drm.h
>  create mode 100644 drivers/gpu/drm/sun8i/de2_drv.c
>  create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi.c
>  create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi.h
>  create mode 100644 drivers/gpu/drm/sun8i/de2_hdmi_io.c
>  create mode 100644 drivers/gpu/drm/sun8i/de2_plane.c
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--B01760V0N2CPtqwoXlxFBxjoeQfGlgrDG--

--mN5FvGEOLxKgVJoLD0jCIEi2QFUFCnls5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYMkXdAAoJEG5kJsZ3z+/xc5EP+gNRVTKVR5LWIaQtP5NQlVag
vJkF3TMZkhLiwkqsvWolTFvboJH+rKVZqStiHykcuM+1BrfC8UsUqX7QdnBPCIKV
0e0ErwcBGPI1kZiEqsDG/PVON0UqR5U5jV1uHh1MlSHtzBEgRxXhjMqIi/ynMckA
clU3JnyRhnPSY3ma7DaXo43XHaqTaV0kryQqobfqcU1OK4qM6sApdzshdwcvBTKG
g2sRLjwE/6WEt6zbeQb0QEklrcw0eAeAeHQ6aftpYNa+RfzU7cvvMcAfAzNYnooe
cgCEVYiYXRDy1daoCQ5hRfkMAriBQG9+ebDllkIJHd7p+juVq9NL+SvsIk6ok+O9
58kOHjoPslM41VghB9jj1GiyKwt1Y6dyEktMfv5EbSphnKbLlXjQHSnAGX90tsKb
w+hP+89KRJBBPKMgUlz8IpMU7kyLUXsroVGwDi4M2TlT0bbpVbr9Uro7bmdU0rEF
f+3cihl1RNPE8vEmIUOTxPH7ZNol/p00C3A7ZdL/28XLYet/LZdJB3RepaUXxR6S
F9hYZiO01pk3+RNfaBxjLNC1WA8Zdbu/sdWtdIBV/QU4AKF0QWYc9ZBWhsxQZaT1
/JIYduf9kcA/5u39Y+jgfXohD2dE2G8n9DnLhAwQ4MGGBt9yS2aiATBvZUmKki/h
q3wNUWKdmQmRsylrA64o
=MANJ
-----END PGP SIGNATURE-----

--mN5FvGEOLxKgVJoLD0jCIEi2QFUFCnls5--
