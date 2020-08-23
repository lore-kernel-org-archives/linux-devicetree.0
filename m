Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2CCC433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 11:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 203282074D
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598181329;
	bh=/s6rlS3ucQ3ewRxqmyT9G1nLBvNtwJqGfOnCMXRZBuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KRwwIscBfFdBKSj0Q5TAGdDOrAEU8qTMJfYKFObVnOVxRYu8YjenLc7ZRbx+4vBYb
	 oAke2PdktOCfGjJaeV+uWmMK0DWzc0/fRGGc3+/Az/KTA0Y9PygY5zqjwTCkfZY+Ji
	 lfWfe2STOuyXf19jXWL/URCdc2LTKpiH8YiuoiJQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgHWLP1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 07:15:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgHWLPX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 23 Aug 2020 07:15:23 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73B17207BB;
        Sun, 23 Aug 2020 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598181323;
        bh=/s6rlS3ucQ3ewRxqmyT9G1nLBvNtwJqGfOnCMXRZBuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RU5YtbIZHeY1kpZRXH37e7ax8uejtwtvccHXJrv1sBqUebenoxx85jwYom2soE5aB
         FKyaPPG73h9wTYWSp6ak9Rq5X5CbaCYsnfZntvCAedv/Stz1jpNlTH1YJfmnpv74wV
         +dSDfxJsB1lGGSO1SEogFp90sSIfZVs7beOoI2oY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/5] arm64: dts: imx8mq-phanbell: Replace deprecated phy reset properties
Date:   Sun, 23 Aug 2020 13:15:06 +0200
Message-Id: <20200823111508.1165-3-krzk@kernel.org>
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
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 77ab568fae67..3f541ddf0768 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -262,9 +262,6 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
 	phy-mode = "rgmii-id";
-	phy-reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
-	phy-reset-duration = <10>;
-	phy-reset-post-delay = <50>;
 	phy-handle = <&ethphy0>;
 	fsl,magic-packet;
 	status = "okay";
@@ -275,6 +272,9 @@
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
 		};
 	};
 };
-- 
2.17.1

