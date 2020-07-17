Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D9C433F8
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FE382067D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgGQNZw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 09:25:52 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50569 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgGQNZv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 09:25:51 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A7B031C0012;
        Fri, 17 Jul 2020 13:25:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/13] dt-bindings: media: ov5640: Require ep properties
Date:   Fri, 17 Jul 2020 15:28:52 +0200
Message-Id: <20200717132859.237120-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that the bus-type property has been made mandatory for
the ov5640 bindings, use the property value to mark endpoint
properties as required depending on the data interface in use.

Mark as 'required' all the properties that were defined as required
in the original bindings in textual form. Adjust the example to
comply with validation requirement but do not update the existing
users as most of the required properties will be demoted in the
next patches.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov5640.yaml | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 16e6c2dc629a..8fd54575a1db 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -110,9 +110,40 @@ properties:
           pclk-sample:
             enum: [0, 1]
 
-        required:
-          - remote-endpoint
-          - bus-type
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 4
+            then:
+                properties:
+                  bus-width: false
+                  data-shift: false
+                  hsync-active: false
+                  vsync-active: false
+                  pclk-sample: false
+                required:
+                  - remote-endpoint
+                  - bus-type
+                  - clock-lanes
+                  - data-lanes
+
+          - if:
+              properties:
+                bus-type:
+                  const: 5
+            then:
+              properties:
+                clock-lanes: false
+                data-lanes: false
+              required:
+                - remote-endpoint
+                - bus-type
+                - bus-width
+                - data-shift
+                - hsync-active
+                - vsync-active
+                - pclk-sample
 
     additionalProperties: false
 
@@ -179,6 +210,10 @@ examples:
                     remote-endpoint = <&parallel_from_ov5640>;
                     bus-type = <5>;
                     bus-width = <10>;
+                    data-shift = <0>;
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    pclk-sample = <1>;
                 };
             };
         };
-- 
2.27.0

