From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] Immutable branch between MFD, Extcon, GPIO and Regulator
Date: Thu, 12 Mar 2015 13:36:40 +0000
Message-ID: <20150312133640.GB3383@x1>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425399576-26428-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Gentlemen,

I think this has soaked for long enough now.  Hopefully there are no is=
sues.

The following changes since commit c517d838eb7d07bbe9507871fab3931deccf=
f539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd=
-extcon-gpio-regulator-v4.1

for you to fetch changes up to 575ef7f6d5df2aec86f407c76c0b95b3064e4b30=
:

  ASoC: arizona: Add support for WM8280/WM8281 (2015-02-26 10:04:45 +00=
00)

----------------------------------------------------------------
Immutable branch between MFD, Extcon, GPIO and Regulator due for the v4=
=2E1 merge window

----------------------------------------------------------------
Richard Fitzgerald (6):
      mfd: arizona: Add support for WM8280/WM8281
      Documentation: devicetree: arizona: Add bindings for WM8280
      regulator: arizona-micsupp: Add support for WM8280/WM8281
      gpio: arizona: Add support for WM8280/WM8281
      extcon: arizona: Add support for WM8280/WM8281
      ASoC: arizona: Add support for WM8280/WM8281

 Documentation/devicetree/bindings/mfd/arizona.txt | 15 +++++++++++----
 drivers/extcon/extcon-arizona.c                   |  1 +
 drivers/gpio/gpio-arizona.c                       |  1 +
 drivers/mfd/Kconfig                               |  5 +++--
 drivers/mfd/arizona-core.c                        | 15 +++++++++++++--
 drivers/mfd/arizona-i2c.c                         |  2 ++
 drivers/mfd/arizona-irq.c                         |  1 +
 drivers/mfd/arizona-spi.c                         |  2 ++
 drivers/regulator/arizona-micsupp.c               |  1 +
 include/linux/mfd/arizona/core.h                  |  1 +
 sound/soc/codecs/arizona.c                        |  2 ++
 11 files changed, 38 insertions(+), 8 deletions(-)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
