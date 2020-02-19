Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F67C34050
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 16:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DBF220675
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 16:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Uc0tsC47"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgBSQQh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 11:16:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33423 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgBSQQg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 11:16:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id m10so723522wmc.0
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 08:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
        b=Uc0tsC47BaJeKfd4KzNsQc2dQXTzEw8wn8WAQTvg9GaYhQ+XL4GRBQy6qoOqYrWTsI
         Xhq1W4SawLW4FeBhdv3QBtpMRf+VHCyuFqybW0T00Y8dj4c/BNQQqnku4zpu1b37qODQ
         fEJD/cJ4M9Ad17f4GnDIJO1GCnfV91kyVB6iFsPQlFfFTUWMEMgSTobfXqu1u7o0LaN6
         KYuUUk7B3O8SLIiuJ13yplhm74KbwSNDcWDEMG+TeQDQAc34laenw0KmksTAatngio3N
         7ZyacehueKO5IMc8NfA4nMBZwX6Vj2Btv0XZV6XSvw3KPKn/hGabu+4pNpO7CLWPg7Fn
         v41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
        b=itLG053oT/JuyiLpahz4wZx3vOCXAzuukq74Ibi1KCHtJFkvDoByoXCX4HslaAVGmT
         cTBoKrleL1jT2BWxHvPHyxkKf3TEs9FpuPxR9HctndyoZaBkqfVntIUsDJT0yMBcjAKl
         IqVrGZloy+uGDhdVCZ1maRCtstYaFHghAJbYUh5Wt1VSOi7ZqSVOc474Pv1uFau2kFQ4
         xDDdk+xB0aMRVQ+io5OKJXSX3K0nnmRfrGniqIji/2FE8doNU03HR0Z310+cawKLaYZb
         IW73D5L7UHStgtg1Wskpb4OiE+yJZ3PSfglz0cvM1EOXLp4FIOc+cr3Xr/nTT0f20oQU
         0+gQ==
X-Gm-Message-State: APjAAAWsyhqdrUFtKtjXu68kEkeUOrE0LswFMdmvA1BUxM6mvOhPoXD1
        L0D+XHWeTw9hKMGHfMMPV18syw==
X-Google-Smtp-Source: APXvYqyxsijU5d9Vs4rJZhP2IlvQTVINyfHLXZAjIwR5PKz7AyNYQdmxrleEMtbffmdy05IniAkW0Q==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr10662910wmj.96.1582128993481;
        Wed, 19 Feb 2020 08:16:33 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id a22sm437140wmd.20.2020.02.19.08.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 08:16:32 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/2] ASoC: meson: add t9015 internal codec binding documentation
Date:   Wed, 19 Feb 2020 17:16:24 +0100
Message-Id: <20200219161625.1078051-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219161625.1078051-1-jbrunet@baylibre.com>
References: <20200219161625.1078051-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the DT binding documention of the internal DAC found in the Amlogic
gxl, g12a and sm1 SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,t9015.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
new file mode 100644
index 000000000000..b7c38c2b5b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T9015 Internal Audio DAC
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - const: amlogic,t9015
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/g12a-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
+
+    acodec: audio-controller@32000 {
+        compatible = "amlogic,t9015";
+        reg = <0x0 0x32000 0x0 0x14>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc CLKID_AUDIO_CODEC>;
+        clock-names = "pclk";
+        resets = <&reset RESET_AUDIO_CODEC>;
+    };
+
-- 
2.24.1

