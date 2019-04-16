From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: [PATCH v3 1/5] arm64: Use the correct style for SPDX License
 Identifier
Date: Tue, 16 Apr 2019 20:49:35 +0530
Message-ID: <ecdbe63bea1b1d2d67db6cc577aa32bf872f2310.1555427419.git.nishadkamdar@gmail.com>
References: <cover.1555427418.git.nishadkamdar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1555427418.git.nishadkamdar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This patch corrects the SPDX License Identifier style
in the arm64 Hardware Architecture related files.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h | 2 +-
 arch/arm64/include/asm/pointer_auth.h         | 2 +-
 arch/arm64/include/asm/sdei.h                 | 2 +-
 arch/arm64/include/asm/vmap_stack.h           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
index 1b4cb0c55744..385c455a7c98 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
+++ b/arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
diff --git a/arch/arm64/include/asm/pointer_auth.h b/arch/arm64/include/asm/pointer_auth.h
index 15d49515efdd..d328540cb85e 100644
--- a/arch/arm64/include/asm/pointer_auth.h
+++ b/arch/arm64/include/asm/pointer_auth.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef __ASM_POINTER_AUTH_H
 #define __ASM_POINTER_AUTH_H
 
diff --git a/arch/arm64/include/asm/sdei.h b/arch/arm64/include/asm/sdei.h
index ffe47d766c25..63e0b92a5fbb 100644
--- a/arch/arm64/include/asm/sdei.h
+++ b/arch/arm64/include/asm/sdei.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 // Copyright (C) 2017 Arm Ltd.
 #ifndef __ASM_SDEI_H
 #define __ASM_SDEI_H
diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
index 0b5ec6e08c10..0a12115d9638 100644
--- a/arch/arm64/include/asm/vmap_stack.h
+++ b/arch/arm64/include/asm/vmap_stack.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 // Copyright (C) 2017 Arm Ltd.
 #ifndef __ASM_VMAP_STACK_H
 #define __ASM_VMAP_STACK_H
-- 
2.17.1
