Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71103C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 01:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 481ED208E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 01:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgHQBxE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 21:53:04 -0400
Received: from mo-csw-fb1516.securemx.jp ([210.130.202.172]:40022 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgHQBxE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 21:53:04 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 Aug 2020 21:53:02 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 07H1l8W8018748; Mon, 17 Aug 2020 10:47:08 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07H1kr12014348; Mon, 17 Aug 2020 10:46:53 +0900
X-Iguazu-Qid: 34tMSeeoSi6C1n0IS4
X-Iguazu-QSIG: v=2; s=0; t=1597628813; q=34tMSeeoSi6C1n0IS4; m=O1HMk+y3T+4H2GN7jTiGHwiRJStCDWJbUBAdptc8e5s=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1513) id 07H1kqV3028136;
        Mon, 17 Aug 2020 10:46:52 +0900
Received: from enc01.localdomain ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 07H1kqJU002041;
        Mon, 17 Aug 2020 10:46:52 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.localdomain  with ESMTP id 07H1kpAx024066;
        Mon, 17 Aug 2020 10:46:51 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 5/8] arm64: visconti: Add initial support for Toshiba Visconti platform
Date:   Mon, 17 Aug 2020 10:46:29 +0900
X-TSB-HOP: ON
Message-Id: <20200817014632.595898-6-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the initial device tree files for Toshiba Visconti platform.
For starters, the only SoC supported will be Visconti5 TMPV7708.

https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 arch/arm64/Kconfig.platforms | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8dd05b2a925c..a9181e074e9e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -280,6 +280,13 @@ config ARCH_VEXPRESS
 	  This enables support for the ARMv8 software model (Versatile
 	  Express).
 
+config ARCH_VISCONTI
+	bool "Toshiba Visconti SoC Family"
+	select PINCTRL
+	select PINCTRL_VISCONTI
+	help
+	  This enables support for Toshiba Visconti SoCs Family.
+
 config ARCH_VULCAN
 	def_bool n
 
-- 
2.27.0

