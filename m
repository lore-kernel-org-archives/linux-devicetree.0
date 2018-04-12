From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] doc: Add vendor prefix for Kaohsiung
Date: Thu, 12 Apr 2018 16:34:01 +0200
Message-ID: <20180412143401.6433-1-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

The 'kao' entry has been added to vendor-prefixes.txt to indicate
products from Kaohsiung Opto-Electronics Inc.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8ff7eadc8bef..f995a876d2cc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -184,6 +184,7 @@ khadas	Khadas
 kiebackpeter    Kieback & Peter GmbH
 kinetic Kinetic Technologies
 kingnovel	Kingnovel Technology Co., Ltd.
+koe	Kaohsiung Opto-Electronics Inc.
 kosagi	Sutajio Ko-Usagi PTE Ltd.
 kyo	Kyocera Corporation
 lacie	LaCie
-- 
2.11.0
