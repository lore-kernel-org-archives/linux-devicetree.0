From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 3/7] drm/vc4: Add KMS support for Raspberry Pi.
Date: Tue, 13 Oct 2015 11:19:27 -0700
Message-ID: <87io6a3a34.fsf@eliezer.anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
 <1444426068-15817-4-git-send-email-eric@anholt.net>
 <561A6BE4.9080409@lategoodbye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1675868200=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <561A6BE4.9080409@lategoodbye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Wahren <info@lategoodbye.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1675868200==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <info@lategoodbye.de> writes:

> Hi Eric,
>
> Am 09.10.2015 um 23:27 schrieb Eric Anholt:
>> This is enough for fbcon and bringing up X using
>> xf86-video-modesetting.  It doesn't support the 3D accelerator or
>> power management yet.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>
>> v2: Drop FB_HELPER select thanks to Archit's patches.  Do manual init
>>      ordering instead of using the .load hook.  Structure registration
>>      more like tegra's, but still using the typical "component" code.
>>      Drop no-op hooks for atomic_begin and mode_fixup() now that
>>      they're optional.  Drop sentinel in Makefile.  Fix minor style
>>      nits I noticed on another reread.
>>
>> v3: Use the new bcm2835 clk driver to manage pixel/HSM clocks instead
>>      of having a fixed video mode.  Use exynos-style component driver
>>      matching instead of devicetree nodes to list the component driver
>>      instances.  Rename compatibility strings to say bcm2835, and
>>      distinguish pv0/1/2.  Clean up some h/vsync code, and add in
>>      interlaced mode setup.  Fix up probe/bind error paths.  Use
>>      bitops.h macros for vc4_regs.h
>>
>>   drivers/gpu/drm/Kconfig           |   2 +
>>   drivers/gpu/drm/Makefile          |   1 +
>>   drivers/gpu/drm/vc4/Kconfig       |  13 +
>>   drivers/gpu/drm/vc4/Makefile      |  17 +
>>   drivers/gpu/drm/vc4/vc4_bo.c      |  52 +++
>>   drivers/gpu/drm/vc4/vc4_crtc.c    | 675 ++++++++++++++++++++++++++++++=
++++++++
>>   drivers/gpu/drm/vc4/vc4_debugfs.c |  39 +++
>>   drivers/gpu/drm/vc4/vc4_drv.c     | 284 ++++++++++++++++
>>   drivers/gpu/drm/vc4/vc4_drv.h     | 115 +++++++
>>   drivers/gpu/drm/vc4/vc4_hdmi.c    | 588 ++++++++++++++++++++++++++++++=
+++
>>   drivers/gpu/drm/vc4/vc4_hvs.c     | 163 +++++++++
>>   drivers/gpu/drm/vc4/vc4_kms.c     |  54 +++
>>   drivers/gpu/drm/vc4/vc4_plane.c   | 320 ++++++++++++++++++
>>   drivers/gpu/drm/vc4/vc4_regs.h    | 570 ++++++++++++++++++++++++++++++=
++
>>   14 files changed, 2893 insertions(+)
>>   create mode 100644 drivers/gpu/drm/vc4/Kconfig
>>   create mode 100644 drivers/gpu/drm/vc4/Makefile
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_bo.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_crtc.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_debugfs.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_drv.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_drv.h
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_hvs.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_kms.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_plane.c
>>   create mode 100644 drivers/gpu/drm/vc4/vc4_regs.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 1a0a8df..c4bf9a1 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -264,3 +264,5 @@ source "drivers/gpu/drm/sti/Kconfig"
>>   source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>
>>   source "drivers/gpu/drm/imx/Kconfig"
>> +
>> +source "drivers/gpu/drm/vc4/Kconfig"
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 45e7719..0edc9e2 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_MGA)	+=3D mga/
>>   obj-$(CONFIG_DRM_I810)	+=3D i810/
>>   obj-$(CONFIG_DRM_I915)  +=3D i915/
>>   obj-$(CONFIG_DRM_MGAG200) +=3D mgag200/
>> +obj-$(CONFIG_DRM_VC4)  +=3D vc4/
>>   obj-$(CONFIG_DRM_CIRRUS_QEMU) +=3D cirrus/
>>   obj-$(CONFIG_DRM_SIS)   +=3D sis/
>>   obj-$(CONFIG_DRM_SAVAGE)+=3D savage/
>> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
>> new file mode 100644
>> index 0000000..e810ef7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vc4/Kconfig
>> @@ -0,0 +1,13 @@
>> +config DRM_VC4
>> +	tristate "Broadcom VC4 Graphics"
>> +	depends on ARCH_BCM2835
>
> depends on (ARCH_BCM2835 || COMPILE_TEST) ?

