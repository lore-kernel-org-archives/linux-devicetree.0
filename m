From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: [PATCH] ARM: dts: imx6ull: Use the correct style for SPDX License
 Identifier
Date: Mon, 11 Mar 2019 19:57:04 +0530
Message-ID: <20190311142700.GA5867@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch corrects the SPDX License Identifier style
in imx6ull-pinfunc-snvs.h.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46
and making some manual changes.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 arch/arm/boot/dts/imx6ull-pinfunc-snvs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h b/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
index f6fb6783c193..54cfe72295aa 100644
--- a/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
+++ b/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2017 NXP
-- 
2.17.1
