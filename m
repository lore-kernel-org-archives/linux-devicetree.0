Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171EBC33C99
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED71820730
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfKOQIb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:08:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34571 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfKOQIb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 11:08:31 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVe90-0002S7-MC; Fri, 15 Nov 2019 17:08:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVe8y-00047J-7C; Fri, 15 Nov 2019 17:08:20 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, KCHSU0@nuvoton.com, broonie@kernel.org,
        thomas.fehrenbacher@siedle.de
Cc:     kernel@pengutronix.de, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] ASoC: nau8810: add aux input control, available on NAU8812
Date:   Fri, 15 Nov 2019 17:08:19 +0100
Message-Id: <20191115160819.15557-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115160819.15557-1-m.felsch@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thomas Fehrenbacher <thomas.fehrenbacher@siedle.de>

This commit adds the support to control the aux-port on the nau8812
devices. We don't need to differentiate the aux-port registers since
those bitfields are set to '0' on the nau8810 devices [1,2].

[1] http://www.nuvoton.com/resource-files/NAU8810_Datasheet_Rev_2.8.pdf
[2] http://www.nuvoton.com/resource-files/NAU8812DatasheetRev2.7.pdf

Signed-off-by: Thomas Fehrenbacher <thomas.fehrenbacher@siedle.de>
[m.felsch@pengutronix.de: add commit message]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/codecs/nau8810.c | 7 +++++++
 sound/soc/codecs/nau8810.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index a32a4a8d5f50..b1024d24d413 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -351,6 +351,9 @@ static const struct snd_kcontrol_new nau8810_snd_controls[] = {
 		NAU8810_DACOS_SFT, 1, 0),
 	SOC_SINGLE("ADC Oversampling Rate(128x) Switch", NAU8810_REG_ADC,
 		NAU8810_ADCOS_SFT, 1, 0),
+
+	SOC_SINGLE("AUX Input Enable Switch", NAU8810_REG_POWER1,
+		NAU8810_AUX_EN_SFT, 1, 0),
 };
 
 /* Speaker Output Mixer */
@@ -383,6 +386,8 @@ static const struct snd_kcontrol_new nau8810_inpga[] = {
 		NAU8810_NMICPGA_SFT, 1, 0),
 	SOC_DAPM_SINGLE("MicP Switch", NAU8810_REG_INPUT_SIGNAL,
 		NAU8810_PMICPGA_SFT, 1, 0),
+	SOC_DAPM_SINGLE("AUX Switch", NAU8810_REG_INPUT_SIGNAL,
+		NAU8810_AUXPGA_SFT, 1, 0),
 };
 
 /* Loopback Switch */
@@ -436,6 +441,7 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 
 	SND_SOC_DAPM_INPUT("MICN"),
 	SND_SOC_DAPM_INPUT("MICP"),
+	SND_SOC_DAPM_INPUT("AUX"),
 	SND_SOC_DAPM_OUTPUT("MONOOUT"),
 	SND_SOC_DAPM_OUTPUT("SPKOUTP"),
 	SND_SOC_DAPM_OUTPUT("SPKOUTN"),
@@ -470,6 +476,7 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
 	{"Input PGA", NULL, "Mic Bias"},
 	{"Input PGA", "MicN Switch", "MICN"},
 	{"Input PGA", "MicP Switch", "MICP"},
+	{"Input PGA", "AUX Switch", "AUX"},
 
 	/* Digital Looptack */
 	{"Digital Loopback", "Switch", "ADC"},
diff --git a/sound/soc/codecs/nau8810.h b/sound/soc/codecs/nau8810.h
index 1ada31883dc6..7b5ecad173d3 100644
--- a/sound/soc/codecs/nau8810.h
+++ b/sound/soc/codecs/nau8810.h
@@ -69,6 +69,7 @@
 
 /* NAU8810_REG_POWER1 (0x1) */
 #define NAU8810_DCBUF_EN		(0x1 << 8)
+#define NAU8810_AUX_EN_SFT		6
 #define NAU8810_PLL_EN_SFT		5
 #define NAU8810_MICBIAS_EN_SFT	4
 #define NAU8810_ABIAS_EN		(0x1 << 3)
@@ -229,6 +230,7 @@
 /* NAU8810_REG_INPUT_SIGNAL (0x2C) */
 #define NAU8810_PMICPGA_SFT		0
 #define NAU8810_NMICPGA_SFT		1
+#define NAU8810_AUXPGA_SFT		2
 
 /* NAU8810_REG_PGAGAIN (0x2D) */
 #define NAU8810_PGAGAIN_SFT		0
-- 
2.20.1

