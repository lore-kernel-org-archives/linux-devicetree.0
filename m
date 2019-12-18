Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B84C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 20:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A972624650
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 20:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JMGvz9LP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbfLRUZE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 15:25:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35741 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfLRUZE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 15:25:04 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so3359734wmb.0
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 12:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WvlYOoAD1IOta9diQC+n30t1bIYLy4c6uAUgMu9Krg=;
        b=JMGvz9LPMfSDZ7/RKUL+GMHZ0dcLW4/G4SdYnxB64Fr9ldBxGjXdsecfr4kS2nJp6F
         4HM1prGAY/8hLnhaibrv6LF7bMlZRV79ccZqMo3jnspkVh+o25se3IVe3FNi/YTACHDk
         FLUX+9uWWtItdOeDQlFNzV2oqY1O1UVI9YK49bQSXcIjkdv0SQAkSuEVuV4gt5KmN7Ue
         nBgZGtVAOs7ZkZeY6CcjODWQ7j/RXXjWn4G4Ql1FTqJgYD4lcyjBSDBpqQvh+V0DCLhA
         2+3RcaLe2Zj8J0OPZZjrKho2SWmPKXn3XnRyu2bjN8bqgiGt7LK4l6b4rSt1LzL0zPkV
         V9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WvlYOoAD1IOta9diQC+n30t1bIYLy4c6uAUgMu9Krg=;
        b=syqrS8OTYEMndhVfB2twQGotQfU9TdM+8cwHcOs/Rdd6acMWbZ8iLtrWDpPf0pMpoI
         iGiHeEUxfp7vuqQiQkybRk77TjAnCsmMrNGDUJOQu8ddUKPfh+fSBc9RploZWkRa5Bn3
         EdseDPAAsKPfBkXkS2nS7f/gL3m0Qvtzq2pkb/kSzVZ1oNUvEWbfj4ookKujSF+aZJsF
         //9v89nNC/mpx3a5hCDcAP7c6Xm7WK57tAEcdWBXTQWYuUvd0uA3cyoEZrOQtEjT8Cab
         Ycax0ceIr0QuM6C45iE2Hk3QH6h6wXtFZTZvTPLQdkplXm6L2dmwCnKmJ8P2IAiezz3N
         MEtg==
X-Gm-Message-State: APjAAAUBnrCuNYrGjONZN18fUgeU0tSn/4CuZfRLF9f64kLDk39FmVs2
        yWngkfI8rdmZZXAd4XSpR2K8Fg==
X-Google-Smtp-Source: APXvYqwTLtLgvq6+aprJN3gxmdjj1L7GXN2A1Ck97kp1XflLUXzVLhIaBeTnGRvthhFSEhIlyY1Iuw==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr5158320wmg.18.1576700702235;
        Wed, 18 Dec 2019 12:25:02 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id w22sm3469481wmk.34.2019.12.18.12.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:25:01 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add audio fifo depths
Date:   Wed, 18 Dec 2019 21:24:52 +0100
Message-Id: <20191218202452.1288378-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the property describing the depth of the audio fifo on the axg, g12a
and sm1 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Hi Kevin,

 The binding documentation for this new property will be merged through Mark's ASoC tree [0]

[0]: https://lkml.kernel.org/r/applied-20191218172420.1199117-3-jbrunet@baylibre.com

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 04803c3bccfa..aace3d32a3df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1169,6 +1169,7 @@
 				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
 				resets = <&arb AXG_ARB_TODDR_A>;
+				amlogic,fifo-depth = <512>;
 				status = "disabled";
 			};
 
@@ -1180,6 +1181,7 @@
 				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
 				resets = <&arb AXG_ARB_TODDR_B>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
@@ -1191,6 +1193,7 @@
 				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
 				resets = <&arb AXG_ARB_TODDR_C>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
@@ -1202,6 +1205,7 @@
 				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
 				resets = <&arb AXG_ARB_FRDDR_A>;
+				amlogic,fifo-depth = <512>;
 				status = "disabled";
 			};
 
@@ -1213,6 +1217,7 @@
 				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
 				resets = <&arb AXG_ARB_FRDDR_B>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
@@ -1224,6 +1229,7 @@
 				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
 				resets = <&arb AXG_ARB_FRDDR_C>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index b3ba2fda8af8..03054c478896 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -106,6 +106,7 @@
 			resets = <&arb AXG_ARB_TODDR_A>,
 				 <&clkc_audio AUD_RESET_TODDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <512>;
 			status = "disabled";
 		};
 
@@ -120,6 +121,7 @@
 			resets = <&arb AXG_ARB_TODDR_B>,
 				 <&clkc_audio AUD_RESET_TODDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -134,6 +136,7 @@
 			resets = <&arb AXG_ARB_TODDR_C>,
 				 <&clkc_audio AUD_RESET_TODDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -148,6 +151,7 @@
 			resets = <&arb AXG_ARB_FRDDR_A>,
 				 <&clkc_audio AUD_RESET_FRDDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <512>;
 			status = "disabled";
 		};
 
@@ -162,6 +166,7 @@
 			resets = <&arb AXG_ARB_FRDDR_B>,
 				 <&clkc_audio AUD_RESET_FRDDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -176,6 +181,7 @@
 			resets = <&arb AXG_ARB_FRDDR_C>,
 				 <&clkc_audio AUD_RESET_FRDDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index be00b8f2f1e6..d847a3fcbc85 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -201,6 +201,7 @@
 			resets = <&arb AXG_ARB_TODDR_A>,
 				 <&clkc_audio AUD_RESET_TODDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <8192>;
 			status = "disabled";
 		};
 
@@ -215,6 +216,7 @@
 			resets = <&arb AXG_ARB_TODDR_B>,
 				 <&clkc_audio AUD_RESET_TODDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -229,6 +231,7 @@
 			resets = <&arb AXG_ARB_TODDR_C>,
 				 <&clkc_audio AUD_RESET_TODDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -243,6 +246,7 @@
 			resets = <&arb AXG_ARB_FRDDR_A>,
 				 <&clkc_audio AUD_RESET_FRDDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <512>;
 			status = "disabled";
 		};
 
@@ -257,6 +261,7 @@
 			resets = <&arb AXG_ARB_FRDDR_B>,
 				 <&clkc_audio AUD_RESET_FRDDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -271,6 +276,7 @@
 			resets = <&arb AXG_ARB_FRDDR_C>,
 				 <&clkc_audio AUD_RESET_FRDDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -412,6 +418,7 @@
 			resets = <&arb AXG_ARB_TODDR_D>,
 				 <&clkc_audio AUD_RESET_TODDR_D>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -426,6 +433,7 @@
 			resets = <&arb AXG_ARB_FRDDR_D>,
 				 <&clkc_audio AUD_RESET_FRDDR_D>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 	};
-- 
2.23.0

