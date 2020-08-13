Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16E8C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8A3520675
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hC8DF3IG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHMB3n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57532 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHMB3n (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:43 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CF22186A;
        Thu, 13 Aug 2020 03:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282175;
        bh=MZn8mLN17DKncF4EzGPQOwmCiHKdGcl5P1OVLaGPHuo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hC8DF3IGTnkdKJuVftP62Dll0HeMlUKg7X9GIOiGpfhzYaiB3KlBE9h3d111eY1iy
         g9a3nK3STdDR5d/eZuVP2Iib8JH4PxeNNToKsBq6uq2eoIJ6FSffptsPdLSexBotle
         SNoCkdMosbhrmeDy0hspjo6zn5KATGBDfXI2M5/U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 6/8] arm64: dts: imx8mq: Fix LCDIF compatible strings
Date:   Thu, 13 Aug 2020 04:29:08 +0300
Message-Id: <20200813012910.13576-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The LCDIF in the i.MX8 SoCs has additional features compared to the
i.MX28. Replace the fsl,imx28-lcdif fallback compatible string with
fsl,imx6sx-lcdif to reflect that.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 978f8122c0d2..4731c3992179 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -506,7 +506,7 @@ sdma2: sdma@302c0000 {
 			};
 
 			lcdif: lcd-controller@30320000 {
-				compatible = "fsl,imx8mq-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x30320000 0x10000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
-- 
Regards,

Laurent Pinchart

