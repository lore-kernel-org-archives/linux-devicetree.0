Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CBCC3F2C2
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 23:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3FA72469C
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 23:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be header.b="alW5i5CG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729812AbgB0XXp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 18:23:45 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38061 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729391AbgB0XXp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 18:23:45 -0500
Received: by mail-ed1-f68.google.com with SMTP id e25so1117660edq.5
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 15:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=maNRCkqEFToWwQhdLFKQW+0gZEdg0pLIXm9M/9EQEc8=;
        b=alW5i5CGU2Oyt2HGnJiqm5ubDg89nvcuWHJP+uXRIv3WOaaetFbwi1pvEqXAFqzhjg
         OmQhw7nP74oskjhkGUbP9XTZZwWy4Of588m7elc2t372EtgTorJdAIbwLQazxJCcneuD
         qS3BmxEXAXo2lkG1jqaXeT3Kgx50e7MBZE6Wx5qg0wBOfnJUDcYTuSddJxK2bO8A9Xdt
         2IBmEZJvMYuVIa56F7J2RC21pEtMqxZgs96Uj00HK1pRT6izgiBREYJ4u8QFNXZh2+yR
         SATTS6nRerKP/BttGdvsgZV15iNpMiQDABnXj7Lxqpw8Dgup6yUmKta995MuKrmTiAKa
         CK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=maNRCkqEFToWwQhdLFKQW+0gZEdg0pLIXm9M/9EQEc8=;
        b=Nv/O8exM08Op+xc8gafunI1n4BZ1oyUDyzDB2W8WG6rB6huiyswr7TraB7bG3eYWdK
         c6tYx0VeXYTYUG0PQqJCDBJTpNlv6RaXZzKGbCEJT6gfg6FNWPBPC9e1A6gIpT85Mjq4
         crienqeYYWBsnDK5lHU0JGoRU8VVZjwjSYA8FFj13LkJjzttCBLj0CIeCgc6sVDWukWe
         MGebAMOdtoRMtLolBZccvSIFIoa6GdPdJC3BfmV7AmyqwqhJzwks5TzbkchQqXaP0tDX
         luyC0ajzmzzvbjgLW9Fp6O+jqZNjclcYQvS4vJ8qTAt3t12shOM921es84ZojgT2wgGU
         o2fQ==
X-Gm-Message-State: APjAAAVSv2c19XO8BLucp8GC+1JdLkrWWvBUsxWDsVq1J98wQx6gN76r
        Px7K2I08Yf6eWiT3XiwAOZd5kg==
X-Google-Smtp-Source: APXvYqxcbQ3j/ddNm1PVQJsPX2xZ4IlHzLT7KAL90l8pQoCHC3RcVgmN6UTcSqqNpp/r3cfQ8CSfYA==
X-Received: by 2002:aa7:d2cf:: with SMTP id k15mr851197edr.299.1582845823518;
        Thu, 27 Feb 2020 15:23:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
        by smtp.googlemail.com with ESMTPSA id d16sm468117eds.18.2020.02.27.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 15:23:43 -0800 (PST)
From:   Charles-Antoine Couret <charles-antoine.couret@mind.be>
To:     alsa-devel@alsa-project.org
Cc:     Charles-Antoine Couret <charles-antoine.couret@mind.be>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2 V2] ASoC: tas5756m: Add DT binding document
Date:   Fri, 28 Feb 2020 00:23:27 +0100
Message-Id: <20200227232327.46309-3-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227232327.46309-1-charles-antoine.couret@mind.be>
References: <20200227232327.46309-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document the bindings for the tas5756m driver.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas5756m.yaml b/Documentation/devicetree/bindings/sound/tas5756m.yaml
new file mode 100644
index 000000000000..47be70f1633a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5756m.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+
+$id: "http://devicetree.org/schemas/tas5756m.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: TAS5756M audio codec Device Tree Bindings
+
+maintainers:
+  - Charles-Antoine Couret <charles-antoine.couret@mind.be>
+
+description: |
+  You can read datasheets there:
+  http://www.ti.com/lit/ds/symlink/tas5754m.pdf
+  http://www.ti.com/lit/ds/symlink/tas5756m.pdf
+
+  TAS5754M datasheet has a more complete datasheet about register mapping
+  which is common with TAS5756M.
+
+  Those devices have a programmable DSP whith several modes named hybridflow.
+  More details about it there: http://www.ti.com/lit/ug/slau577a/slau577a.pdf
+
+properties:
+  compatible:
+    enum:
+      - "ti,tas5756m"
+      - "ti,tas5754m"
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  "#sound-dai-cells":
+    const: 0
+
+  mute-gpios
+    maxItems: 1
+    description: GPIO wired to the mute pin.
+
+  ti,hybridflow
+    description: |
+      Select the HybridFlow DSP program.
+      If not supplied default DSP program is used instead.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 3, 4, 5, 6, 7, 8, 9]
+
+additionalProperties: false
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+examples:
+  - |
+    tas5756m: tas5756m@4c {
+        compatible = "ti,tas5756m";
+        reg = <0x4c>;
+        #sound-dai-cells = <0>;
+
+        ti,hybridflow = <6>;
+        mute-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+    };
-- 
2.24.1

