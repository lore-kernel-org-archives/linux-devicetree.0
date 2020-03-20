Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644A3C4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:49:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36B8620739
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgCTQtb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:49:31 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34505 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbgCTQtb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:49:31 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MHWzP-1j2MPY2kZF-00DZL2 for <devicetree@vger.kernel.org>; Fri, 20 Mar
 2020 17:49:29 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 57CE864CB8C
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XBOAgOSNzifs for <devicetree@vger.kernel.org>;
        Fri, 20 Mar 2020 17:49:29 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 0FE6864E621
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 17:49:29 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:49:28 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 86EAC80509; Fri, 20 Mar 2020 17:12:06 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:06 +0100
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
Subject: [PATCH v3 11/11] media: adv748x: allow the HDMI sub-device to accept
 EDID
Message-ID: <4fce566b68bbe4f85cf92cd80a455b575a5d95d1.1584720678.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:9QhVnscYZc3O2XeqJMPDRRbWO4aQYyebSUL5iJqeUeTV3zf8jLh
 ECM8CW7PMcSDgtbybX22AZj3Udvaep+16ccp1tDyHVUFWoi3OXtaGItCXsSfe1YrxRJnLpd
 MszAXrRxXAKIbU4jCwDULMm5pmRimRCqVAvKI61Gsu+46iG47Tg859kKpu6uQDS8YO1SpUC
 krKPgvw66wtnQNCEcmA/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rtqGN5H+7iQ=:Gci4EYQfNirdjwPufR+TqY
 D8GlDJBM5X7fuFAuadU6KaiE2CSjItgDZUvz6BOW5KeQV4kp2R7b8wCBepzPe4+p+wRYqOalv
 l9wvUs1hGh43oIIRVtOt8nOhS+jbrqbjtGoSCZIHdWinxML1sKSDR8JuRrrnB+85YvdxiQ1Mj
 BV+nj1l8mpqlN9FdxMlaqjk/AooLl/niyDlJKhU/lhFEIZdfqID1JSy4N8lEQAidr2NS8jOr8
 KWbSXcONgIamwu5HNvravH37ZtA/6YTXuZrBLn7F0fOkGvst/mIkp/nx60XzZgCUmNnvPfxNw
 Vzd35nXXdbARnMkzhb846u3hsQuHO/9zKZf1Zyuc+gqGHVnEduCq09CriTLE6Lev0r/BnLFma
 DYOiGDXY7kWTWxnO/FmVDewPWKb+aHWBEpBIsu96dbAne4y1nRqef+yCgisj4uo3v8QoYcDQi
 0KWnckOL8WKIPA316a8I2GS7u/VSkike9PPRz2uTlvFA9znwExWeYWdfirn14JZL9PrwQF/lG
 b6ANIy/b73/KTBiYd6CxrfNC7mBVbJCYhmPOXMIjdM1v9BYdRXUmTdhcCIYs2gIckSxXe8zBX
 M7cw0J+zpi5uT7o90AZ5nFY7zqRwIxUe54gMd3VGC2SjUfDwEebYegZoPJvJ0BoOM8+h3cHck
 34iATpuQMntaKLOVtqkb4EElS5uwZIL5qQeWQJbVb59iMSLslxmrKb9BX1O+54+FHk5yCG2WP
 OBU8BiQ7G5Yp+uABQf3yKdAKa7qtbybrCCTWvi7JACAxteFk3X/H1hGWOvEHUNFsdP3xBWB0u
 Zw8c9pvTe/vYxZ/WcVof9nIW7XX+tzN6DXJRUzIMBxd3AJtRPAyZ0z3UcbyzW1PG60MUOxm
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This makes it possible to load a EDID reported by the device
with v4l2-ctl utility:

  vdev=/dev/$(grep -l '^adv748x.*hdmi$' /sys/class/video4linux/v4l-subdev*/name |cut -d/ -f5-5)
  v4l2-ctl -d $vdev --set-edid=pad=0,file=/etc/adv7482.edid

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>

--

I would like to avoid doing that, but found no other way yet.
Suggestions very welcome.
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 664930e55baf..fea133472911 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -775,7 +775,34 @@ static int adv748x_hdmi_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
+static long adv748x_hdmi_querycap(struct adv748x_hdmi *hdmi,
+				  struct v4l2_capability *cap)
+{
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+
+	cap->version = LINUX_VERSION_CODE;
+	strlcpy(cap->driver, state->dev->driver->name, sizeof(cap->driver));
+	strlcpy(cap->card, "hdmi", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "i2c:%d-%04x",
+		 i2c_adapter_id(state->client->adapter),
+		 state->client->addr);
+	cap->device_caps = V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS;
+	return 0;
+}
+
+static long adv748x_hdmi_ioctl(struct v4l2_subdev *sd,
+			       unsigned int cmd, void *arg)
+{
+	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
+
+	if (cmd == VIDIOC_QUERYCAP)
+		return adv748x_hdmi_querycap(hdmi, arg);
+	return -ENOTTY;
+}
+
 static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
+	.ioctl = adv748x_hdmi_ioctl,
 	.log_status = adv748x_hdmi_log_status,
 };
 
-- 
2.25.1.25.g9ecbe7eb18

