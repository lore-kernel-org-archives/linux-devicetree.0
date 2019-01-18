From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: hi3798cv200: fix malformed SPDX license identifier
Date: Fri, 18 Jan 2019 08:54:04 +0800
Message-ID: <20190118005404.10452-1-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Xu <xuwei5@hisilicon.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It fixes malformed SPDX license identifier in Hi3798CV200 and Poplar
DTS, accroding to Documentation/process/license-rules.rst.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 4 +---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi       | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
index 32716c96b457..c563d3eb2d98 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
@@ -1,10 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * DTS File for HiSilicon Poplar Development Board
  *
  * Copyright (c) 2016-2017 HiSilicon Technologies Co., Ltd.
- *
- * Released under the GPLv2 only.
- * SPDX-License-Identifier: GPL-2.0
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 7c0fddd7c8cf..13821a0ff524 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -1,10 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * DTS File for HiSilicon Hi3798cv200 SoC.
  *
  * Copyright (c) 2016-2017 HiSilicon Technologies Co., Ltd.
- *
- * Released under the GPLv2 only.
- * SPDX-License-Identifier: GPL-2.0
  */
 
 #include <dt-bindings/clock/histb-clock.h>
-- 
2.18.0
