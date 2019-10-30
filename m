Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC62CA9EC7
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 15:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20663218AC
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572451036;
	bh=eh+r0jQVLaPFfkmVGlO/vREfE61KcjAS/0XfFkgqjE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=VB1IAPL//0iykEmicdrW094QNWriijKU7Z7KgENOMdy3j2WNXsdSsWd4SI7y/8Wcx
	 BXnnBS5PHiceNXP7mZ+Oj3rXZNoRrfCVJnUmFWnDuUk+bZHX5Iip5IV8nnpjWyZ+Dq
	 czJ2OUTN3A7TbMrlRO0hXhtB0isD/31327a67b4Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729000AbfJ3P5P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 11:57:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728995AbfJ3P5O (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Oct 2019 11:57:14 -0400
Received: from sasha-vm.mshome.net (100.50.158.77.rev.sfr.net [77.158.50.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68F8721882;
        Wed, 30 Oct 2019 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572451033;
        bh=eh+r0jQVLaPFfkmVGlO/vREfE61KcjAS/0XfFkgqjE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HOxzAMAEVROia8DrxO91W2/TSr0VXhy+RzWyQDlDIxaHUWrJu+lXEhsPOhMgIRm3p
         vxsIHfi0H7dEadnjRSpcR+BXlZLU0IeyyiIet0uXKWDL7SNzHbZ8uDsR+Z5c+aF/U8
         XyrHE0dFBZx8yVSJt4pU5cBE2xOv+k45wDt3Sta0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 05/18] ARM: dts: logicpd-torpedo-som: Remove twl_keypad
Date:   Wed, 30 Oct 2019 11:56:47 -0400
Message-Id: <20191030155700.10748-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030155700.10748-1-sashal@kernel.org>
References: <20191030155700.10748-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Adam Ford <aford173@gmail.com>

[ Upstream commit 6b512b0ee091edcb8e46218894e4c917d919d3dc ]

The TWL4030 used on the Logit PD Torpedo SOM does not have the
keypad pins routed.  This patch disables the twl_keypad driver
to remove some splat during boot:

twl4030_keypad 48070000.i2c:twl@48:keypad: missing or malformed property linux,keymap: -22
twl4030_keypad 48070000.i2c:twl@48:keypad: Failed to build keymap
twl4030_keypad: probe of 48070000.i2c:twl@48:keypad failed with error -22

Signed-off-by: Adam Ford <aford173@gmail.com>
[tony@atomide.com: removed error time stamps]
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
index ceb49d15d243c..20ee7ca8c6534 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
@@ -266,3 +266,7 @@
 &twl_gpio {
 	ti,use-leds;
 };
+
+&twl_keypad {
+	status = "disabled";
+};
-- 
2.20.1

