From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 15/25] ARM: dts: sun8i: Switch H2+ dts to use SPDX identifier
Date: Wed,  3 Jul 2019 18:15:59 +0530
Message-ID: <20190703124609.21435-16-jagan@amarulasolutions.com>
References: <20190703124609.21435-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703124609.21435-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Adopt the SPDX license identifier headers to ease license
compliance management on Allwinner H2+ dts files.

While the text specifies "of the GPL or the X11 license"
but the actual license text matches the MIT license as
specified at [0]

[0] https://spdx.org/licenses/MIT.html

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../boot/dts/sun8i-h2-plus-orangepi-r1.dts    | 39 +------------------
 .../boot/dts/sun8i-h2-plus-orangepi-zero.dts  | 39 +------------------
 2 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
index 3356f4210d45..ff31d817b551 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
@@ -1,43 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.xyz>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 /* Orange Pi R1 is based on Orange Pi Zero design */
diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
index f19ed981da9d..c2a4d8f5f251 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -1,46 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
  *
  * Based on sun8i-h3-orangepi-one.dts, which is:
  *   Copyright (C) 2016 Hans de Goede <hdegoede@redhat.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 /dts-v1/;
-- 
2.18.0.321.gffc6fa0e3
