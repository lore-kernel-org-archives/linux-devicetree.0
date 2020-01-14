Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B15EC33CB1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 12:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DAEE24672
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 12:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hazent-com.20150623.gappssmtp.com header.i=@hazent-com.20150623.gappssmtp.com header.b="xV+impGW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgANMAe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 07:00:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32947 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgANMAe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 07:00:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so11910665wrq.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 04:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hazent-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDf9E2jEZpbwN6lIxkN60ENsZ3TScvWjer5XnJTvJUw=;
        b=xV+impGWBENtCFcWSH0ftkctOnHwhG/bxl9woj4MfKZZeaEp9zHPRUKabGTBm9jq59
         DEnOm1eH4dF2A1LS9XsXlkMqrTBZ+axirr/b+s3lRFCTpdBBZkzhSs2zqlGX6kTTqiqO
         8BqxgpG7SRv5gtmH9+LAg6M4SqN+sturx+sJ55UJ6hRzNiFUsNqLf+uJsGDSUYFOU+gu
         qkD788s23B6pmfQxEWsCmSxydjnhXVESu8knffDpUjW87eSGoMzHBIi3AbEtOaapw5Yo
         zC+DYqq6poUqHFGZ948SjfJ4CNOMFNvEguPPjNzeR1QDPOyBsZJA1vRMWlysnnrZS1Rl
         U2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDf9E2jEZpbwN6lIxkN60ENsZ3TScvWjer5XnJTvJUw=;
        b=RBppd1goaWAv4mjri1mzKIHMADz9nPJ6kcRGvmpPJqyYLkFlkxdcJZFKleAzaxXExu
         7H4qwWd3qcmHU+LImCs/+BVFScB/W/u3TGGNC2k4kiIeosvkzWbqJUAQ2Bd1+/5JReXn
         pHNmGM6q91stjLSaRSIi0XIA9pcWo2B/7JJ0CgaGFOhBXuQCB9/84oJV9a/XBUJ/qiLC
         XG0QJeMhCQzpMy8GZkuVc1FYnnaI1aHQ5IZYFBhq0trw+c1Jbom9mt6eOVo682ObEA4W
         EnLKsN3s1oqvA54XMQEP4LiEZdv2omjEgro2vPLIg/Kj2LpEMyWILqSPcFEv9lEdwf0w
         BzMA==
X-Gm-Message-State: APjAAAX5PeRL8bCnFldKxKoc3zkxGUtd94Qmee7tgY/04XS7BnWSYe07
        E6+Xq18TyF7ZyfRyiX8VFX/Dhw==
X-Google-Smtp-Source: APXvYqyQKqpb59gizT0sC1bQYkx4m90mVUoYGdrbzBQivBAJTriCKC1wnSSHRDGJwyUhWeldj9RFog==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr24824090wrw.31.1579003232544;
        Tue, 14 Jan 2020 04:00:32 -0800 (PST)
Received: from salem.gmr.ssr.upm.es (salem.gmr.ssr.upm.es. [138.4.36.7])
        by smtp.gmail.com with ESMTPSA id w22sm17594017wmk.34.2020.01.14.04.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 04:00:31 -0800 (PST)
From:   Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michal Simek <michal.simek@xilinx.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Subject: [PATCH] ARM: zynq: add flash memory interfaces, Xilinx efuse and missing clocks
Date:   Tue, 14 Jan 2020 13:00:24 +0100
Message-Id: <20200114120024.19779-1-alvaro.gamez@hazent.com>
X-Mailer: git-send-email 2.25.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 arch/arm/boot/dts/zynq-7000.dtsi | 50 ++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index ca6425ad794c..8358315d7803 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -197,6 +197,45 @@ spi1: spi@e0007000 {
 			#size-cells = <0>;
 		};
 
+		qspi: spi@e000d000 {
+			clock-names = "ref_clk", "pclk";
+			clocks = <&clkc 10>, <&clkc 43>;
+			compatible = "xlnx,zynq-qspi-1.0";
+			status = "disabled";
+			interrupt-parent = <&intc>;
+			interrupts = <0 19 4>;
+			reg = <0xe000d000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		smcc: memory-controller@e000e000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+			clock-names = "memclk", "apb_pclk";
+			clocks = <&clkc 11>, <&clkc 44>;
+			compatible = "arm,pl353-smc-r2p1", "arm,primecell";
+			interrupt-parent = <&intc>;
+			interrupts = <0 18 4>;
+			ranges ;
+			reg = <0xe000e000 0x1000>;
+			nand0: flash@e1000000 {
+				status = "disabled";
+				compatible = "arm,pl353-nand-r2p1";
+				reg = <0xe1000000 0x1000000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
+			nor0: flash@e2000000 {
+				status = "disabled";
+				compatible = "cfi-flash";
+				reg = <0xe2000000 0x2000000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
+		};
+
 		gem0: ethernet@e000b000 {
 			compatible = "cdns,zynq-gem", "cdns,gem";
 			reg = <0xe000b000 0x1000>;
@@ -297,14 +336,19 @@ dmac_s: dmac@f8003000 {
 
 		devcfg: devcfg@f8007000 {
 			compatible = "xlnx,zynq-devcfg-1.0";
-			reg = <0xf8007000 0x100>;
 			interrupt-parent = <&intc>;
 			interrupts = <0 8 4>;
-			clocks = <&clkc 12>;
-			clock-names = "ref_clk";
+			reg = <0xf8007000 0x100>;
+			clocks = <&clkc 12>, <&clkc 15>, <&clkc 16>, <&clkc 17>, <&clkc 18>;
+			clock-names = "ref_clk", "fclk0", "fclk1", "fclk2", "fclk3";
 			syscon = <&slcr>;
 		};
 
+		efuse: efuse@f800d000 {
+			compatible = "xlnx,zynq-efuse";
+			reg = <0xf800d000 0x20>;
+		};
+
 		global_timer: timer@f8f00200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0xf8f00200 0x20>;
-- 
2.25.0.rc2

