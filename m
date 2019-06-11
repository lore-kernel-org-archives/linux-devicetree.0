From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] arm64: dts: hisilicon: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:20:09 +0200
Message-ID: <20190611072009.2978447-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Xu <xuwei5@hisilicon.com>
Cc: Pengcheng Li <lipengcheng8@huawei.com>, Leo Yan <leo.yan@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 5 +----
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts         | 5 +----
 arch/arm64/boot/dts/hisilicon/hip05.dtsi            | 5 +----
 arch/arm64/boot/dts/hisilicon/hip06-d03.dts         | 5 +----
 arch/arm64/boot/dts/hisilicon/hip06.dtsi            | 5 +----
 arch/arm64/boot/dts/hisilicon/hip07-d05.dts         | 5 +----
 arch/arm64/boot/dts/hisilicon/hip07.dtsi            | 5 +----
 7 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/a=
rm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 68c52f1149be..f9662a9f17b8 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * dtsi file for Hisilicon Hi6220 coresight
  *
@@ -6,10 +7,6 @@
  * Author: Pengcheng Li <lipengcheng8@huawei.com>
  *         Leo Yan <leo.yan@linaro.org>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 / {
diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boo=
t/dts/hisilicon/hip05-d02.dts
index 3bbd017f088f..154c25d1d50d 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * dts file for Hisilicon D02 Development Board
  *
  * Copyright (C) 2014,2015 Hisilicon Ltd.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/d=
ts/hisilicon/hip05.dtsi
index d321edc09c3f..a2ffaee686b0 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * dts file for Hisilicon D02 Development Board
  *
  * Copyright (C) 2014,2015 Hisilicon Ltd.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts b/arch/arm64/boo=
t/dts/hisilicon/hip06-d03.dts
index a95c6f5619bf..46616215969d 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * dts file for Hisilicon D03 Development Board
  *
  * Copyright (C) 2016 Hisilicon Ltd.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/d=
ts/hisilicon/hip06.dtsi
index 56625587b6de..00baee6d399c 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * dts file for Hisilicon D03 Development Board
  *
  * Copyright (C) 2016 Hisilicon Ltd.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts b/arch/arm64/boo=
t/dts/hisilicon/hip07-d05.dts
index 21147e8e3f94..d0cd986ab3a0 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * dts file for Hisilicon D05 Development Board
  *
  * Copyright (C) 2016 Hisilicon Ltd.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/d=
ts/hisilicon/hip07.dtsi
index 28bd4389441f..abfa416613e5 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * dts file for Hisilicon D05 Development Board
  *
  * Copyright (C) 2016 Hisilicon Ltd.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
- *
  */
=20
 #include <dt-bindings/interrupt-controller/arm-gic.h>
--=20
2.21.0
