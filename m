From: Michal Simek <monstr@monstr.eu>
Subject: [PATCH] dt-bindings: Add bitmain vendor prefix
Date: Wed,  6 Jun 2018 14:49:48 +0200
Message-ID: <20173c07cc538544c9e6780a8ef558b97a3fe2cb.1528289384.git.monstr@monstr.eu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, SZ Lin <sz.lin@moxa.com>
List-Id: devicetree@vger.kernel.org

Bitmain (https://www.bitmain.com) is a vendor of cryptocurrency
hardware.

Signed-off-by: Michal Simek <monstr@monstr.eu>
---

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 36003832c2a8..ddb52511a583 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -51,6 +51,7 @@ axentia	Axentia Technologies AB
 axis	Axis Communications AB
 bananapi BIPAI KEJI LIMITED
 bhf	Beckhoff Automation GmbH & Co. KG
+bitmain	Bitmain Technologies
 boe	BOE Technology Group Co., Ltd.
 bosch	Bosch Sensortec GmbH
 boundary	Boundary Devices Inc.
-- 
1.9.1
