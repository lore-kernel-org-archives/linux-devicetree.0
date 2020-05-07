Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBF4C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 21:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCE32208D6
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 21:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zqd3M8uj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgEGVrR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 17:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgEGVrC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 17:47:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADAEC05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 14:47:01 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k12so8183364wmj.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QwFcGxpDmnR9Gjl2d/B8qf+n7pZq43GAcPc3+BCIIos=;
        b=Zqd3M8ujrUsKmU1qmBvjrfndEAJaq7s4r13grgk7WfShoPK03iBafHgZGfH7hkU8Wg
         1DhXx6ibr+A7ogAp23bnHNfkbGJBIhx+sAiIv2x8R5HRWeCeXhP9reG5sxIer5EuzAV5
         tUg2wcmnW6jiUWtMbH9MW/7N7rcHq/wuE4ciujg0LeBRGag+wl0eG4T1AbsZJPbPijLo
         pY2kt3hPpIpFg2z3LhIY0qo7eLNfBmTmLJuwsxE7O9eNaibEEOxWDTBLbDMmyAKnRmWY
         wZ4rTq3uiN3FAKS9M+QYpXiwBXPFG3E3t5UkBRP52jrzK8PJE/iYGg4XM4L8hDGjnaKv
         mnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwFcGxpDmnR9Gjl2d/B8qf+n7pZq43GAcPc3+BCIIos=;
        b=N/uyW2bZMt0LrbqpA0ITqUkvp0z7phb5bHyfTDGL5n25GyLyEtfmjOtc2+gWBdHqwM
         +hRXVWhjDeC8Bs6frbItgajBnOxO841O45Ek73xQgbM+NmBGh5AsmHp6D44dP7hJe6dD
         2ECxvDA1eIrHmde4ky2HZCvd97kHFlZYfE0paV2P2323aQulAtPGq9xQcqSfEQ/4WbzT
         XvVz+mTM/jqc1+Yhvb3rwdMmwKxph5H/trLKf69qBzGWUb7hg4HgyURRsm5fKVW4gOjg
         DJBFqRgKqdMQPa8DzDSbjUiqy7H1j5fXLQCuNRxu+mFT1q4kSQfXz2JIodSfmS1MLKbc
         Bz9Q==
X-Gm-Message-State: AGi0PuZZwjwF2RN2mdIiFBGWn81A84uEmlylUgDmNNgqzIFoeGeFSwoU
        P/hibOhOpWgMcVV3n/o1lGrdxw==
X-Google-Smtp-Source: APiQypIe57ikdXgULkZNSPpYK4kNU1OzkL6pxob1CcDDLeam4Q9pN4bmvma4mjnnMwnIXj7ATrBOjw==
X-Received: by 2002:a1c:4085:: with SMTP id n127mr13358271wma.163.1588888020384;
        Thu, 07 May 2020 14:47:00 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a10sm6653538wrp.0.2020.05.07.14.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:46:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: usb: Add TI tps6598x device tree binding documentation
Date:   Thu,  7 May 2020 22:47:32 +0100
Message-Id: <20200507214733.1982696-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507214733.1982696-1-bryan.odonoghue@linaro.org>
References: <20200507214733.1982696-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add device tree binding documentation for the Texas Instruments tps6598x
Type-C chip driver.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/usb/ti,tps6598x.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
new file mode 100644
index 000000000000..8eaf4b6c4735
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/ti,tps6598x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments 6598x Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Texas Instruments 6598x Type-C Port Switch and Power Delivery controller
+
+properties:
+  compatible:
+    enum:
+      - ti,tps6598x
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: irq
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps6598x: tps6598x@38 {
+            compatible = "ti,tps6598x";
+            reg = <0x38>;
+
+            interrupt-parent = <&msmgpio>;
+            interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "irq";
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&typec_pins>;
+
+            typec_con: connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                port {
+                    typec_ep: endpoint {
+                        remote-endpoint = <&otg_ep>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.25.1

