Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD31C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 18:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C06052064A
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 18:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388218AbgDBShy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 14:37:54 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36257 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBShy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 14:37:54 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MkYkI-1iuLUs0I9u-00m2eB for <devicetree@vger.kernel.org>; Thu, 02 Apr
 2020 20:37:52 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id CF93264F878
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 18:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XLCmywchfF1T for <devicetree@vger.kernel.org>;
        Thu,  2 Apr 2020 20:37:51 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 6B10264CFAE
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 20:37:51 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:37:51 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 81892804FD; Thu,  2 Apr 2020 20:34:00 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:00 +0200
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
Subject: [PATCH v5 1/9] media: adv748x: fix end-of-line terminators in
 diagnostic statements
Message-ID: <2f2460435afa594ef417e70068b125af97ddca39.1585852001.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:trdZMVAr2y5P4VAgB0SW8MHcgwcAyfU1OV14wMM8bdPLG9K7Kdl
 1JoiGu0JY3pJ6N5VwYY7qXPxSoh9Tsx3bPgESrw3JNbh7WaRLCA9ad4ClsvxNVJQVik/6Co
 QQ2eYfnga+PSurMbfnRGEgY1yH4RFqzTANSOhkf9EAZRKZYjnTqU/nxaJePJyGa5jgYHbvy
 a23c2l3s/KeekbZZH6OLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G3UtkalUYYA=:PGyo/idljG0JGrCe0wcnBn
 jEwpqxfYyJ61Vw2RjK0oZY8csArSA0qVZQ+ZlZlTNMsdB804kjvJ+dhGSRnMN7DaNVF6UaOJy
 0yXILAWLXsjQTcWFHqxOkcjUIvDxLWxSuJrm3EnuJJIWTQAKwRYWgEREJZJV7TZNtubnA4h5i
 dazrTqUaHvCFv2CF0pI4ZUHh30ZRpHAZXdKtOyiXno4ePCo+l5JYj2/f11u7nGMPUeIg5AE9u
 T1Rz0orsd9F7vYT6Xp9MadQ2HWqsOz6w0anZzaxVM8zzjkXNUamJmye6lvhpEQTcwVC0ohB2q
 hdVnfFh4s3BeYu7taXi0GmHFtJCNcgNIVblKqLV2RVMwP9ifaDMKTDYyRiI0UAteEgaJxX5in
 NyNLC1wBFh245BwgEonFpC+4AVRKO85FMK94YZHQL1exXXXqfdjFMYsgbzRfr3AgOimsTZocZ
 qm4m7buaOK79B8KvcCkZ4Eik6ov1nvODo18ceMS4DSBnP3dAPN2VXNAWbGC4s7IBM5vyQHmXZ
 2Rg1cR8Fv29FZwig0WMloscA1NfLdujXXiV0JVYCSGPhoeT3D1LZlLuYN3ucMl7Uz2+sDsNdX
 R+DipJaXgOlTG2okp/pjezNxQ1XTNMembHlXF0keD8j8I7CdxzUkaewDyXRMwGcNc4pK5ry9B
 1GLeJB6Ru/p+hCq65zVdrOOnzCmwvXC2I+fbfACvJJXN6YJjZutH8WUvJ6aAye4NfjiEJNxJW
 LxViHKwBSDoTZPA3B4DChqgZh1XZSN0oReAuX/D1qVb45V3Fp1kzJMJMgX3EQD7mMPKt7BkeP
 ayuMXg1B2+kyOBeckw0t8RfJUpezuatmpwnG6gewlLcHyvliDAlyi2vdCynUe2QISCo5BSv
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 24 ++++++++++++------------
 drivers/media/i2c/adv748x/adv748x-csi2.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 23e02ff27b17..c3fb113cef62 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -623,11 +623,11 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
 		of_graph_parse_endpoint(ep_np, &ep);
-		adv_info(state, "Endpoint %pOF on port %d", ep.local_node,
+		adv_info(state, "Endpoint %pOF on port %d\n", ep.local_node,
 			 ep.port);
 
 		if (ep.port >= ADV748X_PORT_MAX) {
-			adv_err(state, "Invalid endpoint %pOF on port %d",
+			adv_err(state, "Invalid endpoint %pOF on port %d\n",
 				ep.local_node, ep.port);
 
 			continue;
@@ -635,7 +635,7 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 		if (state->endpoints[ep.port]) {
 			adv_err(state,
-				"Multiple port endpoints are not supported");
+				"Multiple port endpoints are not supported\n");
 			continue;
 		}
 
@@ -702,62 +702,62 @@ static int adv748x_probe(struct i2c_client *client)
 	/* Discover and process ports declared by the Device tree endpoints */
 	ret = adv748x_parse_dt(state);
 	if (ret) {
-		adv_err(state, "Failed to parse device tree");
+		adv_err(state, "Failed to parse device tree\n");
 		goto err_free_mutex;
 	}
 
 	/* Configure IO Regmap region */
 	ret = adv748x_configure_regmap(state, ADV748X_PAGE_IO);
 	if (ret) {
-		adv_err(state, "Error configuring IO regmap region");
+		adv_err(state, "Error configuring IO regmap region\n");
 		goto err_cleanup_dt;
 	}
 
 	ret = adv748x_identify_chip(state);
 	if (ret) {
-		adv_err(state, "Failed to identify chip");
+		adv_err(state, "Failed to identify chip\n");
 		goto err_cleanup_dt;
 	}
 
 	/* Configure remaining pages as I2C clients with regmap access */
 	ret = adv748x_initialise_clients(state);
 	if (ret) {
-		adv_err(state, "Failed to setup client regmap pages");
+		adv_err(state, "Failed to setup client regmap pages\n");
 		goto err_cleanup_clients;
 	}
 
 	/* SW reset ADV748X to its default values */
 	ret = adv748x_reset(state);
 	if (ret) {
-		adv_err(state, "Failed to reset hardware");
+		adv_err(state, "Failed to reset hardware\n");
 		goto err_cleanup_clients;
 	}
 
 	/* Initialise HDMI */
 	ret = adv748x_hdmi_init(&state->hdmi);
 	if (ret) {
-		adv_err(state, "Failed to probe HDMI");
+		adv_err(state, "Failed to probe HDMI\n");
 		goto err_cleanup_clients;
 	}
 
 	/* Initialise AFE */
 	ret = adv748x_afe_init(&state->afe);
 	if (ret) {
-		adv_err(state, "Failed to probe AFE");
+		adv_err(state, "Failed to probe AFE\n");
 		goto err_cleanup_hdmi;
 	}
 
 	/* Initialise TXA */
 	ret = adv748x_csi2_init(state, &state->txa);
 	if (ret) {
-		adv_err(state, "Failed to probe TXA");
+		adv_err(state, "Failed to probe TXA\n");
 		goto err_cleanup_afe;
 	}
 
 	/* Initialise TXB */
 	ret = adv748x_csi2_init(state, &state->txb);
 	if (ret) {
-		adv_err(state, "Failed to probe TXB");
+		adv_err(state, "Failed to probe TXB\n");
 		goto err_cleanup_txa;
 	}
 
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..c43ce5d78723 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -72,7 +72,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
 	struct adv748x_state *state = tx->state;
 	int ret;
 
-	adv_dbg(state, "Registered %s (%s)", is_txa(tx) ? "TXA":"TXB",
+	adv_dbg(state, "Registered %s (%s)\n", is_txa(tx) ? "TXA":"TXB",
 			sd->name);
 
 	/*
-- 
2.25.1.25.g9ecbe7eb18


