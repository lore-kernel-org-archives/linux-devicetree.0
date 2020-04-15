Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D417FC3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4B3E2076A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="KT9hs807"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410452AbgDOQtv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410449AbgDOQts (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 12:49:48 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C2CC061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 09:49:48 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id c12so394496qvj.5
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTBWT1P0a2Si94UCDXGUOPYWctXvmO5z5+Oc2JOMSj0=;
        b=KT9hs807G9QWIAQ5rkVVKJui4x51HJZ1uYjjceSV1conl1tettn+jj9dxaKNM4Bi8b
         7kbuD9iMwJDge4Z8TDOlWCHJ2OeiZZ931kQ1EjFQOwX6od9JG7X3temnaD6+QS6cdrQP
         S/TuIxZsd9S0LrfUhNmy5QUjRkcNyIsKDe0Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTBWT1P0a2Si94UCDXGUOPYWctXvmO5z5+Oc2JOMSj0=;
        b=NnBMKn5plTOFuWP/d3Cxz4j8/U09cymvsZKYf0w0B2yAhCcRY35v84CijqtX0gyv8K
         fSvdTlj2A6/nWGSkldVh5tVt9olxY3gkYQ0YmK6HPGfJUi5od1HS49+J9S4Z1HGmc2bE
         VhXuxuM4k/J8Fv65y1/29QQvO8iEoqud+lAO833hF3A4HBRqauubQNK+S8YLwFvFEFQu
         sARsvdIlLt3PbeTC44ONl9mqLsPMD5Z7RbIxgfG4RcfZJ0psLxIKFpl7BMZi2Wtu8hW1
         DI97xFaAIVX7K/2F+0MlKiNDC0lrXPIZ3j3uooxHaFAqEN90XDxqR+V6nbBN3cfkqa0n
         xGOg==
X-Gm-Message-State: AGi0PubufbHTT+0dQ2iv5Jy1ijHXKaZ2v1+ilyf37cflKyPbPwdlPSyL
        9dKiWjF/zmtbJbyCK999XJEnoQ==
X-Google-Smtp-Source: APiQypJNfazUZkOBvj3kluwIVm2ER5FSDI24URISuCCNDbMM62tJdouf9L/qrxGJsi728QXBby+X4A==
X-Received: by 2002:a0c:e941:: with SMTP id n1mr6054445qvo.144.1586969387153;
        Wed, 15 Apr 2020 09:49:47 -0700 (PDT)
Received: from bacon.ohporter.com ([2605:a000:1234:47c6:a553:c33f:1562:b0b1])
        by smtp.gmail.com with ESMTPSA id q6sm13623146qte.72.2020.04.15.09.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:49:46 -0700 (PDT)
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
Subject: [PATCH][RESEND] arm64: dts: imx8mm: fix dma peripheral type for SAI nodes
Date:   Wed, 15 Apr 2020 12:49:40 -0400
Message-Id: <20200415164940.1949-1-mporter@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The peripheral type specified in the dma phandle for each SAI node
is incorrect. Change it to specify the SAI peripheral.

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cc7152ecedd9..a8c678db651b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -277,7 +277,7 @@
 					 <&clk IMX8MM_CLK_SAI1_ROOT>,
 					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
+				dmas = <&sdma2 0 24 0>, <&sdma2 1 24 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
@@ -290,7 +290,7 @@
 					<&clk IMX8MM_CLK_SAI2_ROOT>,
 					<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
+				dmas = <&sdma2 2 24 0>, <&sdma2 3 24 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
@@ -304,7 +304,7 @@
 					 <&clk IMX8MM_CLK_SAI3_ROOT>,
 					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
+				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
@@ -317,7 +317,7 @@
 					 <&clk IMX8MM_CLK_SAI5_ROOT>,
 					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
+				dmas = <&sdma2 8 24 0>, <&sdma2 9 24 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
@@ -330,7 +330,7 @@
 					 <&clk IMX8MM_CLK_SAI6_ROOT>,
 					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
+				dmas = <&sdma2 10 24 0>, <&sdma2 11 24 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
-- 
2.20.1

