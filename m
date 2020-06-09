Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D498DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B18AE2078D
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1KrU7/E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731401AbgFIRBf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 13:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731390AbgFIRBc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 13:01:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C86C03E97C
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 10:01:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y17so22123085wrn.11
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WKkGKM1i+ZwjQU8y1F8HIyZFPfYPlnsKwCB0yR3tEE4=;
        b=l1KrU7/E31ITIYvTfzAncU/3ntg1p3J+hQNm2CqUP6C5TwinNB1fmslNVYfUmaA97+
         sXblARRGnzrbPvsWKUx3u3rXRfM+wZayRivtffPho7e6cSWIyu9kMVw18Gbimj3DpJiD
         lig01x0hwrbI6AHS9YT8uQPrxhQPI8XC8b+jmYeH9Bzve/2XACyki0NJHzUcb+6bG65g
         B+noBL8e0g3PEanuKZC8jntVyKlxjgOocmPzvxzezW0T7jsMLfZ4/zGQT2gD8DzAEWa/
         vh2j6aGy5sapw2/KXUmkWNDF/B/rcNVedbz9Jt0y81K2XxU6EYuIwx7WR4hVIhEIK4sN
         w0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WKkGKM1i+ZwjQU8y1F8HIyZFPfYPlnsKwCB0yR3tEE4=;
        b=GLQaw8sglFTftatgLKBW8325lg7rWyJtD3X6tkCZzkvxGWMDdtoXIJPB/nr73NzE+m
         wku56yTDu7Q9RIBkGuc7CB/8kW8XRJAUGoOw6wMFUCLCHkM07CVSv/e9Kh9SIncbjb0S
         yv33PqrevJ41zRslcVO3EQnUhr5uZ9QUp4gd1cdCKj/RyPOvURQNnBFjYatvBgZCQb2r
         XRuqo2j8ifSb9XphLqfBw8WfIOTt8YkSSrhNmHqP3c/zUcoUnD1CflKqynFS66UaorDM
         qSELcv80wTWnU9dajfFJj9s7Su7fmsQKkQW06TZUPaTS89Q4YR0+TD2DohshgARyFzOa
         qzYw==
X-Gm-Message-State: AOAM533/dA/dpSXwz3cZWIaAD1p9NiLrBB4w04ykD82MKqVocHeAaNSq
        qrRArBDh7ocV2Y03/OIm+OA=
X-Google-Smtp-Source: ABdhPJzgTI+524MDuS7w5lagpPtbOaBYaupWOktz4kyyP9U6rMau70HYUh5ipMQDAj7LI/iV41Sqxw==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr5825010wrp.419.1591722090607;
        Tue, 09 Jun 2020 10:01:30 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id d16sm3500004wmd.42.2020.06.09.10.01.30
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 09 Jun 2020 10:01:30 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: NSP: Correct amac_base lengths, mailbox reg and add amac3
Date:   Tue,  9 Jun 2020 17:58:30 +0100
Message-Id: <d638e006713d82d1a6af4bdbcfa516f425264bf6.1591719237.git.mnhagan88@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to gmac/src/et/sys/et_linux.c, IORESOURCE_MEM end address for each
mac is IPROC_GMACx_REG_BASE+0xbff.

The FA2 mailbox is specified at 0x18025000 but should actually be 0x18025c00,
length 0x400 according to socregs_nsp.h and board_bu.c. amac3 is at 25000.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 920c0f561e5c..512720f39e04 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -47,6 +47,7 @@ aliases {
 		ethernet0 = &amac0;
 		ethernet1 = &amac1;
 		ethernet2 = &amac2;
+		ethernet3 = &amac3;
 	};
 
 	cpus {
@@ -231,7 +232,7 @@ sdio: sdhci@21000 {
 
 		amac0: ethernet@22000 {
 			compatible = "brcm,nsp-amac";
-			reg = <0x022000 0x1000>,
+			reg = <0x022000 0x0c00>,
 			      <0x110000 0x1000>;
 			reg-names = "amac_base", "idm_base";
 			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -241,7 +242,7 @@ amac0: ethernet@22000 {
 
 		amac1: ethernet@23000 {
 			compatible = "brcm,nsp-amac";
-			reg = <0x023000 0x1000>,
+			reg = <0x023000 0x0c00>,
 			      <0x111000 0x1000>;
 			reg-names = "amac_base", "idm_base";
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -251,7 +252,7 @@ amac1: ethernet@23000 {
 
 		amac2: ethernet@24000 {
 			compatible = "brcm,nsp-amac";
-			reg = <0x024000 0x1000>,
+			reg = <0x024000 0x0c00>,
 			      <0x112000 0x1000>;
 			reg-names = "amac_base", "idm_base";
 			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
@@ -259,10 +260,20 @@ amac2: ethernet@24000 {
 			status = "disabled";
 		};
 
-		mailbox: mailbox@25000 {
-			compatible = "brcm,iproc-fa2-mbox";
-			reg = <0x25000 0x445>;
+		amac3: ethernet@25000 {
+			compatible = "brcm,nsp-amac";
+			reg = <0x025000 0x0c00>,
+			      <0x113000 0x1000>;
+			reg-names = "amac_base", "idm_base";
 			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		mailbox: mailbox@25c00 {
+			compatible = "brcm,iproc-fa2-mbox";
+			reg = <0x25c00 0x400>;
+			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 			#mbox-cells = <1>;
 			brcm,rx-status-len = <32>;
 			brcm,use-bcm-hdr;
-- 
2.25.4

