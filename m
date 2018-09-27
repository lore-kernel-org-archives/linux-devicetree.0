Return-Path: <SRS0=yXvz=MJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57538 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727265AbeI1D0R (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Sep 2018 23:26:17 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/4] bus: ti-sysc: Detect timer and gpio on dra7
Date: Thu, 27 Sep 2018 14:05:39 -0700
Message-Id: <20180927210542.69703-2-tony@atomide.com>
In-Reply-To: <20180927210542.69703-1-tony@atomide.com>
References: <20180927210542.69703-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

We need to detect timer and gpio on dra7 because of the
SYSC_QUIRK_LEGACY_IDLE flag for suspend and resume.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -869,7 +869,7 @@ struct sysc_revision_quirk {
 
 static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	/* These drivers need to be fixed to not use pm_runtime_irq_safe() */
-	SYSC_QUIRK("gpio", 0, 0, 0x10, 0x114, 0x50600801, 0xffff0fff,
+	SYSC_QUIRK("gpio", 0, 0, 0x10, 0x114, 0x50600801, 0xffff00ff,
 		   SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_OPT_CLKS_IN_RESET),
 	SYSC_QUIRK("mmu", 0, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
 		   SYSC_QUIRK_LEGACY_IDLE),
@@ -884,7 +884,9 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("timer", 0, 0, 0x10, 0x14, 0x00000015, 0xffffffff,
 		   SYSC_QUIRK_LEGACY_IDLE),
 	/* Some timers on omap4 and later */
-	SYSC_QUIRK("timer", 0, 0, 0x10, -1, 0x4fff1301, 0xffffffff,
+	SYSC_QUIRK("timer", 0, 0, 0x10, -1, 0x50002100, 0xffffffff,
+		   SYSC_QUIRK_LEGACY_IDLE),
+	SYSC_QUIRK("timer", 0, 0, 0x10, -1, 0x4fff1301, 0xffff00ff,
 		   SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000052, 0xffffffff,
 		   SYSC_QUIRK_LEGACY_IDLE),
-- 
2.19.0
