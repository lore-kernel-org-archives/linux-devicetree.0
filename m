Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940CAC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7167520771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="kdnLIyt9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411754AbgDOTHv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 15:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416894AbgDOS74 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 14:59:56 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DE5C061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 11:59:56 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id z90so14236320qtd.10
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RyFFovUkxx1rRXT+frGOD7qB7e/9xE+euu5Cd6lJq4c=;
        b=kdnLIyt9To6zO7rsfPXTcuWddDq/l+SqTQGPb6OJO7UzXiHLCejvNEG29BX7U1kCHC
         9BcCz4W/NyEsWUK5RAmbyD0HlwRBF2KHqqUGz/LR2D66x7Z8CKaZXNHkGxk7KJHrrmtY
         rhgFC6uJL6nCFTg620RyEmK48mczHX+JeM3m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RyFFovUkxx1rRXT+frGOD7qB7e/9xE+euu5Cd6lJq4c=;
        b=XF3tEccja2vWvVjbTgGJRUp1I6mCCiz0P3s6DPA1BbZSJiRp6GAd3+mHLoFu/6woVY
         +j3aeNDlR8vlzGx7L8dX6cN25qYiyXFLTZPQnbnuXY6Ip9TWaqZSYpze4/hlxX4ELphv
         ZaM2oc9I5mK2Amf/hTM4CyGWQTu/oj/Qn0mX6dVEWDFIZPhkxX4qPSUR4WEnVFxPQgET
         vmLOzEew+zn3BcgHZM4RdYM48OsqhoBhTqB/+NcaSo0k3G3CLWmEYD2YlPFRSEY5Ql3d
         neDvcQy2MwC9FMuK3s6wYcUmjELo6djxQjn+gk0wNR6EDKmv+u2zl5Jo8O4T8OCMU46t
         Vy3A==
X-Gm-Message-State: AGi0PubAcnDhYg+OSvyNEQmFtrECJlAaS/cEZWiSlXEWPVOBhOSLhC9p
        Tu9LDzHrU5pSsdmbY/Vdbi+agA==
X-Google-Smtp-Source: APiQypIaMkbmxh/Zsj/TW3PrwAt99zbsgCP4222dba10JjDcBv89JvF63UyYrU5GKpKM/SdIfPV8cA==
X-Received: by 2002:ac8:4ccc:: with SMTP id l12mr22717549qtv.129.1586977195010;
        Wed, 15 Apr 2020 11:59:55 -0700 (PDT)
Received: from bacon.ohporter.com ([2605:a000:1234:47c6:a553:c33f:1562:b0b1])
        by smtp.gmail.com with ESMTPSA id z187sm313355qka.69.2020.04.15.11.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 11:59:54 -0700 (PDT)
From:   Matt Porter <mporter@konsulko.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: imx8mm: specify #sound-dai-cells for SAI nodes
Date:   Wed, 15 Apr 2020 14:59:41 -0400
Message-Id: <20200415185941.13956-1-mporter@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add #sound-dai-cells properties to SAI nodes.

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cc7152ecedd9..8453a657cb5e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -270,6 +270,7 @@
 			ranges = <0x30000000 0x30000000 0x400000>;
 
 			sai1: sai@30010000 {
+				#sound-dai-cells = <0>;
 				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
 				reg = <0x30010000 0x10000>;
 				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
@@ -283,6 +284,7 @@
 			};
 
 			sai2: sai@30020000 {
+				#sound-dai-cells = <0>;
 				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
 				reg = <0x30020000 0x10000>;
 				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
@@ -310,6 +312,7 @@
 			};
 
 			sai5: sai@30050000 {
+				#sound-dai-cells = <0>;
 				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
 				reg = <0x30050000 0x10000>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
@@ -323,6 +326,7 @@
 			};
 
 			sai6: sai@30060000 {
+				#sound-dai-cells = <0>;
 				compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
 				reg = <0x30060000 0x10000>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.20.1

