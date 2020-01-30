Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AA9C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 20:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42BC220674
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 20:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="O23UBWKN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbgA3UjJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 15:39:09 -0500
Received: from mxa1.seznam.cz ([77.75.78.90]:2110 "EHLO mxa1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727592AbgA3UjJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 15:39:09 -0500
Received: from email.seznam.cz
        by email-smtpc14a.ko.seznam.cz (email-smtpc14a.ko.seznam.cz [10.53.11.165])
        id 5f612a08046f7e615ec8e656;
        Thu, 30 Jan 2020 21:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1580416729; bh=V6HBTKotURyKJ2paipIoehYbXxJf+uIZbTmi1MmUXEw=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=O23UBWKNXJpRbQBPpgaNJ7/G5VCv+fi6FvTC2QjGuuSwnBNeKvlfgS9sU26EZ0Qed
         QcSTZGrmaG6SJP6GcgsniidJiAO5TwKid1M8LU6WwpG3p14C+z2YO3qZ4pJeVvmNmn
         x28WbjRQN4WwwKh0476p5JLHan9YW7/Y+qgarZBg=
Received: from localhost.localdomain (unknown [212.69.128.228])
        by email-relay10.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Thu, 30 Jan 2020 21:38:46 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v3 1/2] dt-bindings: display/panel: add bindings for S6E88A0-AMS452EF01
Date:   Thu, 30 Jan 2020 21:35:54 +0100
Message-Id: <20200130203555.316-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
use of their S6E88A0 controller.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
Hi,
I recall now that tabs cause a syntax error in yaml, should be easy to check 
in checkpatch.pl?
I hope there are no more embarassing oversights left.

Changes in v2: use yaml format for the binding
Changes in v3: fix oversights too embarassing to admit here
---
 .../panel/samsung,s6e88a0-ams452ef01.yaml     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
new file mode 100644
index 000000000000..298fc9a78297
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams452ef01#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode DSI controller
+
+maintainers:
+  - Michael Srba <Michael.Srba@seznam.cz>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e88a0-ams452ef01
+  reg: true
+  reset-gpios: true
+  vdd3-supply:
+     description: core voltage supply
+  vci-supply:
+     description: voltage supply for analog circuits
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply
+  - vci-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel@0 {
+            reg = <0>;
+
+            compatible = "samsung,s6e88a0-ams452ef01";
+
+            vdd3-supply = <&pm8916_l17>;
+            vci-supply = <&reg_vlcd_vci>;
+            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.24.0

