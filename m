Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627A7C43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 10:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 403EA2070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 10:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgCZK6e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 06:58:34 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40719 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCZK6e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 06:58:34 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MxUfh-1jSdVI0Ysz-00xwIw for <devicetree@vger.kernel.org>; Thu, 26 Mar
 2020 11:58:33 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E4F256502CC
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 10:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id l4pMVAJoz0qN for <devicetree@vger.kernel.org>;
        Thu, 26 Mar 2020 11:58:32 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id A6BA2650227
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 11:58:32 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:58:32 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id DD5CD80504; Thu, 26 Mar 2020 11:35:42 +0100 (CET)
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
Subject: [PATCH v4 7/9] media: adv748x: only activate DAI if it is described
 in device tree
Message-ID: <a7112a71e23d63cb6d19188e59252689e4900c70.1585218857.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:8yHLjZKnxmLfjevVBzoLZrR+wTcM8mh4uH6Cgux8g4ylBd+tLbN
 GyTOpovqqsA9tXef8QwgKb1bbU2LIQioRg77hoiF+BqwsSxYLY44pPUfAY4/I/Amql21nm0
 oLLkYIBwSQy6AFYWBERnqmY/ztPhT/ABk/7fJOD2VC6N8Q9XZZroUE35SWyCn1DcQ0e1YJL
 I0zGfRdPfzzNnbXkr8jZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WqSgTCOyS5c=:srOcEbslKYe1gz4M7qQL3i
 9IGYiblM3rYL3CQCQ5HqaLhGpSzOhAbrStsqPfG4DziE2upCDUo/SrnCwA8G0YEyFRmRFa5RW
 VhMi95V9JjF0JioXuahV0gMvNb5KsSnlRXYOFO+zzLCZNhbUQtrMws2RsUowyx3UQDJEpUwon
 d/t4wpqo137PTnoAxx4Eqh32jgYC32KVsi2AxA0hWYQOU9CF5yoT+MsEXrHTH8u0t7NbtDCtJ
 SeLrE7mCQd2YQrFsNsyPpL8+wuPfgRHFb2R7fCfinpmgaRSybp4QWm/N3NNKf5JMru5uZcAQB
 ZRPx05NvUjdMVJeoQO1TtEDjPyuNtH2t034kGQ9RUzGw28mpPzH/dK3Ta9jsOdJU6DDAYdOwa
 0Nh6fAwrugjApdJKfGRp7XIqRVTuqsn9D210ZEdxMcaJ4/vpAsA0x32/4uo/nUv0TGYMatgU6
 mKOa0efKucCJCoogR4qDXXbTbXrloLdmW1wd5wnA+VxIGAUim1IeDKFS4GpAXr0GgTeo1nVca
 EiiUDyo2nBIyUzk8NMS/4r3jypV1r/WSOjFYI3ILIejk97WR61bEcabCtZLCfoXkn3QGcSO9a
 LTdkqVh6VVfkhRcYmhCZX7WQYgu0WMNLjwdajePRcHGpu80BBmhinrG/q3xJ0jUBoHdkmJ/ov
 R2P8iCbgqn1eRcPOHijcQ4M6+dwVL5+OiS/RmcWaSP1+A66pREXjc9ShbvJ9kTzpsA13qYdlf
 Wa1Uo1ANkNM9atR1R3ZihD0vQNnZfLOPAgtnhflqlJg36gEy1PXHZkT2c4i9M8hYMnWuEHhAJ
 5gErqZmUmG56aaDUsi3qHIfanOlX0HioMe0H25kJt2DyJHNbPciRQPctaI8jS8RqEkCre14
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


