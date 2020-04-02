Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87800C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 18:54:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66CBF206F8
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 18:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388843AbgDBSy7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 14:54:59 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42213 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732214AbgDBSy6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 14:54:58 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MCsgS-1jSqQr1pgm-008v9X for <devicetree@vger.kernel.org>; Thu, 02 Apr
 2020 20:54:57 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 30DA165073A
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gr9NcDzED-OD for <devicetree@vger.kernel.org>;
        Thu,  2 Apr 2020 20:54:56 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id D9EBC64E74F
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 20:54:56 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:54:56 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E692280503; Thu,  2 Apr 2020 20:34:48 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:48 +0200
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
Subject: [PATCH v5 6/9] media: adv748x: prepare/enable mclk when the audio is
 used
Message-ID: <d9b7a7290e3d95b484a7a760484f827c3ed7651e.1585852001.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:NpEiYbBxEnK5SamHqgieIbeGUb9f0TYhRJ9xsCMGqeFJBdHiH6r
 VIwG21rwohByeA0EiKO3Kux/ZLk8BuSnBiQB3je2ZRosqiGqHUZVva1o5hktoC4wne0fpbp
 0AvvkXEeG3aWNR+xrR7IXBlDevnCZceU28G4cHvFUgspL6zGgKw9ac+S8t2BdSFkBEmw2P0
 i43IMsMnwy0QZIt7kE9dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p1Q9zS1vfiI=:6/46+vGMEE/Sx7emEjV6oo
 57/nOL5KYMsFTEfbrqXjHKjIz28VhG3zOjj4sVBSG3Yf0bxFjZdNPXSXoDxzHBGNk4scSn6Ir
 wEallNJGksecICNGMJRzDv8tM/cIQJ2OVcnIYWuyWrVEV0vZ8NrFYtctT/q6d70BZqOjzLOE0
 5EgBXld2a05bYemKVyo8f9CjU1SQ8UCvGI7h3VdZHyfHKSVKjaFOMqCgPEAn2gH2tzg1846sK
 bUp6kvDGxKjl1bDxWSw5hQrFIM5AL47aZWZWP/tPSWx9hSa8I7pVmceJuOMntdwOL7tnEEjW7
 DWGdpgVA2f0NtH/EW6oNX3I+oQNTf+sYbcmbXVfwZ6vgVnkkv0HIFIHsrS3Lwf4Kcir8fbL2B
 Hyknh9L1ksUQorJyzB09BIQ27+v+/f4p6TdXQp9p9NNqGiyUIMaqyInB70vtpQf9rKikhOlzO
 1tULBHDVBDUHTbpzRWeBk7odvc0JMgeILtUb6X2g8JxH3bXrOOUzTzMT2GnIQZbtVeCY8aEvW
 pCFAMdZcRYd1VpWJN8EhcDGGQrir2JPSMpCpr2SeMUO561lycgnNlKpu8CXEjmmapU7Uk0rwq
 fB6s7wZEyLeauKBL16BoVcMN1vVj0h2fX4LXkymM330dMf7XFxlUiHWumIUJkBXYXz8Lx5xfG
 nN/bBxDffMoAVbwe2OAKTLtb5EIb83XWQZ7vsGsYCdSfLvekY+CJX366a5ocFzCtc3jLB1x1k
 ryB8ayocuPdX66NVKrBz5bc+2F2t5OtUqu0r+a9zNt8N2YaTdRAhpxwHfkfxD/oe6wRAngqoI
 o2tHCUuU5zLqvDHpPU3J7XcQ0f6wXwX4YfgzIqtFxQuPilqvbCaaHkfWOz8Dave/cJ79Y0U
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As there is nothing else (the consumers are supposed to do that) which
enables the clock, do it in the driver.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
--

v3: added
---
 drivers/media/i2c/adv748x/adv748x-dai.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
index c9191f8f1ca8..185f78023e91 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -117,11 +117,22 @@ static int adv748x_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
 {
+	int ret;
 	struct adv748x_state *state = state_of(dai);
 
 	if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
 		return -EINVAL;
-	return set_audio_pads_state(state, 1);
+	ret = set_audio_pads_state(state, 1);
+	if (ret)
+		goto fail;
+	ret = clk_prepare_enable(mclk_of(state));
+	if (ret)
+		goto fail_pwdn;
+	return 0;
+fail_pwdn:
+	set_audio_pads_state(state, 0);
+fail:
+	return ret;
 }
 
 static int adv748x_dai_hw_params(struct snd_pcm_substream *sub,
@@ -174,6 +185,7 @@ static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_d
 {
 	struct adv748x_state *state = state_of(dai);
 
+	clk_disable_unprepare(mclk_of(state));
 	set_audio_pads_state(state, 0);
 }
 
-- 
2.25.1.25.g9ecbe7eb18


