Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83528C10F29
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 15:37:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E8DB21D56
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 15:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YvbxzOBb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgCIPhG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 11:37:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35368 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgCIPhF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 11:37:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id r7so11809206wro.2
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ocG6zPRQYNwCXlJ7RbhAtutb/yhKkjjblU5eUFjRhZo=;
        b=YvbxzOBb6sutSusHp/5ZTutKfCdwTphBBiqrr5zu/6InxASvvH/cTNr3yhBqsr3n7f
         1VWZBYPT8LHsrZ8mdsQpsfG0K/aEOu56zFeKJrTgljXPbDoa/HVxCFATarHr7DvQkQTd
         ocqxPWhdzskbt4/1oY0HJXxwXxviK2HtkqM43XTj1C3b7v7lmiVJ+/Ue4xMRKCFRAQDq
         CJRAcH4TvWzt2ztmaWMo40XBShyVZdkJh2ZDqolODqx+UG30Jgjd5SHEkrvtuFbPWqeV
         tL9exhRzhKgt3Kx2jP8IMDFqHVA6OBfBvmbqJ3oTDbuN2L+m9AAgrQ8XAZdtQLvBAWyd
         hkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ocG6zPRQYNwCXlJ7RbhAtutb/yhKkjjblU5eUFjRhZo=;
        b=VzL6nBrnxriwRZGBMhT1PbdaDSHnzrb01CEwftv2QanxyE8vOI07BQQ+Z8g2TtCQGc
         euf1NVnf+7AKhmQh5NtmiUcBS9f5h7PbC3pvhsZ1xcMSLygyy41NA9Qn2ZrPyRSBQNoN
         OqoGnxLmEB8yDi7QPLVMxBwNHEIKVkys5l0RZt8sQp1HiDtGJ3hxxruM2RJ8cBLC3Co8
         Ru5vt4iAU2YQVjAoqsKA+Qo0/98tpSD4FaGLC6O6w/7WuBXO4wfyzeJSzrmMM7H5NN1d
         jtU0jGab/sTu9NSCArRYOdsqDRnwUg0dyE5fVKl8T/2wdE8ftgQu1l6LTASu2lPWRREg
         uU1g==
X-Gm-Message-State: ANhLgQ3MpQ9MD70pBsmDaD7lumPiCYI+jX3mikCw/h/8+Afj9vkB+y3c
        Uzn75enzgI/JvMHqgIWtebJ3Tg==
X-Google-Smtp-Source: ADFU+vv79+VIBwAkcUOpUZI0X6WKqKLh4fUWWg8+e+2XJ3gRw+Kk489e+Ks4NC9Dmx8+qKX+K0cUzQ==
X-Received: by 2002:adf:df0f:: with SMTP id y15mr3632400wrl.420.1583768223202;
        Mon, 09 Mar 2020 08:37:03 -0700 (PDT)
Received: from localhost.localdomain (232.240.140.77.rev.sfr.net. [77.140.240.232])
        by smtp.gmail.com with ESMTPSA id h17sm63426792wro.52.2020.03.09.08.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:37:02 -0700 (PDT)
From:   Phong LE <ple@baylibre.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com
Cc:     Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, mripard@kernel.org, sam@ravnborg.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: display: bridge: add it66121 bindings
Date:   Mon,  9 Mar 2020 16:36:53 +0100
Message-Id: <20200309153654.11481-3-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309153654.11481-1-ple@baylibre.com>
References: <20200309153654.11481-1-ple@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the ITE bridge HDMI it66121 bindings.

Signed-off-by: Phong LE <ple@baylibre.com>
---
 .../bindings/display/bridge/ite,it66121.yaml  | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
new file mode 100644
index 000000000000..f546c0b5a465
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE it66121 HDMI bridge Device Tree Bindings
+
+maintainers:
+  - Phong LE <ple@baylibre.com>
+
+description: |
+  The IT66121 is a high-performance and low-power single channel HDMI
+  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
+  to DVI 1.0 specifications.
+
+properties:
+  compatible:
+    const: ite,it66121
+
+  reg:
+    maxItems: 1
+    description: base I2C address of the device
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active low reset
+
+  vrf12-supply:
+    maxItems: 1
+    description: Regulator for 1.2V analog core power.
+
+  vcn33-supply:
+    maxItems: 1
+    description: Regulator for 3.3V digital core power.
+
+  vcn18-supply:
+    maxItems: 1
+    description: Regulator for 1.8V IO core power.
+
+  interrupts:
+    maxItems: 1
+
+  pclk-dual-edge:
+    maxItems: 1
+    description: enable pclk dual edge mode.
+
+  port:
+    type: object
+
+    properties:
+      endpoint:
+        type: object
+        description: |
+          Input endpoints of the bridge.
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vrf12-supply
+  - vcn33-supply
+  - vcn18-supply
+  - interrupts
+  - port
+
+examples:
+  - |
+    i2c6 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      it66121hdmitx: it66121hdmitx@4c {
+        compatible = "ite,it66121";
+        pinctrl-names = "default";
+        pinctrl-0 = <&ite_pins_default>;
+        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
+        vcn18-supply = <&mt6358_vcn18_reg>;
+        vrf12-supply = <&mt6358_vrf12_reg>;
+        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
+        interrupt-parent = <&pio>;
+        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
+        reg = <0x4c>;
+        pclk-dual-edge;
+
+        port {
+          it66121_in: endpoint {
+            remote-endpoint = <&display_out>;
+          };
+        };
+      };
+    };
-- 
2.17.1

