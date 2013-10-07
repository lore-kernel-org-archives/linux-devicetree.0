From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/12] pwm-backlight: Add GPIO and power supply support
Date: Mon,  7 Oct 2013 13:37:34 +0200
Message-ID: <1381145866-445-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guan Xuetao <gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds the ability to specify a GPIO and a power supply to
enable a backlight.

Patch 1 adds some blank lines to make the code look less cluttered in
various places.

Patch 2 refactors the power on and power off sequences into separate
functions in preparation for subsequent patches.

Patch 3 adds functionality to track the on/off state of the backlight.
This is required by subsequent patches to make sure that enabling and
disabling used resources remains balanced.

Patch 4 adds an optional GPIO to enable a backlight. This patch only
includes the field within the platform data so that it can be properly
setup before actually being put to use.

Patches 5 to 9 convert all users of the pwm-backlight driver to use the
new field. For most of them, this just initializes the field to -1,
marking the field as unused.

Patch 10 uses the new field within the pwm-backlight driver and at the
same time allows it to be parsed from device tree.

Patch 11 implements support for an optional power supply. This relies on
the regulator core to return a dummy regulator when no supply has been
otherwise setup so the driver doesn't have to handle that specially nor
require all users to be updated.

Patch 12 adds a way to keep a backlight turned off at boot. This is
useful when hooking up a backlight with a subsystem such as DRM which
has more explicit semantics as to when a backlight should be turned on.

Due to the dependencies within the series, I propose to take all these
patches through the PWM tree, so I'll need acks from OMAP, PXA, Samsung,
shmobile and Unicore32 maintainers.

Thierry

Thierry Reding (12):
  pwm-backlight: Improve readability
  pwm-backlight: Refactor backlight power on/off
  pwm-backlight: Track enable state
  pwm-backlight: Add optional enable GPIO
  ARM: OMAP: Initialize PWM backlight enable_gpio field
  ARM: pxa: Initialize PWM backlight enable_gpio field
  ARM: SAMSUNG: Initialize PWM backlight enable_gpio field
  ARM: shmobile: Initialize PWM backlight enable_gpio field
  unicore32: Initialize PWM backlight enable_gpio field
  pwm-backlight: Use new enable_gpio field
  pwm-backlight: Add power supply support
  pwm-backlight: Allow backlight to remain disabled on boot

 .../bindings/video/backlight/pwm-backlight.txt     |   8 ++
 arch/arm/mach-omap2/board-zoom-peripherals.c       |   1 +
 arch/arm/mach-pxa/cm-x300.c                        |   1 +
 arch/arm/mach-pxa/colibri-pxa270-income.c          |   1 +
 arch/arm/mach-pxa/ezx.c                            |   1 +
 arch/arm/mach-pxa/hx4700.c                         |   1 +
 arch/arm/mach-pxa/lpd270.c                         |   1 +
 arch/arm/mach-pxa/magician.c                       |   1 +
 arch/arm/mach-pxa/mainstone.c                      |   1 +
 arch/arm/mach-pxa/mioa701.c                        |   1 +
 arch/arm/mach-pxa/palm27x.c                        |   1 +
 arch/arm/mach-pxa/palmtc.c                         |  35 +----
 arch/arm/mach-pxa/palmte2.c                        |   1 +
 arch/arm/mach-pxa/pcm990-baseboard.c               |   1 +
 arch/arm/mach-pxa/raumfeld.c                       |   1 +
 arch/arm/mach-pxa/tavorevb.c                       |   2 +
 arch/arm/mach-pxa/viper.c                          |   1 +
 arch/arm/mach-pxa/z2.c                             |   2 +
 arch/arm/mach-pxa/zylonite.c                       |   1 +
 arch/arm/mach-s3c24xx/mach-h1940.c                 |   1 +
 arch/arm/mach-s3c24xx/mach-rx1950.c                |   1 +
 arch/arm/mach-s3c64xx/mach-crag6410.c              |   1 +
 arch/arm/mach-s3c64xx/mach-hmt.c                   |   1 +
 arch/arm/mach-s3c64xx/mach-smartq.c                |   1 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |   1 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |   1 +
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |   1 +
 arch/arm/mach-s5pc100/mach-smdkc100.c              |   1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   1 +
 arch/arm/mach-shmobile/board-armadillo800eva.c     |   1 +
 arch/arm/plat-samsung/dev-backlight.c              |   5 +
 arch/unicore32/kernel/puv3-nb0916.c                |   1 +
 drivers/video/backlight/pwm_bl.c                   | 149 ++++++++++++++++-----
 include/linux/pwm_backlight.h                      |   7 +
 34 files changed, 171 insertions(+), 64 deletions(-)

-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
