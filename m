Return-Path: <SRS0=DCRz=RF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:42251 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfCBORM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 2 Mar 2019 09:17:12 -0500
From: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] Input: ili210x - Add DT binding for the Ilitek ILI2117 touch controller
Date: Sat,  2 Mar 2019 15:17:03 +0100
Message-Id: <20190302141704.32547-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Olivier Sobrie <olivier@sobrie.be>, Philipp Puschmann <pp@emlix.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add DT binding for the Ilitek ILI2117 touch controller, which is yet
again a slightly different device in the ILI21xx family.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Olivier Sobrie <olivier@sobrie.be>
Cc: Philipp Puschmann <pp@emlix.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-input@vger.kernel.org
---
 Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
index b2a76301e632..dc194b2c151a 100644
--- a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
+++ b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
@@ -1,8 +1,9 @@
-Ilitek ILI210x/ILI251x touchscreen controller
+Ilitek ILI210x/ILI2117/ILI251x touchscreen controller
 
 Required properties:
 - compatible:
     ilitek,ili210x for ILI210x
+    ilitek,ili2117 for ILI2117
     ilitek,ili251x for ILI251x
 
 - reg: The I2C address of the device
-- 
2.19.2
