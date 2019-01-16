From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] dt-bindings: reset: meson-axg: fix SPDX license id
Date: Wed, 16 Jan 2019 11:36:32 +0100
Message-ID: <20190116103632.17754-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>
List-Id: devicetree@vger.kernel.org

As reported, the SPDX license id is not placed correctly and the variant
of the BSD License used should be specified.

Fixes: c16292578ffa ("dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset Controller")
Reported-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Sorry for the delay Thomas.

 Regards
 Jerome

 include/dt-bindings/reset/amlogic,meson-axg-reset.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-axg-reset.h b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
index ad6f55dabd6d..0f2e0fe45ca4 100644
--- a/include/dt-bindings/reset/amlogic,meson-axg-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
@@ -1,12 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
 /*
- *
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  *
  * Copyright (c) 2017 Amlogic, inc.
  * Author: Yixun Lan <yixun.lan@amlogic.com>
  *
- * SPDX-License-Identifier: (GPL-2.0+ OR BSD)
  */
 
 #ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
-- 
2.20.1
