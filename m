Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D536C4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6514B20753
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgCTQcn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:32:43 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49575 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQcm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:32:42 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBltK-1j7brZ2XmO-00CBqH for <devicetree@vger.kernel.org>; Fri, 20 Mar
 2020 17:32:41 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 6398B65007A
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 16:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YAUaIx70n7yM for <devicetree@vger.kernel.org>;
        Fri, 20 Mar 2020 17:32:41 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 1F6F864EFE3
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 17:32:41 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:32:41 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2CE8680503; Fri, 20 Mar 2020 17:12:02 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:02 +0100
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
Subject: [PATCH v3 06/11] media: adv748x: prepare/enable mclk when the audio
 is used
Message-ID: <7ed1287d00da70de13627480b1601bfd2c6e570a.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:eC2STgDsAzkhPBfLXG+Hxi8gv+6lf9+IQEDdr/c4aKkn5s456fR
 /U9NjBoq2BPFo1JFSJkL6Vlw2hEDTW7tWSDLgOQ/93vMCCFSeiU3fP/Knbg976yhHL/u4dd
 +VjqnlSdkYX/LoieARnfOLz4kBA79OP42pEhTuC/pA3qkeSgrsyf4jGvwnXZUrbQBIjHj1U
 seNojtU5+idqXpA4lDH2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y/lakGYveKg=:DgziO3dwYdtyqcksaU3+SV
 x9DOj3JH4imXS3M3dR4pifpGp2XyHBlKgymvBAs9PVk3qnnWEHNgvTHzGpqq3WlwnudtTgbK0
 L/BN+JZ7wqobpj+jd2QvOfAG5zvW9u8WvRa05yWPFLaHhDi1PF9WyImqsZcQ3W/6BE5UR88rL
 sPFs+Yy/k03Z+K4+b73WRqL9y5e9rmLt5auBP3oKayguAyfgOtaIwX+vudd9qp2NiAAUTuDOq
 qUq5Ew43PAc3MAhi67d4F13Ecx0kObN1AzAM62TqJwc8NwEQE3JdwBcTfrmN3w3bMzbyC1BrZ
 WHee0flg3xrr5JWlNB9eZSEz68jqVy737z0g/+yj1StbBqrVG0CwJPzz4n4cQqb5ut7I4fwzk
 jn+zp6L+3zAT4lp93nSqnqd+q9TLKyEKPBXILkKJtos9cKsxahH3GuDuJFDc9zAqgXkIA3gX2
 f8yxjiHYObeIYNPyBRz3APanb2TkWWPsTl3H5VSsH98qDPBVHAOJSpv90NxA+dMO8ovBzD28U
 tmUp7Va1skBbdqqd1Nsrd5Rx7YH627do9dTeY76VT2MxUx0psZFFetiGijIl+lFPWodvDMgzx
 +e0jNOfCtFOWBDRe6IwVrKhvElNifcDqgTm/bUvgf3mupEhvCtI3fGqHT331hWJgJpbko+QHf
 ITig37bR5vTS4AfppcP6CgLSiNVwKaxvyEpo0FHhacAvquidMqJptR3H4dSgDSJhwgTs4wLwt
 qczsf4vx6QsVXG9HQy13wuYyHY61YAe1XdpLmfj9Z6DFXwtSUEkqUsKwl1rn5NkenD6dDYeTu
 3ZcM0cxFYXWNXXJFse7W+nmzlRzUCqYBZRDeLBlz87F9dGw77lL08P5j9msyqec4vuAB9FD
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
index 6fce7d000423..1c673efd4745 100644
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
+	ret = clk_prepare_enable(state->dai.mclk);
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
 
+	clk_disable_unprepare(state->dai.mclk);
 	set_audio_pads_state(state, 0);
 }
 
-- 
2.25.1.25.g9ecbe7eb18


