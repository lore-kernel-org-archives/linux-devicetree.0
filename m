Return-Path: <SRS0=zDJw=QF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from rmisp-mx-out4.tele.net ([194.208.23.39]:35529 "EHLO
        rmisp-mx-out4.tele.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbfA2KuF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Jan 2019 05:50:05 -0500
From: Matthias Fend <matthias.fend@wolfvision.net>
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: st1232: reference common DT bindings
Date: Tue, 29 Jan 2019 11:44:13 +0100
Message-Id: <1548758654-27153-1-git-send-email-matthias.fend@wolfvision.net>
Sender: devicetree-owner@vger.kernel.org
To: linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: dmitry.torokhov@gmail.com, martin.kepplinger@ginzinger.com, Matthias Fend <matthias.fend@wolfvision.net>
List-ID: <devicetree@vger.kernel.org>

Add a reference to common touchscreen bindings which are also partly
supported.

Signed-off-by: Matthias Fend <matthias.fend@wolfvision.net>
---
 Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt b/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
index 64ad48b..f3046e7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
@@ -8,6 +8,8 @@ Required properties:
 Optional properties:
 - gpios: a phandle to the reset GPIO
 
+For additional optional properties see: touchscreen.txt
+
 Example:
 
 	i2c@00000000 {
-- 
2.7.4
