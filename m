Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A16BC4BA24
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DBBA2469A
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fuVmNTjj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgB0MTE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 07:19:04 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:36902 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728856AbgB0MTE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 07:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cxRWl4iygWCd5L7NHM7xlXTbfcODNKfUbcRP/HfvzfE=; b=fuVmNTjjLQntSrX2JbWGV40TU2
        u5RGclQIxqtdm1cMNNjbvsaMgBH0eDH3i1fOX8tdEDLOb246JiItTF8G0Pqp2mi7OqDi34e+Aut+W
        x/0UBruZKn+9TlAxhhT+l3bqrsB3UuqfGTyFCCPwFnOtUnDtumrp71OuZhaSWeSAV4RxEFFPAiVTL
        qskasJNfpCahSeh6aFZ+TuU5eZ0ZLMjVkdmUWJenCanvcmnNxVAy2Kz8zQC+hoZPrMUbwvcqyeEk1
        naO7XZBslhafwT60cqczc3qfgJLMIfTrHHryOgYBYDQB8lwk76GkTgWqQ0fHaoUfHjTX/JMwEl0tP
        mnkAWVSg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:58348 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7I7v-0005SJ-Od; Thu, 27 Feb 2020 12:18:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7I7v-0004dS-5u; Thu, 27 Feb 2020 12:18:51 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6qdl-sr-som-ti: indicate powering off wifi is
 safe
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk>
Date:   Thu, 27 Feb 2020 12:18:51 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We need to indicate that powering off the TI WiFi is safe, to avoid:

wl18xx_driver wl18xx.2.auto: Unbalanced pm_runtime_enable!
wl1271_sdio mmc0:0001:2: wl12xx_sdio_power_on: failed to get_sync(-13)

which prevents the WiFi being functional.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/boot/dts/imx6qdl-sr-som-ti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sr-som-ti.dtsi b/arch/arm/boot/dts/imx6qdl-sr-som-ti.dtsi
index 44a97ba93a95..352ac585ca6b 100644
--- a/arch/arm/boot/dts/imx6qdl-sr-som-ti.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sr-som-ti.dtsi
@@ -153,6 +153,7 @@
 	bus-width = <4>;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&pwrseq_ti_wifi>;
+	cap-power-off-card;
 	non-removable;
 	vmmc-supply = <&vcc_3v3>;
 	/* vqmmc-supply = <&nvcc_sd1>; - MMC layer doesn't like it! */
-- 
2.20.1

