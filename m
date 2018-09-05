From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 9/9] microblaze: enable building all dtbs
Date: Wed,  5 Sep 2018 18:53:27 -0500
Message-ID: <20180905235327.5996-10-robh@kernel.org>
References: <20180905235327.5996-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905235327.5996-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Simek <monstr@monstr.eu>
List-Id: devicetree@vger.kernel.org

Enable the 'dtbs' target for microblaze. As microblaze only has one dts
file, always enable it.

Cc: Michal Simek <monstr@monstr.eu>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack so I can take the whole series via the DT tree.

v2:
 - new patch

 arch/microblaze/boot/dts/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/dts/Makefile
index fe9af267f598..c7324e74f9ef 100644
--- a/arch/microblaze/boot/dts/Makefile
+++ b/arch/microblaze/boot/dts/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 #

+dtb-y := system.dtb
+
 ifneq ($(DTB),)
 obj-y += linked_dtb.o

--
2.17.1
