Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FCBC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 12:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE0FC20706
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 12:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgHXMbM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 08:31:12 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:47916 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbgHXMbG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 08:31:06 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07OCUJGr019528; Mon, 24 Aug 2020 21:30:19 +0900
X-Iguazu-Qid: 34tKBCMUDN7Chrjfou
X-Iguazu-QSIG: v=2; s=0; t=1598272218; q=34tKBCMUDN7Chrjfou; m=1e8EDyvL19dBmr/EHXLwNQbzekfMygeFd/9SXKUR1gs=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 07OCUH7g013470;
        Mon, 24 Aug 2020 21:30:18 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07OCUH1P027316;
        Mon, 24 Aug 2020 21:30:17 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07OCUHI3016588;
        Mon, 24 Aug 2020 21:30:17 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 5/8] arm64: visconti: Add initial support for Toshiba Visconti platform
Date:   Mon, 24 Aug 2020 21:29:54 +0900
X-TSB-HOP: ON
Message-Id: <20200824122957.1392870-6-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
index cd58f8495c45..dce74d34d18a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -300,6 +300,13 @@ config ARCH_VEXPRESS
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

