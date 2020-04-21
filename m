Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47A6C54FC9
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 16:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4319206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 16:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="syXioSJX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbgDUQjq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 12:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729245AbgDUQjp (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 12:39:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0052C0610D6
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 09:39:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so17176516wrs.9
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jpek3q2loqJyecaKq8eFZOLHe2Q7PPqEkKIKbdnjsuc=;
        b=syXioSJXMr4c9pygdNpcUDoH20cDfYzVNEWQcBHBbPsiFIpKXIkAlDIGG3enBDdfn+
         7VrL6RPKhLMMyFHRQv54Sxk2p/AcaijAKWvoKvOKVgBSZ0vdtGwXGEDVYqC1FRsq/9rv
         CpyV36l5a3YMzK2X9kUOOaD9BE0WXjLs7hkNax84I6TrJ8NcTGv1ed+YnZ2d7HB20Tgh
         Zb+hsZmN+ufYGqAbV81sVyN67XRjd77C8czj3E7Cn0LftQDT+XXE4xYaAdl5KEnzYdTA
         txRuWeEhMlBrcE3NjgccoMn9JVojH63mwB7j/aT/DGdMclxEP2WZBkZNZjd6gOSiqUCA
         5VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jpek3q2loqJyecaKq8eFZOLHe2Q7PPqEkKIKbdnjsuc=;
        b=A0voRj3OQHrXlVJKiltqWs+dTwAghhY0E5PYcT4/nYwpiM49Kpl5JiCG7xZr4yKGZ1
         kd/WthDSOQOSCCg3DkvV6eRs1QhpNEWGwU7jKavkDLrqBTaVogejcN9fTgC70vPopdeu
         hiSALQfWFCy6sNy22zt3RRaJKAJnEnWKRNnmJnsIwBuY8sJAsRXSK6thnopiYq3oVw+H
         cAtMQETgCYnzcTqJPF/vujxm6/CTmtMN/U7xeqPrmE1p4hCgWvC3FtdLsAybOYwU4RMp
         uSBH6t7Fv1SJokdTf0oOqTrF6YEHJmG5JqE9c72fW5nLAbCuZZ49b1b1JZqod/bQhET2
         3HlA==
X-Gm-Message-State: AGi0PuYu/svwgn2Z37Vkz4yYlencMFxjGprCiZ086BkBLH2M7JMEi877
        fJD3277Olx+E+eXLWZH734yRbg==
X-Google-Smtp-Source: APiQypL2NjtboQWhtG5PhzxZLO8YuWESCro1o+9YaZTPQGbfw0/sKj8ABVJHP5tMcwb+y/vdXnhDWA==
X-Received: by 2002:a5d:68ca:: with SMTP id p10mr25089530wrw.154.1587487183317;
        Tue, 21 Apr 2020 09:39:43 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 33sm4578513wrp.5.2020.04.21.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 09:39:42 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: meson: p230-q200: add initial audio playback support
Date:   Tue, 21 Apr 2020 18:39:32 +0200
Message-Id: <20200421163935.775935-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421163935.775935-1-jbrunet@baylibre.com>
References: <20200421163935.775935-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add basic audio support on the p230/q200 reference design.
This initial support is limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 12d5e333e5f2..99c1f7f9d37e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -8,12 +8,21 @@
  * the pin-compatible S912 (GXM) or S905D (GXL) SoCs.
  */
 
+#include <dt-bindings/sound/meson-aiu.h>
+
 / {
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -102,6 +111,60 @@ hdmi_connector_in: endpoint {
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GX-P230-Q200";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
+
 };
 
 &cec_AO {
-- 
2.25.2

