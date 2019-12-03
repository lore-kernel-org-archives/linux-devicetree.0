Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D3EC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF0822080F
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="N5hZ67OM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfLCNtB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 08:49:01 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32995 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfLCNtB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 08:49:01 -0500
Received: by mail-pf1-f193.google.com with SMTP id y206so1904208pfb.0
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 05:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ke4tL+lHXK0j3bKO8x1UNBlk4yZ+cYr66D3IUPPUdkM=;
        b=N5hZ67OMW5NuOOqE/NDh0govtD9Sh3TvScmIgM02xJ3rDzZEn+fnlKfiPMhsOVb1rn
         g3sCxJHkQpAGiV393wdy0S80Ak21VRYMGbCV0KqGV2WIcBnPkOnu12dWsJi5Rpq3Y+w4
         TXl5GGpQL95s7YsAdjU284KNNVjHwIQ+8rAhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ke4tL+lHXK0j3bKO8x1UNBlk4yZ+cYr66D3IUPPUdkM=;
        b=C/YMjQN680/RCOUgwlrf669wCnRZPmmQzosLmwJWtgVG9I3HdpFf/X8HulmXs9Wpf4
         OYjhllF7Q/SYD6QIWFErqGNlVYT1Gh38UAZ3Z+Gg0cA+enLmNCfNGJG3MGV6LgaWrgMl
         /iJ1GbjhXo5TOjzy8meDeoZrfByij79ASZX6HPArHsZnq/bdj6JTjeXrWH9wZs7VM22n
         w6tGY2Rpw0bNEpirQRHLSmThiq4RdjWXCA09Il2NXKlM34/xdjPkkJIUcKCKhtVeJqok
         M2Fy6XTiQJtlHO0MnBzdLMb8/CH5bpqR5A5lfr92OGg2yRQJyjInoi3gbkVIN7+yVXUr
         oKkg==
X-Gm-Message-State: APjAAAWbgQ/tAZ4bkXlW3V87/rWCng0PwuPjQtznBlaQRUIcYlXAX0JQ
        c9Lfs2c2Ktq85RUPLtQnOWXBsg==
X-Google-Smtp-Source: APXvYqyIJZHBzy4Ips/O+tLpiqsHSAYb0yd7QO+j8JCAANrcld28OPDSbFiPDZGh4m/TpJVtuLBS9Q==
X-Received: by 2002:a63:c849:: with SMTP id l9mr5543294pgi.330.1575380940429;
        Tue, 03 Dec 2019 05:49:00 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
        by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 05:48:59 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     michael@amarulasolutions.com, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v12 6/7] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date:   Tue,  3 Dec 2019 19:18:15 +0530
Message-Id: <20191203134816.5319-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add MIPI DSI pipeline for Allwinner A64.

- dsi node, with A64 compatible since it doesn't support
  DSI_SCLK gating unlike A33
- dphy node, with A64 compatible with A33 fallback since
  DPHY on A64 and A33 is similar
- finally, attach the dsi_in to tcon0 for complete MIPI DSI

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
Changes for v12:
- none

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 27e48234f1c2..1db8378f59a4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -382,6 +382,12 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+
+					tcon0_out_dsi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dsi_in_tcon0>;
+						allwinner,tcon-channel = <1>;
+					};
 				};
 			};
 		};
@@ -1014,6 +1020,37 @@
 			status = "disabled";
 		};
 
+		dsi: dsi@1ca0000 {
+			compatible = "allwinner,sun50i-a64-mipi-dsi";
+			reg = <0x01ca0000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>;
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			phys = <&dphy>;
+			phy-names = "dphy";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port {
+				dsi_in_tcon0: endpoint {
+					remote-endpoint = <&tcon0_out_dsi>;
+				};
+			};
+		};
+
+		dphy: d-phy@1ca1000 {
+			compatible = "allwinner,sun50i-a64-mipi-dphy",
+				     "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01ca1000 0x1000>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>,
+				 <&ccu CLK_DSI_DPHY>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		hdmi: hdmi@1ee0000 {
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
-- 
2.18.0.321.gffc6fa0e3

