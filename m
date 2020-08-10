Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529B0C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 21:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36575206B5
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 21:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgHJVwY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 17:52:24 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:45735 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgHJVwX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Aug 2020 17:52:23 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.homenet.telecomitalia.it (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6FADC40007;
        Mon, 10 Aug 2020 21:52:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 2/4] dt-bindings: media: ov5647: Document pwdn-gpios
Date:   Mon, 10 Aug 2020 23:55:41 +0200
Message-Id: <20200810215543.113206-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
References: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Document in dt-schema bindings for the ov5647 sensor the optional
'pwdn-gpios' property.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
index 1c1d94e805d6..9f76897f52e3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -26,6 +26,10 @@ properties:
     description: Reference to the xclk clock.
     maxItems: 1
 
+  pwdn-gpios:
+    description: Reference to the GPIO connected to the pwdn pin. Active high.
+    maxItems: 1
+
   port:
     type: object
     description: |-
@@ -56,6 +60,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
 
     i2c {
         #address-cells = <1>;
@@ -65,6 +70,7 @@ examples:
             compatible = "ovti,ov5647";
             reg = <0x36>;
             clocks = <&camera_clk>;
+            pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
 
             port {
                 camera_out: endpoint {
-- 
2.27.0

