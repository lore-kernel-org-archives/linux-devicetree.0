Return-Path: <SRS0=yXvz=MJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57540 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727265AbeI1D0T (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Sep 2018 23:26:19 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/4] bus: ti-sysc: Detect devices for debug on dra7
Date: Thu, 27 Sep 2018 14:05:40 -0700
Message-Id: <20180927210542.69703-3-tony@atomide.com>
In-Reply-To: <20180927210542.69703-1-tony@atomide.com>
References: <20180927210542.69703-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

We want to see the names of detected devices when DEBUG is enabled.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -898,7 +898,9 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 
 #ifdef DEBUG
 	SYSC_QUIRK("adc", 0, 0, 0x10, -1, 0x47300001, 0xffffffff, 0),
+	SYSC_QUIRK("atl", 0, 0, -1, -1, 0x0a070100, 0xffffffff, 0),
 	SYSC_QUIRK("aess", 0, 0, 0x10, -1, 0x40000000, 0xffffffff, 0),
+	SYSC_QUIRK("cm", 0, 0, -1, -1, 0x40000301, 0xffffffff, 0),
 	SYSC_QUIRK("control", 0, 0, 0x10, -1, 0x40000900, 0xffffffff, 0),
 	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
 		   0xffff00f0, 0),
@@ -911,16 +913,16 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x0000000a, 0xffffffff, 0),
 	SYSC_QUIRK("hsi", 0, 0, 0x10, 0x14, 0x50043101, 0xffffffff, 0),
 	SYSC_QUIRK("iss", 0, 0, 0x10, -1, 0x40000101, 0xffffffff, 0),
-	SYSC_QUIRK("i2c", 0, 0, 0x10, 0x90, 0x5040000a, 0xfffffff0, 0),
+	SYSC_QUIRK("i2c", 0, 0, 0x10, 0x90, 0x5040000a, 0xfffff0f0, 0),
 	SYSC_QUIRK("lcdc", 0, 0, 0x54, -1, 0x4f201000, 0xffffffff, 0),
 	SYSC_QUIRK("mcasp", 0, 0, 0x4, -1, 0x44306302, 0xffffffff, 0),
 	SYSC_QUIRK("mcasp", 0, 0, 0x4, -1, 0x44307b02, 0xffffffff, 0),
 	SYSC_QUIRK("mcbsp", 0, -1, 0x8c, -1, 0, 0, 0),
-	SYSC_QUIRK("mcspi", 0, 0, 0x10, -1, 0x40300a0b, 0xffffffff, 0),
+	SYSC_QUIRK("mcspi", 0, 0, 0x10, -1, 0x40300a0b, 0xffff00ff, 0),
 	SYSC_QUIRK("mcspi", 0, 0, 0x110, 0x114, 0x40300a0b, 0xffffffff, 0),
 	SYSC_QUIRK("mailbox", 0, 0, 0x10, -1, 0x00000400, 0xffffffff, 0),
 	SYSC_QUIRK("m3", 0, 0, -1, -1, 0x5f580105, 0x0fff0f00, 0),
-	SYSC_QUIRK("ocp2scp", 0, 0, 0x10, 0x14, 0x50060005, 0xffffffff, 0),
+	SYSC_QUIRK("ocp2scp", 0, 0, 0x10, 0x14, 0x50060005, 0xfffffff0, 0),
 	SYSC_QUIRK("ocp2scp", 0, 0, -1, -1, 0x50060007, 0xffffffff, 0),
 	SYSC_QUIRK("padconf", 0, 0, 0x10, -1, 0x4fff0800, 0xffffffff, 0),
 	SYSC_QUIRK("prcm", 0, 0, -1, -1, 0x40000100, 0xffffffff, 0),
@@ -929,15 +931,16 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("scm", 0, 0, 0x10, -1, 0x40000900, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, -1, -1, 0x4e8b0100, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, -1, -1, 0x4f000100, 0xffffffff, 0),
+	SYSC_QUIRK("scm", 0, 0, -1, -1, 0x40000900, 0xffffffff, 0),
 	SYSC_QUIRK("scrm", 0, 0, -1, -1, 0x00000010, 0xffffffff, 0),
-	SYSC_QUIRK("sdio", 0, 0, 0x10, -1, 0x40202301, 0xffffffff, 0),
+	SYSC_QUIRK("sdio", 0, 0, 0x10, -1, 0x40202301, 0xffff0ff0, 0),
 	SYSC_QUIRK("sdio", 0, 0x2fc, 0x110, 0x114, 0x31010000, 0xffffffff, 0),
 	SYSC_QUIRK("sdma", 0, 0, 0x2c, 0x28, 0x00010900, 0xffffffff, 0),
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -1, 0x40000902, 0xffffffff, 0),
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -1, 0x40002903, 0xffffffff, 0),
 	SYSC_QUIRK("spinlock", 0, 0, 0x10, -1, 0x50020000, 0xffffffff, 0),
 	SYSC_QUIRK("rng", 0, 0x1fe0, 0x1fe4, -1, 0x00000020, 0xffffffff, 0),
-	SYSC_QUIRK("rtc", 0, 0x74, 0x78, -1, 0x4eb01908, 0xfffff0f0, 0),
+	SYSC_QUIRK("rtc", 0, 0x74, 0x78, -1, 0x4eb01908, 0xffff00f0, 0),
 	SYSC_QUIRK("timer32k", 0, 0, 0x4, -1, 0x00000060, 0xffffffff, 0),
 	SYSC_QUIRK("usbhstll", 0, 0, 0x10, 0x14, 0x00000004, 0xffffffff, 0),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff, 0),
-- 
2.19.0
