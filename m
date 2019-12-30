Return-Path: <SRS0=2Mri=2U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C1EC2D0C2
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 12:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C47820863
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 12:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jnDiCxSk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfL3MAu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Dec 2019 07:00:50 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54045 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfL3MAu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Dec 2019 07:00:50 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so7726257pjc.3
        for <devicetree@vger.kernel.org>; Mon, 30 Dec 2019 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loK+/2QBNqR4qI1aKCHvxn+umU8QIBnua/KHI6KiyXg=;
        b=jnDiCxSk1c87KihAaXtSKthEobvCB6cNk3t6zBEjYl77hfXDNXqmlmu4IGveLG5F4F
         iy11U7whJDdTG48Kqz2u7IivLRQu8tj1Mr3FQgUXQ0Hx7FE4XSMpFp3MOp1Nwk/zN0t8
         zPPay9PUqOEdJeBD2ztRaSKQGgH6FIguxcvKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loK+/2QBNqR4qI1aKCHvxn+umU8QIBnua/KHI6KiyXg=;
        b=FwJXLoyz/OciCTLhd/+vZSI0axmjUJAQdqwwHXIWljsTgra8pOHzq6rvVSs/vYywbD
         NYyuTaNH+4kTLJLUd2+zAa/Dosa90GrINCMgrh0WjmaiRKRVpYt2zgWQNsmu7bKXsZKp
         SMcnYxE/hwkxepHBmDzNarLlzOg5H9QHbT/ZEd0rgodTUPCQZFLPg/1yu5OXwlvVi1Vi
         w1BnhyTS0u81xpUTPOZaIiqTtHVpyDYdExuTrSMki1WfiDS3XeM1JzQh41BFVqJ3S7Fr
         bh8vfrJxGkKk03R/sUgOcDn0LgZQOnh8Kq6dyxSp7n4arGwzMZEKsVTyG7nm3VoKrALa
         4lVQ==
X-Gm-Message-State: APjAAAWJNV/XNVe/SAOw35GEuTJ8JWgNgVPr8ySN0QaTf+opqloqp7Je
        idaM1dnUt+yHm7nzdFc4Fs2a8w==
X-Google-Smtp-Source: APXvYqyKEwtlxrFaPIwook1+VfY0lSYSMcZTJ6WguwicU9oNLpY+et1Gxbqgky3XvCnScNe13ALFJQ==
X-Received: by 2002:a17:902:7c0f:: with SMTP id x15mr28595069pll.267.1577707249818;
        Mon, 30 Dec 2019 04:00:49 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.131])
        by smtp.gmail.com with ESMTPSA id 7sm41894122pfx.52.2019.12.30.04.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 04:00:49 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Michael Trimarchi <michael@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 3/3] ARM: dts: imx6qdl-icore: Add fec phy-handle
Date:   Mon, 30 Dec 2019 17:30:21 +0530
Message-Id: <20191230120021.32630-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191230120021.32630-1-jagan@amarulasolutions.com>
References: <20191230120021.32630-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Michael Trimarchi <michael@amarulasolutions.com>

LAN8720 needs a reset of every clock enable. The reset needs
to be done at device level, due the flag PHY_RST_AFTER_CLK_EN.

So, add phy-handle by creating mdio child node inside fec.
This will eventually move the phy-reset-gpio which is defined
in fec node.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- new patch.

 arch/arm/boot/dts/imx6qdl-icore.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index 7814f1ef0804..756f3a9f1b4f 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -150,10 +150,23 @@
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
-	phy-reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	clocks = <&clks IMX6QDL_CLK_ENET>, <&clks IMX6QDL_CLK_ENET>, <&rmii_clk>;
 	phy-mode = "rmii";
+	phy-handle = <&eth_phy>;
 	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
 };
 
 &gpmi {
-- 
2.18.0.321.gffc6fa0e3

