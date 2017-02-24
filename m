From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 01/17] dt-bindings: Add vendor prefix for Actions Semi
Date: Fri, 24 Feb 2017 04:40:39 +0100
Message-ID: <20170224034055.18807-2-afaerber@suse.de>
References: <20170224034055.18807-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170224034055.18807-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Actions Semiconductor was listed on NASDAQ as ACTS until Dec 16, 2016.

Cc: mp-cs@actions-semi.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Reverted from "acts" to "actions" (cf. IAP140 "mrvl" vs. "marvell")
 
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index a76b981..64f8469 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -6,6 +6,7 @@ using them to avoid name-space collisions.
 abcn	Abracon Corporation
 abilis	Abilis Systems
 active-semi	Active-Semi International Inc
+actions	Actions Semiconductor Co., Ltd.
 ad	Avionic Design GmbH
 adapteva	Adapteva, Inc.
 adh	AD Holdings Plc.
-- 
2.10.2
