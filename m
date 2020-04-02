Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357ABC43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 18:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14F55206F8
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 18:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389013AbgDBS6U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 14:58:20 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46525 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389103AbgDBS6U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 14:58:20 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MCKJw-1jSIWG28Go-009Om2 for <devicetree@vger.kernel.org>; Thu, 02 Apr
 2020 20:58:18 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 3EF70650882
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 18:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JLLxZSsd7gY3 for <devicetree@vger.kernel.org>;
        Thu,  2 Apr 2020 20:58:17 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id F139B64F705
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 20:58:17 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:58:17 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2CFF680504; Thu,  2 Apr 2020 20:34:59 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:59 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v5 7/9] media: adv748x: only activate DAI if it is described
 in device tree
Message-ID: <c3c8ece14c0fbc987dc201c9b61dd22d98f83056.1585852001.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:JaUZ1RpmIYolYMNA4BO3iZerdNoo404qeAbB0q7nmWFmz74yvk0
 xtk1OLdzp8UE/MyOx6sAIVWtaqPC9OjjJhgI07XzSJDguN6paYhUR9LLMupW4quKGEB2FCU
 VJxOAHN0uQksY+xXPUfGDG/VbvKdC7lh57DbG0UVHAcvlhHF6BxHtJ4jEt0CD4qOgE7Jp6M
 xRuFPZvUeQYvJcSA/a1JA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A/uZQhYSBVU=:B5dsAgxtQkyDMDlrXzdX9n
 C4Z/bzUnULBGVwEDb0Bf6qudFSwPTuY4y1UfBfhoD1i7Nn/H0+CquUNcaf0NR91MPv0X4KXuD
 u+Mx4iruPdWg66DSk1TQFnxaJ0E9FJPoI6b8e5Cw1vEa4FPlz0aQPFIy5hot/2uyTgGNMOlVC
 wCgmeEsp4mzem65YGGbJcrBrNxY5xU7ilpmFPgOeOcxFY/zyYbU1S10Yk6nab9S0KaqqqW4Vz
 RN/tGz0Y5HWhpIn7aVxMdTA+H+fOExNiISRMdbTauj1ic3hoMrVdeoyCXkv6VCr+GGpKTZ3fX
 k/OKsa3RA0R2t7UBnQofhFhWhz6JOoTnXPSHTn5X07k+bgG6u48KwgFHclxGsHDNjrcuquCl2
 DL8QXRaxitG3FKrgfMFFea2BdM5RLlJgP0lM8rm/pjXc4GP6G6lSsbn3SrTGdQUeT2Ozuqw4G
 w2f/fVW2NOG0LIPx88lFwYiUSUL3bCTq4lYH/aKjkAtf2rLD/aSwDy15pFDnBlMxtjVIprey4
 HeIVO8znnULcKslAtkaF/rDtnZaXUFrwJ/ESOvD0jl8MhcIvEm5XzOA1Pon+rOCFV19OFrz9z
 XJZ/Km0pJpd3uvyYPAtIiUGwtlNod66WW0MOW7TfxV1kusFQ4A0+HML8Eazp/oxbTmZ0NijJJ
 hpx3nUJ3CTbc1RoZLuae+/Py0E+iO+QC5eWER4fGlN4UAmVw/QY8/bt4DFHQcrl5abCE7Fz80
 FTyt3qPfYoGp7MUSMuimmXXTCfEKuPIqbblA/3gYyrDU74L6B6CuV1V1p/zDESNYhtMdkI2Wd
 lHMRl351GvN1uo9hlT4oLgpWk6smDvfufB790BqcyChCLB3Ox3x8jFwyyhat/uXnGP2Z13B
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

To avoid setting it up even if the hardware is not actually connected
to anything physically.

Besides, the bindings explicitly notes that port definitions are
"optional if they are not connected to anything at the hardware level".

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-dai.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
index 185f78023e91..f9cc47fa9ad1 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -216,6 +216,11 @@ int adv748x_dai_init(struct adv748x_dai *dai)
 	int ret;
 	struct adv748x_state *state = adv748x_dai_to_state(dai);
 
+	if (!state->endpoints[ADV748X_PORT_I2S]) {
+		adv_info(state, "no I2S port, DAI disabled\n");
+		ret = 0;
+		goto fail;
+	}
 	dai->mclk_name = kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
 				   state->dev->driver->name,
 				   dev_name(state->dev));
-- 
2.25.1.25.g9ecbe7eb18


