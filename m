From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2] dt-bindings: Add vendor prefix for techstar
Date: Tue, 12 Feb 2019 16:57:44 +0530
Message-ID: <20190212112744.2332-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for techstar, known as
Shenzhen Techstar Electronics Co., Ltd. a known producer for LCD modules.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- rebase for master

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7eae7a95ab2a..a5ad57eaee20 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -397,6 +397,7 @@ tcl	Toby Churchill Ltd.
 technexion	TechNexion
 technologic	Technologic Systems
 tempo	Tempo Semiconductor
+techstar	Shenzhen Techstar Electronics Co., Ltd.
 terasic	Terasic Inc.
 thine	THine Electronics, Inc.
 ti	Texas Instruments
-- 
2.18.0.321.gffc6fa0e3
