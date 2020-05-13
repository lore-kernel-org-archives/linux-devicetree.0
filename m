Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEE8CA90AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 12:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AC62206D6
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 12:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgEMMvh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 08:51:37 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:61055 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgEMMvh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 08:51:37 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A9A6440013;
        Wed, 13 May 2020 12:51:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@iki.fi,
        mchehab@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hyun Kwon <hyunk@xilinx.com>
Subject: 
Date:   Wed, 13 May 2020 14:54:45 +0200
Message-Id: <20200513125445.54132-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512223329.GA23701@bogus>
References: <20200512223329.GA23701@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Subject: [PATCH] fixup! dt-bindings: media: i2c: Add bindings for Maxima Integrated MAX9286

Temporary fixup to ease review. To be squashed into v10 if accepted.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

While fixing Rob's reported bug on v9 I realized thanks to a
dt_binding_check warning that the i2c-mux child nodes where under-specified.

This fixup epxands the i2c-mux child nodes description and updates the
example to match our currently-out-of-tree DTS files for GMSL platforms.

dt_binding_check still reports a warning:

Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@51: reg: [[81, 97]] is too short
Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@52: reg: [[82, 98]] is too short
Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@53: reg: [[83, 99]] is too short
Documentation/devicetree/bindings/media/i2c/maxim,max9286.example.dt.yaml: camera@54: reg: [[84, 100]] is too short

Which I was not able to silence.
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 86 +++++++++++++++++--
 1 file changed, 77 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index f9d3e5712c59..d9bd19caed2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -130,9 +130,7 @@ properties:
     description: |
       Each GMSL link is modelled as a child bus of an i2c bus
       multiplexer/switch, in accordance with bindings described in
-      Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer
-      device on the remote end of the GMSL link shall be modelled as a child
-      node of the corresponding I2C bus.
+      Documentation/devicetree/bindings/i2c/i2c-mux.txt.

     properties:
       '#address-cells':
@@ -141,7 +139,74 @@ properties:
       '#size-cells':
         const: 0

-  additionalProperties: false
+    patternProperties:
+      "^i2c@[0-3]$":
+        type: object
+        description: |
+          Child node of the i2c bus multiplexer which represents a GMSL link.
+          Each serializer device on the GMSL link remote end is represented with
+          an i2c-mux child node. The MAX9286 chip supports up to 4 GMSL
+          channels.
+
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+          reg:
+            description: The index of the GMSL channel.
+            maxItems: 1
+
+        patternProperties:
+          "^camera@[0-9]+":
+            type: object
+            description: |
+              The remote camera device, composed by a GMSL serializer and a
+              connected video source.
+
+            properties:
+              compatible:
+                description: The remote device compatible string.
+
+              reg:
+                description: |
+                  The I2C addresses to be assigned to the remote devices through
+                  address reprogramming. The number of entries depends on the
+                  requirements of the currently connected remote device.
+
+              port:
+                type: object
+
+                properties:
+                  endpoint:
+                    type: object
+
+                    properties:
+                      remote-endpoint:
+                        description: phandle to the MAX9286 sink endpoint.
+
+                    required:
+                      - remote-endpoint
+
+                    additionalProperties: false
+
+                required:
+                  - endpoint
+
+                additionalProperties: false
+
+            required:
+              - compatible
+              - reg
+              - port
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+    additionalProperties: false

 required:
   - compatible
@@ -220,11 +285,11 @@ examples:
           i2c@0 {
             #address-cells = <1>;
             #size-cells = <0>;
-
             reg = <0>;

             camera@51 {
-              reg = <0x51>;
+              compatible = "imi,rdacm20";
+              reg = <0x51 0x61>;

               port {
                 rdacm20_out0: endpoint {
@@ -241,7 +306,8 @@ examples:
             reg = <1>;

             camera@52 {
-              reg = <0x52>;
+              compatible = "imi,rdacm20";
+              reg = <0x52 0x62>;

               port {
                 rdacm20_out1: endpoint {
@@ -257,7 +323,8 @@ examples:
             reg = <2>;

             camera@53 {
-              reg = <0x53>;
+              compatible = "imi,rdacm20";
+              reg = <0x53 0x63>;

               port {
                 rdacm20_out2: endpoint {
@@ -273,7 +340,8 @@ examples:
             reg = <3>;

             camera@54 {
-              reg = <0x54>;
+              compatible = "imi,rdacm20";
+              reg = <0x54 0x64>;

               port {
                 rdacm20_out3: endpoint {
--
2.26.2

