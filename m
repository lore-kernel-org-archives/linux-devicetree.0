From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 1/4] rtc: stm32: fix copyright and adopt SPDX identifier
Date: Thu, 19 Apr 2018 15:21:40 +0200
Message-ID: <1524144103-21432-2-git-send-email-amelie.delaunay@st.com>
References: <1524144103-21432-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524144103-21432-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

Fix copyright by removing "SA" and "for STMicroelectronics", not required.
Adopt SPDX identifier.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/rtc/rtc-stm32.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index f25dabe..79d9e86 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1,7 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) STMicroelectronics SA 2017
- * Author:  Amelie Delaunay <amelie.delaunay@st.com> for STMicroelectronics.
- * License terms:  GNU General Public License (GPL), version 2
+ * Copyright (C) STMicroelectronics 2017
+ * Author:  Amelie Delaunay <amelie.delaunay@st.com>
  */
 
 #include <linux/bcd.h>
-- 
2.7.4
