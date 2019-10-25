Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D92CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDD2C222BE
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SkOqSdCS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730597AbfJYR5V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 13:57:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37939 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730363AbfJYR5U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 13:57:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id w3so2016041pgt.5
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hB0pIIBATDj7XQ4Wbz8E3uJD/S6VmCRjrZ4dOAWqf50=;
        b=SkOqSdCSPwXVo+8qdnvvqQ/eR8joWBQ7R/hkeU1jJh6Su00UdT34oEa4pXkqCwoSYq
         9HH2cMeJ6Hnb1nKXhGJddZqFkm6mIhaVR/ns24QaXViklZ1EyzUjUD4slpI+UVxsUl2X
         xQYMYFF31vAm/WVlAOSddJYOkLq0p9ec3aOcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hB0pIIBATDj7XQ4Wbz8E3uJD/S6VmCRjrZ4dOAWqf50=;
        b=pVKsVnv26E8/3dyU2w1LJUdK4WGkYOT0/uDUEXeDj2mQwigBwayD5RX+wzSALO4RbO
         MOdweus2Lp+n46fPuFtZ3T2DEDBkrtGI4Bm1JwBBVXNbAAru3iev8GKr59B+fdjgihMa
         BdzMZPl+L4b8bSPWwonwIqNgxUwHGXfjr4X9aFfHDcWk2+WXzZNMb2nIegVllfgcORhU
         UCEJH4bI9LjXrWq6PY3DRlBJAzBnCjnRTm5g+x7c/ZbMS2JKhl/JoqCG8oQCvJwVpKzi
         nKfyXrII+0X9ms6SpXLuzdDeGIwnXU5oSLumFDdJjx3P61cG8UxSjVC+x8aaeXja98yD
         ExeA==
X-Gm-Message-State: APjAAAV/kJDILF37YqHNJktDiaww2XfDX8p0Jeml7nEKu5+25GOvOrrE
        mffPMGx0fsUsuXhbzKhjJzvJQw==
X-Google-Smtp-Source: APXvYqwdTJlUGTm+q1YNKr1WJaGf+nuFBu7RLYAgAbmjqIUdbjCZk1Dq6OuM4dn4dfQhV5DB7NIKOA==
X-Received: by 2002:a63:5949:: with SMTP id j9mr5883267pgm.371.1572026240010;
        Fri, 25 Oct 2019 10:57:20 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
        by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:57:19 -0700 (PDT)
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
Subject: [PATCH v11 6/7] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date:   Fri, 25 Oct 2019 23:26:24 +0530
Message-Id: <20191025175625.8011-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
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
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 69128a6dfc46..a52dfa98ac5e 100644
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
@@ -1003,6 +1009,37 @@
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

