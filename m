Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313D0C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 01:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04E5324658
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 01:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raMTtuMO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbfLLBmw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 20:42:52 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:42870 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfLLBmo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 20:42:44 -0500
Received: by mail-pl1-f179.google.com with SMTP id x13so317732plr.9
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 17:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d5IhBp23ryMELmIbYMLe3sqyK/4LNM7fr/2bl3WTuCg=;
        b=raMTtuMOBRn5KhhTiB2f+cKZAxr9j94dux8XwBg+AdQkCEszcB2OukPcmMasMfVQ06
         obOieKjaUu1K6HpjLXsqBa8lKtiiUbw9JKGzh1vTkCJR9L4im0LQY6BuNMr5ET9fqipd
         NbyMlxiNyOUaan4utvYpFBN4yr7w+UxPKgbkXFLyK6HxJnuutbTleFouaTh9nevPuXUQ
         nbIlbU5Wc6+YzMdLxUN01dtD7Z6Zs0TwmqTLfw+zQx8+mWebDDRTS93U/2fmuBPbC0Gy
         A9F5wrvWUQDpg+Ixnzo0cMRkcfHHIALCeLm/WJUdzdL0BkxyF7vkJgeRMyh+5iuytXHU
         09Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d5IhBp23ryMELmIbYMLe3sqyK/4LNM7fr/2bl3WTuCg=;
        b=YnQmd9XYa2ombcJRNWZpXJBYiGaNObDNWH1Ko9yw9eq1GaXTjuAxIZbnXzWh7yAWC2
         ob5lJ5qPDuO/ac6itWczxlvIv8S7oY/w3Mz8i16k7kxu1fomIMEDuqBw9qm46soRV5jx
         h/WqFsk84BM2c0zHkdcyo67G5WifcFeadPFJOFSkic9ZVX1Wf8ZbTP8IRfm51Gama8X/
         CHvjMniTuzrHTYdxKbtnW/WZtvIdFRCOGQ8T7jB6zqA0iaFWFfzpa93lXd6KxPdtF7dr
         twhJoHqUpjHpTOMNtYJxGKcbdtcwOgyZM1a4cMaCd+TlC2gO7jH3ZL53SJKeZQPvKWis
         61Wg==
X-Gm-Message-State: APjAAAV6Wo9tR0ucQrKWvvQXcwreJ3PXXmwnP0kwvuiPKKGgBZZPlW2C
        x1Ti624tQIA3iJJSiccRmFsIqNGl/LI=
X-Google-Smtp-Source: APXvYqx4StIFuAQtmNTyT3ogARV1ggychWzi6oW+9zl7DfM3kHg2TvXG6rV3Qqhf7Sfk/eBtLVc2yw==
X-Received: by 2002:a17:902:d883:: with SMTP id b3mr6353801plz.231.1576114963862;
        Wed, 11 Dec 2019 17:42:43 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:43 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH v7 7/8] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date:   Thu, 12 Dec 2019 01:42:32 +0000
Message-Id: <20191212014233.32799-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds binding documentation to support usb hub and usb
data role switch of Hisilicon HiKey960 Board.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Reworked as usb-role-switch intermediary

v7: Switched over to YAML dt binding description
---
 .../bindings/misc/hisilicon-hikey-usb.yaml    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml

diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
new file mode 100644
index 000000000000..1fc3b198ef73
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Linaro Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/misc/hisilicon-hikey-usb.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: HiKey960 onboard USB GPIO Hub
+
+maintainers:
+  - John Stultz <john.stultz@linaro.org>
+
+description: |
+  Supports the onboard HiKey960 USB GPIO hub, which acts as a
+  role-switch intermediary to detect the state of the USB-C
+  port, to switch the hub into dual-role USB-C or host mode,
+  which enables the onboard USB-A host ports.
+
+  Schematics about the hub can be found here:
+    https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf
+
+properties:
+  compatible:
+    items:
+      - const: hisilicon,gpio_hubv1
+
+  typec-vbus-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the typec-vbus gpio
+
+  otg-switch-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the otg-switch gpio
+
+  hub-vdd33-en-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the hub 3.3v power enablement gpio
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch.
+
+  port:
+    description: |
+      any connector to the data bus of this controller should be modelled
+      using the OF graph bindings specified, if the "usb-role-switch"
+      property is used. Note for this driver, two ports are supported,
+      the first being the endpoint that will be notified by this driver,
+      and the second being the endpoint that notifies this driver of a
+      role switch.
+
+
+required:
+  - compatible
+  - typec-vbus-gpios
+  - otg-switch-gpios
+  - hub-vdd33-en-gpios
+  - usb-role-switch
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    hisi_hikey_usb: hisi_hikey_usb {
+        compatible = "hisilicon,gpio_hubv1";
+        typec-vbus-gpios = <&gpio25 2 GPIO_ACTIVE_HIGH>;
+        otg-switch-gpios = <&gpio25 6 GPIO_ACTIVE_HIGH>;
+        hub-vdd33-en-gpios = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+        usb-role-switch;
+
+        port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hikey_usb_ep0: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&dwc3_role_switch>;
+            };
+            hikey_usb_ep1: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&rt1711h_ep>;
+            };
+        };
+    };
-- 
2.17.1

