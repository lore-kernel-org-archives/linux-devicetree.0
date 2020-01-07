Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D213C33CA1
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 13:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F30924656
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 13:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kT/gskwV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgAGNJH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 08:09:07 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:40238 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbgAGNJH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 08:09:07 -0500
Received: by mail-wr1-f48.google.com with SMTP id c14so53838223wrn.7
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 05:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nT9BtMpP3rVSAKnjxKAWmSKBNURpP6V+aXle8yg5Oj0=;
        b=kT/gskwVQaYtPacWxisTNOdjeZ02Fchdla9uUAdtL+pjp25BP78f5U9Qmfzyz1p5Sh
         ew1s+3kig4PWGT0vapCJGh6o73uU/2MAgsyS6FzbGJV0/HyaJjnTJz/NtCvNMCshig0j
         X2NBmFHuKqXGWro+MC4e/CLTJRNWjN/Is3fWOouplWxAyfh7LIQCQPhgdGRnsabhC/5p
         L+FogJDvGmAy4+o0uhqcuyHIMwJVbYMTvjZKf5aXelqTB5XtBAZi+yhhYjE3SZ0m37XJ
         8T9Zs+k3+k7TfZ7gp0vu+/INSQ/evd0zhppLA6XgUcwV0AhNjjxyZEUEqU7nLrKf+wcs
         3hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nT9BtMpP3rVSAKnjxKAWmSKBNURpP6V+aXle8yg5Oj0=;
        b=OUh8DG29SIZwzS6j0out9pTTnTs0ENZjrpHZIgXhn83zKw2rZ/NkGuly7evjvJnAe5
         rzJcgvdPJFqZwJYayuZKJYhGWP7jWZ5DrFChD3P+4EIc1y2kVEHrzAZAcld0R51XoZpG
         29t1ZO0Aojyok1by+7iV9GX6H3JN4deBHKF+bLQCaw81zdNtf8r6NpElJL2T70XzigmP
         HJbQmIsOOTXManEo3eFUhxTZDUd8NM/9Xi4Yvp8T1mydMj0o7jXSgzAtUT2iy3+7mVr1
         mDmYPYAi5aEoUY71ERfj0jDKmJyh5xvo2jVTNUk1tKZfKrcHrU2r+C95IwPDNIxmulmc
         rjUA==
X-Gm-Message-State: APjAAAU6R1aKLij/B3z49tRXR/jZ9a5boUnvMBpgGURX19yNS6VqN7y9
        JAC2HP9fdtaE9eYxDC3NzIPdww==
X-Google-Smtp-Source: APXvYqxttENx/9O3T41IE34zb2g4P0hFFOZO5gZe8gaTKfCLyHIx/ob0InWWWjitUCuimNSjGRWkZw==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr105006068wrr.309.1578402545458;
        Tue, 07 Jan 2020 05:09:05 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b18sm7287035wru.50.2020.01.07.05.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 05:09:04 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: gpio: wcd934x: Add bindings for gpio
Date:   Tue,  7 Jan 2020 13:08:43 +0000
Message-Id: <20200107130844.20763-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
References: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
gpio controller to control 5 gpios on the chip. This patch adds
required device tree bindings for it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
new file mode 100644
index 000000000000..32a566ec3558
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/qcom,wcd934x-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
+  gpio controller to control 5 gpios on the chip.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9340-gpio
+      - qcom,wcd9341-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    wcdgpio: gpio@42 {
+        compatible = "qcom,wcd9340-gpio";
+        reg = <0x042 0x2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.21.0

