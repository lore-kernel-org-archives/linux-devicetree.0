From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH 1/2] dt-bindings: Add DataImage, Inc. vendor prefix
Date: Mon, 25 Jun 2018 14:41:29 +0200
Message-ID: <1529930490-11874-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, thierry.reding@gmail.com
Cc: mark.rutland@arm.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

DataImage is a Taiwan-based manufacturer of LCD panels.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7cad066..500d5dc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -85,6 +85,7 @@ cubietech	Cubietech, Ltd.
 cypress	Cypress Semiconductor Corporation
 cznic	CZ.NIC, z.s.p.o.
 dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
+dataimage	DataImage, Inc.
 davicom	DAVICOM Semiconductor, Inc.
 delta	Delta Electronics, Inc.
 denx	Denx Software Engineering
-- 
2.1.4
