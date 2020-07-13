Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A32C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:55:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE094207F9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="2BqzUBw7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgGMJzU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgGMJzT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 05:55:19 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E4BC061755
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:55:19 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b15so12774272edy.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EX/IMErDoxcFcjxLjU7HkV8aJIJA8/hNtsxtvwLEDVQ=;
        b=2BqzUBw7/Z8AjkdfPds8NRm7bDSUM3XsIrf08G4cqiKfWpoCwH1NTL+R5QErw9RMJD
         ruOOmIvhK2azCGi9uTui4vnRgEUtp0bpkPnHMDU11Vkn3wOmHcqW2EV9SaqkOxHV5Fca
         NUWASbM2f6hrjIsVsCk2LOEX1AFlHFS0IQAtONNEn4HJRA0HgBsb+AyCyOH7FVVpoy29
         /h+oPi34xmqCcwXn6mGQunDQDpNDNsV+FVWlBZ8WBwCJ5Bfk0ZwD7tLlXopNogGdJscE
         x5hhD9Q7+FTkS8/x09olpK0PddGcpPQU8Pxzn8gjOKjZB2ssoHAQq8jHqyOjTj2+8lFz
         eGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EX/IMErDoxcFcjxLjU7HkV8aJIJA8/hNtsxtvwLEDVQ=;
        b=YXj7a8Q8///JKDIOsL9EcREdaapoBAegnCAe7LzwahLRynQxNVZVc/j/e81RIlnSod
         avQvBy5h5B92eWY5beyvy52TPu3xaSbCMUn3vOKl5WHlu7Hm9mFWhhWsRvG7P4iR75n8
         44EbcBqC819ww/S72ny2btChOXuo5SOOcVe8Jy7N19Jk6hMBf70CvKpZvBQ2c3pWCi4c
         qgQBnbTRhlq+Op7FtWAzfwqwXfEAki+cQzar8WAHK21GRAT7kwxAXDgTokme0VzDEOZn
         nWiS+YDKjIdphLIcOSSF0qmkONDP06g6XhAjzMGp7Nj6Kyx+yZhrY/xWlqseHJfKPHBU
         /QVg==
X-Gm-Message-State: AOAM531cYnWMheEO2CCqXTalqhPi4KMebo5+UpBJyPs9U8NX/7LYouju
        vMABCzAYAwUPIrex0++Sj2s4Gg==
X-Google-Smtp-Source: ABdhPJxc6tyvTQYd53XE6resgy8+ALS+JG8waXk5fYpksiyCZf1PTru3ENaDbBHsQP/quKbsa2MCMQ==
X-Received: by 2002:a05:6402:1494:: with SMTP id e20mr77492854edv.2.1594634117908;
        Mon, 13 Jul 2020 02:55:17 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-45.xnet.hr. [88.207.98.45])
        by smtp.googlemail.com with ESMTPSA id w24sm10957046edt.28.2020.07.13.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 02:55:17 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] arm64: dts: ipq6018: Add NAND nodes
Date:   Mon, 13 Jul 2020 11:55:08 +0200
Message-Id: <20200713095508.512919-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IPQ6018 uses the same NAND and controller as IPQ8074 which
is supported by the Qualcomm NANDC driver.
So lets add the NAND node as well as node for the BAM DMA
controller that is supported by the BAM DMA driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 1aa8d8579463..bd4a1317c4c6 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -274,6 +274,33 @@ i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
 			status = "disabled";
 		};
 
+		qpic_bam: dma@7984000{
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x7984000 0x1a000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		nand: qpic-nand@79b0000 {
+			compatible = "qcom,ipq8074-nand";
+			reg = <0x79b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+					 <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "core", "aon";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.26.2