Done.

>> +	depends on DRM
>> +	select DRM_KMS_HELPER
>> +	select DRM_KMS_CMA_HELPER
>> +	help
>> +	  Choose this option if you have a system that has a Broadcom
>> +	  VC4 GPU, such as the Raspberry Pi or other BCM2708/BCM2835.
>> +
>> +	  This driver requires that "avoid_warnings=3D2" be present in
>> +	  the config.txt for the firmware, to keep it from smashing
>> +	  our display setup.
>> + [...]
>> +static void vc4_crtc_disable(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>> +	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>> +	u32 chan =3D vc4_crtc->channel;
>> +
>> +	require_hvs_enabled(dev);
>> +
>> +	CRTC_WRITE(PV_V_CONTROL,
>> +		   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
>> +	while (CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN)
>> +		cpu_relax();
>> +
>> +	/* Without a wait here, we end up with a black screen. */
>> +	msleep(30);
>
> This looks a little bit strange. First we do a busy loop without any=20
> timeout and then a fixed msleep without reason for the exact duration.
>
> Sorry for the possibly dumb questions:
>
> Is it safe to read PV_V_CONTROL exactly after writing to them? No=20
> sleeping required?

Correct.  We're waiting for the value to land, so you just read until it
does.

I've pulled in a later change for doing waits with timouts.

> How did you come to the 30 milli seconds?

a bit more than a frame.  The comment was there to document why the
sleep was there.  It looks like in retesting now that it's not required.

>> +  [...]
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hd=
mi.c
>> new file mode 100644
>> index 0000000..ae37fec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -0,0 +1,588 @@
>> +/*
>> + * Copyright (C) 2015 Broadcom
>> + * Copyright (c) 2014 The Linux Foundation. All rights reserved.
>> + * Copyright (C) 2013 Red Hat
>> + * Author: Rob Clark <robdclark@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms of the GNU General Public License version 2 as publi=
shed by
>> + * the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but =
WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License al=
ong with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +/**
>> + * DOC: VC4 Falcon HDMI module
>> + *
>> + * The HDMI core has a state machine and a PHY.  Most of the unit
>> + * operates off of the HSM clock from CPRMAN.  It also internally uses
>> + * the PLLH_PIX clock for the PHY.
>> + */
>> +
>> +#include "drm_atomic_helper.h"
>> +#include "drm_crtc_helper.h"
>> +#include "drm_edid.h"
>> +#include "linux/clk.h"
>> +#include "linux/component.h"
>
> #include "linux/i2c.h" ?

Done.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWHUsvAAoJELXWKTbR/J7oy1gP/0kM5nHCH5nbpW3L6SHdTNFW
i11yeS9E3fuj4BtduDXtqGmtt/ya/jDMUEh3xlIuDUVWoGYig+k4Zm2fpiOGD3PV
s1utDpOnXIhRnGXt+JSu0XH13z5qGCe+XIGVZv1vYpcI4qFe834Rqn7+YfQ/7cxa
iuY2gTqs7o/NyK/dZCjb1YSGHPj1ZTR3QiMMHNABq1SYdgyTT2HD1gxdULX5rgVF
FQA0dOR2BNFiOIMI/gSmSVU5PC8M7Bye3J8tE8uaM+jowy/sggjIXjGPJlu0RcWA
38nb9ewAokAyrLm9Y7MAifvKZaRDOQOODwAX3nm5N5abbTMViUWOPGogrX6dAR+x
dCwW0YyOfpUtspu4iRlrWL6pmDHjHzOVcAiAMyr98fQPUDWrWt8GMgJ0ReB/8+5c
fgzR1X0r3CgN+bDogfa40AuHKwyX5b3cYWIozzhGIB0vr0QK+fJv9DPIHx1FdLWq
2R/A9jztgj/L3zN422q8+AhrF20TvyyM7o5Ai3TWGONND9+L8GSxg1Bc/RCn9rzo
NBHVnJb/f2ivEiTdB/DDbZicaiJqvFj//lbP5Iv7io+6aNmzUxk7NWgPf/rA9+gr
uxuAe3NENDdbaZqBRe/mvxv99/Oi7iYI/B6euqxt2B89IdmKBdHhyut5/9/anwdh
VFgy79Q1IxIA6sJwUpbZ
=9SE2
-----END PGP SIGNATURE-----
--=-=-=--

--===============1675868200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1675868200==--
