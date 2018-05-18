From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH] ASoC: ssm2305: fix header layout
Date: Fri, 18 May 2018 11:55:06 +0200
Message-ID: <20180518095506.28875-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lars@metafoo.de
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Make C-header and SPDX-License-Identifier header uniform.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/codecs/ssm2305.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/ssm2305.c b/sound/soc/codecs/ssm2305.c
index 39d8b01cd852..2968959c4b75 100644
--- a/sound/soc/codecs/ssm2305.c
+++ b/sound/soc/codecs/ssm2305.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-/*
- * Analog Devices SSM2305 Amplifier Driver
- *
- * Copyright (C) 2018 Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
+//
+// Analog Devices SSM2305 Amplifier Driver
+//
+// Copyright (C) 2018 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+//
 
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-- 
2.17.0
