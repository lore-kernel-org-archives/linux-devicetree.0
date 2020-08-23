Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7453CC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 11:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 547F52074D
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598181337;
	bh=h08QRaaw1ypKOkPJ9otVWYimg697b3mMn5IOwkzYYuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=vpbJB4j2b6XvBOhSmuh3E5o39GBuHqIsuj0eTQmmshnFTX9kwEIePUO34azQMpet4
	 1ndct3wsAczDkldzC7Dwp5BduHGGh2oX6JVc2tg7MF6eyQGkzuGr8N5+t8w+RV2Yjj
	 vHdkQ1iSl5wITTX/nH+DMR1wu8w08d6RAnouEejE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHWLPg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 07:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726991AbgHWLP3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 23 Aug 2020 07:15:29 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A045B20774;
        Sun, 23 Aug 2020 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598181328;
        bh=h08QRaaw1ypKOkPJ9otVWYimg697b3mMn5IOwkzYYuc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OgjZjO9YkNVgWWYlmIXPx5uzxwYtj0efm2RFwdrGI6lfPjt3Glf+msQO4PAV+S5Zs
         L9c7GRN1kITZlpvZQE800G4J7U4IMNgGtbCR+vsrUKyBfNcbRx37heUL0wxQuVjA+V
         i0AzmkQJHMDGm/vqNycrGcTxf5pYdJaRZzyzYcY0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 5/5] arm64: dts: imx8mq-thor96: Replace deprecated phy reset properties
Date:   Sun, 23 Aug 2020 13:15:08 +0200
Message-Id: <20200823111508.1165-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823111508.1165-1-krzk@kernel.org>
References: <20200823111508.1165-1-krzk@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use preferred properties of phy node instead of deprecated
phy-reset-gpios (and others).  This avoids copying deprecated code into
future DTSes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested on HW.
---
 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
index b4795a032fa2..5d5aa6537225 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
@@ -122,7 +122,6 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
 	phy-mode = "rgmii-id";
-	phy-reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	phy-handle = <&ethphy>;
 	fsl,magic-packet;
 	status = "okay";
@@ -134,6 +133,7 @@
 		ethphy: ethernet-phy@3 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <3>;
+			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.17.1

