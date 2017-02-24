From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 11/17] dt-bindings: Add vendor prefix for uCRobotics
Date: Fri, 24 Feb 2017 04:40:49 +0100
Message-ID: <20170224034055.18807-12-afaerber@suse.de>
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

Cc: 96boards@ucrobotics.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2: unchanged
 
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 64f8469..a89dbab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -320,6 +320,7 @@ tronfy	Tronfy
 tronsmart	Tronsmart
 truly	Truly Semiconductors Limited
 tyan	Tyan Computer Corporation
+ucrobotics	uCRobotics
 udoo	Udoo
 uniwest	United Western Technologies Corp (UniWest)
 upisemi	uPI Semiconductor Corp.
-- 
2.10.2
