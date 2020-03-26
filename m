Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D73C43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 10:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3496B2070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 10:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgCZKvv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 06:51:51 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51555 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgCZKvv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 06:51:51 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLz3X-1j0AD913wn-00HsZK for <devicetree@vger.kernel.org>; Thu, 26 Mar
 2020 11:51:50 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 1566264E3E5
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 10:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vV49fU7-Z-tI for <devicetree@vger.kernel.org>;
        Thu, 26 Mar 2020 11:51:49 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id C495E64C07F
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 11:51:49 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:51:49 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 220CD80503; Thu, 26 Mar 2020 11:35:42 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:42 +0100
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
Subject: [PATCH v4 6/9] media: adv748x: prepare/enable mclk when the audio is
 used
Message-ID: <c4469e5897f0974c3e6eaba7cd1d4be983cf84a9.1585218857.git.alexander.riesen@cetitec.com>
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
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:7oBX+Q0Fp9CFfoF/EQpCv+fePyu+sQekDBsf9GW34EDbT40cppE
 J2pmXjTcCKlwAF83c3XSrbIR4h2TjFRwBZ70l2Zke2dsVXdx2igsJAUbEXq3KQKFJYwDkvg
 s4E8I7+VSUvnLRIve6mGti/2MmGLDkVc65qGN5odXNpuMb2RsoGafn15701K9kunw0tuna6
 I2ogRR3meHooYPOq7Ugwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+s56+bmnHzg=:mHQuGdmrkvTyM6Diw5uOTL
 y8lXrzTu68dEs6TrQO9SzUpdzGRC/vbbu/X+nYvi+FDdvd5HVebW7jvIKMPEKcO/pxhYDRFy1
 RqLZ4y3vjpwrikbg1XfMCzerplbae5cOWm4fdll6gJj54m618damOtIHvDfoEd8UgVUO1Y+I1
 3aBfEK3ujINmNCaxIQImQ2m70Yv72qbhKZLMaiNigtx5yXhpgmCaavf6wKVEpdcMJZNDjfHml
 abSgKcet9QZ3dOPthOyLqoFMY4NYrrBj83mUhh/pbD+6xY1OmElIxxTOhMzEnqW9i/EjCCse1
 BuebDquXOYr6ZBnnHPqhhM3j8D6eLjJYs20AYPRs3kwkhidGtMGwVvoJfEvw61ZsRpzrTYVp1
 FxSt1mRhm2vHyoiSZcWsXdYcqbK9vzwnYCrjnPRdzi/ntUdllLcckps0JRJNw9w2YdYb2vjGo
 3gcHgPQBSOis0CwuaJSc/v2qdAhFLfYPScqf2uiK+2Ozzd2BR9eq8KJ4/7zhr5aEMci5tSd5F
 Dzpc8VDEZjt3XO502B4Q+YYo7zqsj0wxUA/fNABhWHJmLxq1YcQr1blQyKn5OLJWzBQ7PxIo9
 HFdRGYQCSmtUbUFddybHkUqFahKZlbzWsgcdfpbAtUc8gurBj1fYja/Wn9stHtL3kayYdBjac
 z5n8wq9MNmgA3Zi2H1Fp8mwOep9LBuCZFbLjeGhqpqzfL2Aht9GGxzVcJPtV1+VWGp+zmtlxv
 7ehfl8zN+pmTlmEKRgk/l3KMbzKFVxkxx557nsijireUR7+92fo3UW86hE5CatGOGmfRvkCjJ
 Hu5WZRlLs+ZMW+m4APDNoj7hPtt1s1SAZih+mws5oCjd96PAVe8M6Y4xyoP9fUJCrpDc4xa
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


