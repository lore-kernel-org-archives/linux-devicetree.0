Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B274EC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 18:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98402204EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 18:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391605AbgHQSq4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 14:46:56 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:47963 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388035AbgHQPzo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 11:55:44 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D6271240012;
        Mon, 17 Aug 2020 15:55:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
Date:   Mon, 17 Aug 2020 17:59:10 +0200
Message-Id: <20200817155910.255883-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
References: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document endpoint properties for the parallel bus type and
add them to the example.

Specify a few constraints:
- If the bus type is BT.656 no hsync or vsycn polarities can be
  specified.
- If the bus width is 10 bits, not data-shift can be applied.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov772x.yaml | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
index 75dad40f70cc..3fad5dffd19a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
@@ -50,9 +50,47 @@ properties:
           bus-type:
             enum: [5, 6]
 
+          bus-width:
+            enum: [8, 10]
+            default: 10
+
+          data-shift:
+            enum: [0, 2]
+            default: 0
+
+          hsync-active:
+            enum: [0, 1]
+            default: 1
+
+          vsync-active:
+            enum: [0, 1]
+            default: 1
+
+          pclk-sample:
+            enum: [0, 1]
+            default: 1
+
           remote-endpoint:
             description: A phandle to the bus receiver's endpoint node.
 
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 6
+            then:
+                properties:
+                  hsync-active: false
+                  vsync-active: false
+
+          - if:
+              properties:
+                bus-width:
+                  const: 10
+            then:
+                properties:
+                  data-shift:
+                    const: 0
         required:
           - bus-type
 
@@ -82,6 +120,11 @@ examples:
             port {
                 ov772x_0: endpoint {
                     bus-type = <5>;
+                    vsync-active = <0>;
+                    hsync-active = <0>;
+                    pclk-sample = <0>;
+                    bus-width = <8>;
+                    data-shift = <0>;
                     remote-endpoint = <&vcap1_in0>;
                 };
             };
-- 
2.27.0

