Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79D2C4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94E9320753
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgCTQgE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:36:04 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37269 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgCTQgE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:36:04 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N5FMB-1jN4P1383Z-011Dwq for <devicetree@vger.kernel.org>; Fri, 20 Mar
 2020 17:36:02 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 873B4650123
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 16:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id k9BT9eNzK3Yn for <devicetree@vger.kernel.org>;
        Fri, 20 Mar 2020 17:36:02 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 48E1D64F136
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 17:36:02 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:36:02 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 9E6F480504; Fri, 20 Mar 2020 17:12:02 +0100 (CET)
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
Subject: [PATCH v3 07/11] media: adv748x: only activate DAI if it is
 described in device tree
Message-ID: <ad4992170f9865f1040f6bda13452f23ea30a787.1584720678.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:fFxGd8WEtAg/VQ0vO5eIwdBT1BlBu0xz8eUGLc3iu0quNA0ef4M
 6ZPzytSa0FaFM9GzJvXXOF25wfda6wJgGdW8Vyjd79XvaDIDS9CGxkGqd7ifc+RcMXuBmWA
 eKcj5dRQwY8z+27USKM1/xGnqrInnfbZd8wRmPVI/I+JUQwLVSLxwOVjbPxiGVrZj+HTmaf
 1xN4ubXIV0PTlXUvBgGCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ruFrWWRLW2M=:yLUGHlSxu0S33b/lGTiMm2
 TGcz6zOTql6CKYOBAB+rnGIyxkJxNAffRTtuaevOH29zgbnRV+7Cqe+P2iVtFLvMotslVAY1W
 z17GoH/oPN2JDGKajwBkokUu+y5aZPqQM1cTx9KxsKiBv2VFbyZzDF4d1MCb8O8a/W9edu97H
 jFLhob1747D3d0dxDBS3ACwcaU5k7aidb+FSLImVQYILX6AreIf4y0YnmBVsMqIji3duZO09a
 BciFWU7SQPNX6kGJ8midwNy+Odqz0MLVuM9G9OxyL4/rEIz/4ohSNCwoEZOVpO/AzxgzXuVep
 M1X7rHHx0KXH2TFazSvm2CuP+xWj1rfWOQXi1SS+pi+ctujHhPFca1K/pzLgXhfY6Emg3Ohw/
 wt0jjmIlAv4FPA0H+GF3AsRcIcjJ5NvP5QMyspXYAjgdI3xVhi+QR/Z9LK2ixALVeaSyLhVAy
 5hFg+bI738WYXcxHinEz7L75Pw/05QsbG6dSGOqUU901tUcekHoMMg5gmnEziRkJmgWcowg7p
 Vw/B8WyGoSWtOttI5fZ0TGNVN0BJopHMF6ldTAxF0Zjz6L8MjIVbM18xv5yAk+4EGdJWebQMM
 Cs8dN5ebuUteLGLmmTZnVUlXSELHZzOqZ1dhmurXTQt9y7ieqKQQ8z/Omix1oDgywI8HCkwEq
 WM9anv5iusPGFbNwYTVqY0u1bk5XPhJumKj+8wbVPB/BIO88HIc9Oxe0i/QnMDkqTDg9NiEjp
 HkHHczSIE7UsjuiveS7Se5hYS36rcHgtqRAX66GdWFeuESzo7slkNSQ6yfctznyGf/YiCd+wv
 15MLfNSniuH9yBcr3zy1pEjotgnwvTd0S/+mkArXETvdJ5V6kUNLAlJk7/78ECX9Cpx+Fl6wB
 QUAPBwGB0YQxAXKfqt3xzCZ6lsJSj/aIf7D6hgbrEufCBZh1R6q1ppWBvj4Mt4xoqL8qLtD6g
 M8efZFWURVA1PHShFlcJ97McCiEbwH50=
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
index 1c673efd4745..f22566094568 100644
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


