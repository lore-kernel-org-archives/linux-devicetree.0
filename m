From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 6/6] ARM: hisilicon: DT: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:29:21 +0200
Message-ID: <20190611072921.2979446-7-lkundrak@v3.sk>
References: <20190611072921.2979446-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611072921.2979446-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Wei Xu <xuwei5@hisilicon.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Patrice Chotard <patrice.chotard@st.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/hi3620-hi4511.dts  | 5 +----
 arch/arm/boot/dts/hi3620.dtsi        | 5 +----
 arch/arm/boot/dts/hip04-d01.dts      | 5 +----
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts | 5 +----
 arch/arm/boot/dts/hisi-x5hd2.dtsi    | 5 +----
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/hi3620-hi4511.dts b/arch/arm/boot/dts/hi36=
20-hi4511.dts
index a579fbf13b5f..86282e6a2eff 100644
--- a/arch/arm/boot/dts/hi3620-hi4511.dts
+++ b/arch/arm/boot/dts/hi3620-hi4511.dts
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2012-2013 Linaro Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@linaro.org>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 /dts-v1/;
diff --git a/arch/arm/boot/dts/hi3620.dtsi b/arch/arm/boot/dts/hi3620.dts=
i
index 541d70094544..d6aed21eaac5 100644
--- a/arch/arm/boot/dts/hi3620.dtsi
+++ b/arch/arm/boot/dts/hi3620.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Hisilicon Ltd. Hi3620 SoC
  *
@@ -5,10 +6,6 @@
  * Copyright (C) 2012-2013 Linaro Ltd.
  *
  * Author: Haojian Zhuang <haojian.zhuang@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
  */
=20
 #include <dt-bindings/clock/hi3620-clock.h>
diff --git a/arch/arm/boot/dts/hip04-d01.dts b/arch/arm/boot/dts/hip04-d0=
1.dts
index ca48641d0f48..157244dbd074 100644
--- a/arch/arm/boot/dts/hip04-d01.dts
+++ b/arch/arm/boot/dts/hip04-d01.dts
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2013-2014 Linaro Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@linaro.org>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 /dts-v1/;
diff --git a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts b/arch/arm/boot/dts/his=
i-x5hd2-dkb.dts
index d13af8437d10..cb507e237068 100644
--- a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
+++ b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013-2014 Linaro Ltd.
  * Copyright (c) 2013-2014 Hisilicon Limited.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 /dts-v1/;
diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x=
5hd2.dtsi
index 50d3f8426da1..2dd1d4fb0c27 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013-2014 Linaro Ltd.
  * Copyright (c) 2013-2014 Hisilicon Limited.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * publishhed by the Free Software Foundation.
  */
=20
 #include <dt-bindings/clock/hix5hd2-clock.h>
--=20
2.21.0
