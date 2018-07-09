Return-Path: <SRS0=djlV=JZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38948 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933537AbeGIRrU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Jul 2018 13:47:20 -0400
Received: by mail-ed1-f67.google.com with SMTP id w14-v6so14581509eds.6
        for <devicetree@vger.kernel.org>; Mon, 09 Jul 2018 10:47:19 -0700 (PDT)
From: Anthony Brandon <anthony@amarulasolutions.com>
Subject: [PATCH v2 1/4] dt-bindings: sound: wm8994: document wlf,spkmode-pu property
Date: Mon,  9 Jul 2018 19:46:43 +0200
Message-Id: <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
In-Reply-To: <20180709160631.GU18740@imbe.wolfsonmicro.main>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
Cc: Anthony Brandon <anthony@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

Add the wlf,spkmode-pu property to control the Speaker Mode pull-up from
the device tree.

Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
 Documentation/devicetree/bindings/sound/wm8994.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
index 4a9dead..b74a221 100644
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ b/Documentation/devicetree/bindings/sound/wm8994.txt
@@ -57,6 +57,9 @@ Optional properties:
 
   - wlf,ldoena-always-driven : If present LDOENA is always driven.
 
+  - wlf,spkmode-pu : If present enable the internal pull-up resistor on
+    the SPKMODE pin.
+
 Example:
 
 wm8994: codec@1a {
-- 
2.7.4

