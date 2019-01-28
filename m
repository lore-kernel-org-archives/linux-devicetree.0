From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 146/304] ARM: dts: Fix up the D-Link DIR-685 MTD partition info
Date: Mon, 28 Jan 2019 10:41:03 -0500
Message-ID: <20190128154341.47195-146-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit 738a05e673435afb986b53da43befd83ad87ec3b ]

The vendor firmware was analyzed to get the right idea about
this flash layout. /proc/mtd contains:

dev:    size   erasesize  name
mtd0: 01e7ff40 00020000 "rootfs"
mtd1: 01f40000 00020000 "upgrade"
mtd2: 00040000 00020000 "rgdb"
mtd3: 00020000 00020000 "nvram"
mtd4: 00040000 00020000 "RedBoot"
mtd5: 00020000 00020000 "LangPack"
mtd6: 02000000 00020000 "flash"

Here "flash" is obviously the whole device and we know "rootfs"
is a bogus hack to point to a squashfs rootfs inside of the main
"upgrade partition". We know "RedBoot" is the first 0x40000 of
the flash and the "upgrade" partition follows from 0x40000 to
0x1f8000. So we have mtd0, 1, 4 and 6 covered.

Remains:
mtd2: 00040000 00020000 "rgdb"
mtd3: 00020000 00020000 "nvram"
mtd5: 00020000 00020000 "LangPack"

Inspecting the flash at 0x1f8000 and 0x1fa000 reveals each of
these starting with "RGCFG1" so we assume 0x1f8000-1fbfff is
"rgdb" of 0x40000.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/gemini-dlink-dir-685.dts | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/gemini-dlink-dir-685.dts b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
index 6f258b50eb44..502a361d1fe9 100644
--- a/arch/arm/boot/dts/gemini-dlink-dir-685.dts
+++ b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
@@ -274,20 +274,16 @@
 				read-only;
 			};
 			/*
-			 * Between the boot loader and the rootfs is the kernel
-			 * in a custom Storlink format flashed from the boot
-			 * menu. The rootfs is in squashfs format.
+			 * This firmware image contains the kernel catenated
+			 * with the squashfs root filesystem. For some reason
+			 * this is called "upgrade" on the vendor system.
 			 */
-			partition@1800c0 {
-				label = "rootfs";
-				reg = <0x001800c0 0x01dbff40>;
-				read-only;
-			};
-			partition@1f40000 {
+			partition@40000 {
 				label = "upgrade";
-				reg = <0x01f40000 0x00040000>;
+				reg = <0x00040000 0x01f40000>;
 				read-only;
 			};
+			/* RGDB, Residental Gateway Database? */
 			partition@1f80000 {
 				label = "rgdb";
 				reg = <0x01f80000 0x00040000>;
-- 
2.19.1
