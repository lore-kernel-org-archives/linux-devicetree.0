Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DF4C3B18B
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C10A3218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZCJgo/bd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgBMPwS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 10:52:18 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:43258 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729999AbgBMPwR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 10:52:17 -0500
Received: by mail-wr1-f49.google.com with SMTP id r11so7262265wrq.10
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 07:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T1g855CS59jrh8SfK06mUR/Pthrs1DKdWIhgcvf/5RA=;
        b=ZCJgo/bdkSCVvMzBckcPAr7Bb2qUBTV679cow4tumi6A34TqMO1khsOmJCqlpE3nf8
         NPBMErlh4gnrGnDpouHkhd67f11Wvf0kKseO1gKmknSUECRbCnR2xq3o50SnIhHgtWyH
         k9csymi780aSj777AIavG5nAxHMkIdK93Mno2DRvf1KdEkgTPJ21Xyix/Fk/pfXrJYpy
         HR6F8R1KUjG7RVfDkiwflbTIBu9x7BEF6lqZls/320swiS10Ha+LUVWS69okKa3aV/2i
         yE6WdHxy0B0vCcoffHyU1oeIC7pc5Nqty+jjF7NFNsf/h4diCTBL6UJs/ieQEq7fpr81
         21Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T1g855CS59jrh8SfK06mUR/Pthrs1DKdWIhgcvf/5RA=;
        b=cXA11jIKi1UTONzgKm/69Mjp3jSw3i1PMa3r/ffq85BdypKhDKctZqE7/v//+RdQNg
         /HRtD4SnRhS/Alu+xsnA4E02ZaqQRYUNg5j6/J+zFRjgwPWbIrN0Ep4htrvaDRvFRnPf
         SKYR44OD8xWlCorkqUUZDN7QQLetJgmd3k6DTOV2MRP8tN/lR9/SELGuMOgYaTLCOHTL
         5XtULVBmpZeNDHnmeXywqwlfRjENm+iFBD0WrIOxCsHcPJK1K9fwIzcJ25shFLfE54JE
         yNR5bi0RO+huTbPADDlTEJ1gbjTFkTfExo8rKViUf+IrUkr02ov0HoXxUhKYFT2ee9gf
         FpMQ==
X-Gm-Message-State: APjAAAVaVU/ijYx/LSJdfRLljdhCypHsyvohm4sfVCg8iDy/yF8z0bua
        x1hX9UUDo/WMEUnWI/40VLHlIw==
X-Google-Smtp-Source: APXvYqzX5hIDcuU5EdxX0EcpHWnkLsb/NVSMa6VEMThGZDOYBjYlw1628Xp6uOcnr1jk2AWjKEL9hA==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr21740714wrm.89.1581609135767;
        Thu, 13 Feb 2020 07:52:15 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 07:52:15 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 8/9] ASoC: meson: gx: add sound card dt-binding documentation
Date:   Thu, 13 Feb 2020 16:51:58 +0100
Message-Id: <20200213155159.3235792-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the dt-binding documentation of sound card supporting the amlogic
GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,gx-sound-card.yaml | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
new file mode 100644
index 000000000000..fb374c659be1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX sound card
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,gx-sound-card
+
+  audio-aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: list of auxiliary devices
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    minItems: 2
+    description: |-
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  audio-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    minItems: 2
+    description: |-
+      A list off component DAPM widget. Each entry is a pair of strings,
+      the first being the widget type, the second being the widget name
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description: |-
+      dai-link child nodes:
+        Container for dai-link level properties and the CODEC sub-nodes.
+        There should be at least one (and probably more) subnode of this type
+
+    properties:
+      dai-format:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [ i2s, left-j, dsp_a ]
+
+      mclk-fs:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |-
+          Multiplication factor between the frame rate and master clock
+          rate
+
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle of the CPU DAI
+
+    patternProperties:
+      "^codec-[0-9]+$":
+        type: object
+        description: |-
+          Codecs:
+          dai-link representing backend links should have at least one subnode.
+          One subnode for each codec of the dai-link. dai-link representing
+          frontend links have no codec, therefore have no subnodes
+
+        properties:
+          sound-dai:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description: phandle of the codec DAI
+
+        required:
+          - sound-dai
+
+    required:
+      - sound-dai
+
+required:
+  - model
+  - dai-link-0
+
+examples:
+  - |
+    sound {
+        compatible = "amlogic,gx-sound-card";
+        model = "GXL-ACME-S905X-FOO";
+        audio-aux-devs = <&amp>;
+        audio-routing = "I2S ENCODER I2S IN", "I2S FIFO Playback";
+
+        dai-link-0 {
+               sound-dai = <&i2s_fifo>;
+        };
+
+        dai-link-1 {
+                sound-dai = <&i2s_encoder>;
+                dai-format = "i2s";
+                mclk-fs = <256>;
+
+                codec-0 {
+                        sound-dai = <&codec0>;
+                };
+
+                codec-1 {
+                        sound-dai = <&codec1>;
+                };
+        };
+    };
+
-- 
2.24.1

