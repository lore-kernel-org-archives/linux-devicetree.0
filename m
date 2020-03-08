Return-Path: <SRS0=ZTIy=4Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CAEC10DCE
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 14:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A1FF2084E
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 14:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be header.b="W8CEr9Wd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgCHOZe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Mar 2020 10:25:34 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46883 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCHOZe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Mar 2020 10:25:34 -0400
Received: by mail-ed1-f66.google.com with SMTP id y3so8791721edj.13
        for <devicetree@vger.kernel.org>; Sun, 08 Mar 2020 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wrkembjowAPTNsOgmMmMbhT9NlC7DKGZCBV+/iO4pc=;
        b=W8CEr9Wdvd0mRWjoVbyHUOkGYhfNrxw4QsJkGOvoABEaZqEmgBmZAXpXwi52O3hggG
         xX11TBHF75ZNCms5PAmRJEwa2YbIpkiUySspIwkRbAoOn/R2rco5Jly3uKU96QlYC8S8
         U4r409L8h5vyI/644DLc47/WfeslXDIkAdl6BvqBeGzSnmsjacpiLZRk9ZSulDEB1KGM
         8iLN7aILokK3Y0zuxGCEDm0DaU1EZXGi4tRCJyKxK7bf8BN1VQ++9QIgXEm2FE3esJzh
         jAYmNEH4blt/PbFXaMDyeHXEEM7+DJIAfNUobT/8TLvRJyMgWqL3zA+aHQd70xM1EGh7
         lThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wrkembjowAPTNsOgmMmMbhT9NlC7DKGZCBV+/iO4pc=;
        b=e9oYx6OxN78R/lSe4PSam35xuBhQ9NNU7YZi2oxssTGRCAHtuj/NR2aQuGVMYj54sE
         ZvI84fG+rEkTALvj55lfNRfgdrDn45qvhPYllBtc+jeFf+tEYBiahBMGhWm7/GNCZffE
         eD1VwGw5piZ0hoZbZ9Iw+znQTKgXI1ZkZiz6t98RfRGtIAGm9QI0+yjMf5XYo/uGkkjM
         WdAQ05awM2kKJGsldiQl8jw5d4rdEL/olAvV+HvVBvfzqEM9fDUXRomYPbcpTkH/+Xiw
         jw3QP+YXz6YBbTvhAgRVOlM+7k7dIXFvjHOiTVbV+Xgfff7CKde+5IQuWfTJVIIIEyHm
         5EIA==
X-Gm-Message-State: ANhLgQ161tQ2yahO44n68A2bVYjTPYGuMq/ItDr0HWXLijuJXYTPEV+K
        eUs8YABss2yayDQRLemDsCTH7w==
X-Google-Smtp-Source: ADFU+vsrefLqY+TOluOAuivj6Xz5IWCyG5feZz2qSRuMebyNATTfueplxWpg1aE11ns/1N2YIKlDwQ==
X-Received: by 2002:a50:ec0b:: with SMTP id g11mr5624884edr.80.1583677532617;
        Sun, 08 Mar 2020 07:25:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
        by smtp.googlemail.com with ESMTPSA id h20sm1736516edr.43.2020.03.08.07.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 07:25:32 -0700 (PDT)
From:   Charles-Antoine Couret <charles-antoine.couret@mind.be>
To:     alsa-devel@alsa-project.org
Cc:     Charles-Antoine Couret <charles-antoine.couret@mind.be>,
        devicetree@vger.kernel.org
Subject: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
Date:   Sun,  8 Mar 2020 15:25:09 +0100
Message-Id: <20200308142509.27765-7-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200308142509.27765-1-charles-antoine.couret@mind.be>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
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
index 000000000000..2fd4492c4bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5756m.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tas5756m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+  mute-gpios:
+    maxItems: 1
+    description: GPIO wired to the mute pin.
+
+  ti,hybridflow:
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

