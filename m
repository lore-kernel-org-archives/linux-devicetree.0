Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E64C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 16:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0E6222CF8
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 16:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DpaVc2FJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732684AbgGaQtt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 12:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733153AbgGaQtH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 12:49:07 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1E0C0617A9
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 09:49:04 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id a5so17040515ioa.13
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BwAReB8lsy+rPQCZhZhulAU/mezw6aB9DphpfGrKsXA=;
        b=DpaVc2FJN7Swl31cGGDdLNd4QDLtExtHQj252cOFmNyIqooLOWYJmFglNMOr6wFov0
         hdwQ++5zCA9AFeX1zD2mTLGt40tD3a6xg06PXhvTAsxQU5Ki6UiIi30bKx/5NIkDvoGd
         nBj/Fn/ui2Uqj1BdkQbufjE+j2eWvjszcgkE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BwAReB8lsy+rPQCZhZhulAU/mezw6aB9DphpfGrKsXA=;
        b=ipjTdRjofM5o55NuamTAqLP2LKs9UaS/xPR5SEVK+010xU9gztw8fisZjvST2V9w4S
         /QReltB/2eW1r7WDbnXVjbkPbFc6EQPWCjE4Uno5XbZ8yljCcMIt24g9/PvaEMEN6MT/
         tUWg9O/GXTFZV5yIMCbZmKbv4v8fZ7/qOV4zhvP2hdNdHbJqXJYz63uBVIVwaeXX8r0V
         ER+tEy00Mp5PSQCUmQ2S/JL8KNIqZPYWDcPnm2foln/tzTuaY9qlklNW9tXnIkvjcs/r
         eIuaLL2x2+2hxg8fd1xa2yoB85KjwlmsHjIZmzMFSzIg/mV4G9o3DIPMkea5KWLk1li6
         3qFA==
X-Gm-Message-State: AOAM532cLW8mqwiGLP8D1Bd+PVm9VEwq3V4N00mJq6p3a2id3INCofvf
        +QGfrJSRoI3n+p12lVrbuaHdyJG88bh5UA==
X-Google-Smtp-Source: ABdhPJwDqDNbJYF/O0QOkukZA9dNH0oHiP8mGGylbwTNtnTYzUmKbKgFMs8zTehITqBwiQHyYFCEzw==
X-Received: by 2002:a5e:c607:: with SMTP id f7mr4364214iok.2.1596214143665;
        Fri, 31 Jul 2020 09:49:03 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id e84sm5122083ill.60.2020.07.31.09.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 09:49:03 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <swboyd@chromium.org>, linux-iio@vger.kernel.org
Subject: [PATCH v3 06/15] iio: sx9310: Fixes various memory handling
Date:   Fri, 31 Jul 2020 10:48:43 -0600
Message-Id: <20200731104555.v3.6.I8accffd77d616cb55b29bc3021cb0f5e1da3b68a@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200731164853.3020946-1-campello@chromium.org>
References: <20200731164853.3020946-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Makes use __aligned(8) to ensure that the timestamp is correctly aligned
when we call io_push_to_buffers_with_timestamp().
Also makes use of sizeof() for regmap_bulk_read instead of static value.

Signed-off-by: Daniel Campello <campello@chromium.org>
---

Changes in v3:
 - Changed buffer to struct type to align timestamp memory properly.

Changes in v2:
 - Fixed commit message from "iio: sx9310: Align memory"

 drivers/iio/proximity/sx9310.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 2ed062d01634bc..c46584b4817b4a 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -132,8 +132,11 @@ struct sx9310_data {
 	 */
 	bool prox_stat[SX9310_NUM_CHANNELS];
 	bool trigger_enabled;
-	__be16 buffer[SX9310_NUM_CHANNELS +
-		      4]; /* 64-bit data + 64-bit timestamp */
+	/* Ensure correct alignment of timestamp when present. */
+	struct {
+		__be16 channels[SX9310_NUM_CHANNELS];
+		s64 ts __aligned(8);
+	} buffer;
 	/* Remember enabled channels and sample rate during suspend. */
 	unsigned int suspend_ctrl0;
 	struct completion completion;
@@ -346,7 +349,7 @@ static int sx9310_read_prox_data(struct sx9310_data *data,
 	if (ret < 0)
 		return ret;
 
-	return regmap_bulk_read(data->regmap, chan->address, val, 2);
+	return regmap_bulk_read(data->regmap, chan->address, val, sizeof(*val));
 }
 
 /*
@@ -697,10 +700,10 @@ static irqreturn_t sx9310_trigger_handler(int irq, void *private)
 		if (ret < 0)
 			goto out;
 
-		data->buffer[i++] = val;
+		data->buffer.channels[i++] = val;
 	}
 
-	iio_push_to_buffers_with_timestamp(indio_dev, data->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, data->buffer.channels,
 					   pf->timestamp);
 
 out:
-- 
2.28.0.163.g6104cc2f0b6-goog

