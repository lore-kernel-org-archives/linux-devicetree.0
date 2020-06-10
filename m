Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EA5C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 07:57:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 497FB2072F
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 07:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l7UaQVMn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgFJH5I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Jun 2020 03:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgFJH5H (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Jun 2020 03:57:07 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144B3C03E96B
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 00:57:07 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b16so741984pfi.13
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nepAZtogo26DJ5bnJNOqagPxZ153pFUZT84gVur7i1g=;
        b=l7UaQVMnylYytayhT9Eb+iavCxbX/5f95oxWdpZ8MB/cBgS3UEVlUx3AJCX3joPyoz
         +7IQB7Dv/vu2CkigmKkgIhOpaZkp3z6bpNcaqNmgyVeOty8Qsvb9g/z9nDz7o3yJZjor
         QRQk6XHP4jCZujdPeHhoMb9MuJD8df1h5zvls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nepAZtogo26DJ5bnJNOqagPxZ153pFUZT84gVur7i1g=;
        b=tF4/4UzthmL5fCMZK+tAMoha/J3VwNQ7ggDx4cG/ocLy/c05lXrVUovOdaHEnPd7+4
         +ueHUMVDnKdjIKW6i4gBfzss3xgorCZfHdY2kfp8G8/lkaimmArF5VUG9wbrnAKYlg13
         Jy3CTcGqVre6eSCQawrEPpsoMGK6cwwSeINkyUo4ukdnYQ00/rUqiK+lXwj8zNO7temq
         LHlwU7HAolayi6T0w8/xEO/r1ZFtkpLV6+2Nn5NHC2zKYiGjCMvHbvSwZCZ6B1vqwJv8
         gPBYUuXWrX/d9iWlrI0Q89/qikBbkv9a9b79jf7cQ2JavlHi79c1g7PjHg20Du54YYan
         8c6A==
X-Gm-Message-State: AOAM5318Qwko7AuW5XQQYaJxBvPmcIdHwifRcSdvCd0hAhWVBSmG1g9b
        +6DD+koAa3Cix+oEHSRLlZA+rw==
X-Google-Smtp-Source: ABdhPJyFpEwPpz/sR+w73vumtKtcEL6hgugUW6e0Iv9krBz/6Jpzmzy1+Alke8L/jmb6ivd2vbMtqg==
X-Received: by 2002:a65:640c:: with SMTP id a12mr1624521pgv.408.1591775826624;
        Wed, 10 Jun 2020 00:57:06 -0700 (PDT)
Received: from pihsun-glaptop.lan (180-176-97-18.dynamic.kbronet.com.tw. [180.176.97.18])
        by smtp.googlemail.com with ESMTPSA id y26sm12035850pff.26.2020.06.10.00.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 00:57:05 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR
        FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH v2 1/2] dt-bindings: regulator: Add DT binding for cros-ec-regulator
Date:   Wed, 10 Jun 2020 15:56:43 +0800
Message-Id: <20200610075649.209852-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200610075649.209852-1-pihsun@chromium.org>
References: <20200610075649.209852-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT binding documentation for cros-ec-regulator, a voltage regulator
controlled by ChromeOS EC.

Changes from v1:
* Change compatible string to google,regulator-cros-ec.
* Use reg property in device tree.
* Change license for dt binding according to checkpatch.pl.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 .../bindings/regulator/cros-ec-regulator.yaml | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/cros-ec-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/cros-ec-regulator.yaml b/Documentation/devicetree/bindings/regulator/cros-ec-regulator.yaml
new file mode 100644
index 000000000000..e677614dcdf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/cros-ec-regulator.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/cros-ec-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC controlled voltage regulators
+
+maintainers:
+  - Pi-Hsun Shih <pihsun@chromium.org>
+
+description:
+  Any property defined as part of the core regulator binding, defined in
+  regulator.yaml, can also be used.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: google,regulator-cros-ec
+
+  reg:
+    maxItems: 1
+    description: Identifier for the voltage regulator to ChromeOS EC.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    cros-ec {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      regulator@0 {
+        compatible = "regulator-cros-ec";
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <3300000>;
+        reg = <0>;
+      };
+    };
+...
-- 
2.27.0.278.ge193c7cf3a9-goog

