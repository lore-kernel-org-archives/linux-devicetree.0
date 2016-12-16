From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] regulator: add support for GPIO power load switches
Date: Fri, 16 Dec 2016 16:52:27 +0100
Message-ID: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We would like to add support for GPIO-controlled power load switches
(for example: the tps229* series from Texas Instruments). We use this
chip to power-cycle devices whose power consumption is measured using
baylibre-acme probes thus we need a way to control them from user
space.

I initially submitted a series adding this support via the iio
framework, but it was decided that iio is not the right interface for
that.

This series extends the regulator core to support regulators controlled
from user space and reuses the fixed regulator driver to support gpio
power switches.

Bartosz Golaszewski (3):
  regulator: add support for user space controlled regulators
  doc: DT: add new compatible to fixed regulator's binding
  regulator: fixed: add support for gpio power switches

 .../bindings/regulator/fixed-regulator.txt         |  4 ++-
 drivers/regulator/core.c                           | 38 +++++++++++++++++++++-
 drivers/regulator/fixed.c                          | 33 ++++++++++++++-----
 include/linux/regulator/driver.h                   |  5 +++
 4 files changed, 70 insertions(+), 10 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
