Return-Path: <SRS0=Vvmi=NE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from avon.wwwdotorg.org ([104.237.132.123]:55922 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbeJYBeL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Oct 2018 21:34:11 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ARM: dt: relicense two DT binding IRQ headers
Date: Wed, 24 Oct 2018 11:05:13 -0600
Message-Id: <20181024170513.25431-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Warren <swarren@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

Files in include/dt-bindings/ may be useful to any OS that uses DT, when
building the OS binary itself, not just when building DTB files. Since
some OSs are not GPL, they need non-GPL headers. This change relicenses
two of the useful files so that they can be used under the MIT license
when desired. I wrote these files and NVIDIA legal has approved this
change. Geert also ack'd the change; he fixed some spelling issues in the
comments.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 include/dt-bindings/interrupt-controller/arm-gic.h | 2 +-
 include/dt-bindings/interrupt-controller/irq.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/interrupt-controller/arm-gic.h b/include/dt-bindings/interrupt-controller/arm-gic.h
index 0c85f65c81c7..35b6f69b7db6 100644
--- a/include/dt-bindings/interrupt-controller/arm-gic.h
+++ b/include/dt-bindings/interrupt-controller/arm-gic.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * This header provides constants for the ARM GIC.
  */
diff --git a/include/dt-bindings/interrupt-controller/irq.h b/include/dt-bindings/interrupt-controller/irq.h
index a8b310555f14..9e3d183e1381 100644
--- a/include/dt-bindings/interrupt-controller/irq.h
+++ b/include/dt-bindings/interrupt-controller/irq.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * This header provides constants for most IRQ bindings.
  *
-- 
2.19.1
