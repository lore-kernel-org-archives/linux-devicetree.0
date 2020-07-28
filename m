Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6139C43462
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 23:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 941CA207FC
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 23:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NTvfTyzn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730357AbgG1XGO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 19:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730062AbgG1XFm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 19:05:42 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF74DC0619D8
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 16:05:41 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id g6so2806366ilc.7
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gkkN8dF77jbtS1vGZLg4Ft5o79OhcUacy/9BY4ij43c=;
        b=NTvfTyzn7yuKQsRu+f7oAnUCXZpGhRZoRB8qVTDQ/mZKTT+vPW9C2/Lj+5IFQ2V4rg
         aYTP6Z8ptRYcmAr9TYp8O0GRLE/GtHf3gac+lJrvk+yRNqCQn+Igx33pR43WqXzcD8zK
         1zZe6AKgSfAXY/6EV4quJ2vUp5PvlVu7v+j+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkkN8dF77jbtS1vGZLg4Ft5o79OhcUacy/9BY4ij43c=;
        b=bWfCF+Qy9CYxN6RN6+r6eyaoFcjHd0LVJ3yjN+zNm2U9tMS9QwN8EoyBuku9XVGIfQ
         6gtgSIpjRAgfAqfaDuB5eU4y3Bj+CJAJ5QGgxixpHMPolPgo7PaQbWy1bjk4hxqLHkEZ
         nT9bX7AuBHCcCtuiKHdgjDZGdDeJTASKZKGRjQwmyORguhW2fYKibJAOM0jQ8fL4cXRT
         QiFClFIRocgOzPLtsoLko2v4A77TkYOZfghE+oYVvAMbsmGBvwknDISeIy8RE2BzSHtw
         jZqwJOaRAJ4RKXXRcnbDX04lk8d8FjlGBrf0NabppVxny8l91+EQXOt7OWVoHt3z0s6w
         7tbw==
X-Gm-Message-State: AOAM532u+unSdibTaC2s0xKhkbpoJ3Gxfbo4I2rLrFYOIjeuyVKpCvgk
        iSRvf5N4ANUxeNfxz1BJ9ff/7WU07Z5nlQ==
X-Google-Smtp-Source: ABdhPJwwBMw63Gwfsa7f0tG7V0aLbZBvOtdOhKVf5J+4ahjDGSafaGuy9o2zXCfMrynNvGfNx53k/Q==
X-Received: by 2002:a92:2c10:: with SMTP id t16mr519626ile.24.1595977541097;
        Tue, 28 Jul 2020 16:05:41 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id w10sm148945ilo.10.2020.07.28.16.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 16:05:40 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <swboyd@chromium.org>, linux-iio@vger.kernel.org
Subject: [PATCH v2 07/14] iio: sx9310: Use long instead of int for channel bitmaps
Date:   Tue, 28 Jul 2020 17:05:13 -0600
Message-Id: <20200728170317.v2.7.Iecaa50e469918a385b3e5dab375e442540ea2ad4@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200728230520.2011240-1-campello@chromium.org>
References: <20200728151258.1222876-1-campello@chromium.org>
 <20200728230520.2011240-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Uses for_each_set_bit() macro to loop over channel bitmaps.

Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v2:
 - Changed prox_stat to chan_prox_stat bitmap.

 drivers/iio/proximity/sx9310.c | 38 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 75e85dcd6b3572..1f04ab8507ec62 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -130,14 +130,15 @@ struct sx9310_data {
 	 * Last reading of the proximity status for each channel.
 	 * We only send an event to user space when this changes.
 	 */
-	bool prox_stat[SX9310_NUM_CHANNELS];
+	unsigned long chan_prox_stat;
 	bool trigger_enabled;
 	/* 64-bit data + 64-bit timestamp buffer */
 	__be16 buffer[SX9310_NUM_CHANNELS + 4] __aligned(8);
 	/* Remember enabled channels and sample rate during suspend. */
 	unsigned int suspend_ctrl0;
 	struct completion completion;
-	unsigned int chan_read, chan_event;
+	unsigned long chan_read;
+	unsigned long chan_event;
 	int channel_users[SX9310_NUM_CHANNELS];
 	unsigned int whoami;
 };
@@ -280,15 +281,16 @@ static const struct regmap_config sx9310_regmap_config = {
 };
 
 static int sx9310_update_chan_en(struct sx9310_data *data,
-				 unsigned int chan_read,
-				 unsigned int chan_event)
+				 unsigned long chan_read,
+				 unsigned long chan_event)
 {
 	int ret;
+	unsigned long channels = chan_read | chan_event;
 
-	if ((data->chan_read | data->chan_event) != (chan_read | chan_event)) {
+	if ((data->chan_read | data->chan_event) != channels) {
 		ret = regmap_update_bits(data->regmap, SX9310_REG_PROX_CTRL0,
 					 SX9310_REG_PROX_CTRL0_SENSOREN_MASK,
-					 chan_read | chan_event);
+					 channels);
 		if (ret)
 			return ret;
 	}
@@ -531,6 +533,7 @@ static void sx9310_push_events(struct iio_dev *indio_dev)
 	unsigned int val, chan;
 	struct sx9310_data *data = iio_priv(indio_dev);
 	s64 timestamp = iio_get_time_ns(indio_dev);
+	unsigned long prox_changed;
 
 	/* Read proximity state on all channels */
 	ret = regmap_read(data->regmap, SX9310_REG_STAT0, &val);
@@ -539,24 +542,23 @@ static void sx9310_push_events(struct iio_dev *indio_dev)
 		return;
 	}
 
-	for (chan = 0; chan < SX9310_NUM_CHANNELS; chan++) {
+	/*
+	 * Only iterate over channels with changes on proximity status that have
+	 * events enabled.
+	 */
+	prox_changed = (data->chan_prox_stat ^ val) & data->chan_event;
+
+	for_each_set_bit(chan, &prox_changed, SX9310_NUM_CHANNELS) {
 		int dir;
 		u64 ev;
-		bool new_prox = val & BIT(chan);
-
-		if (!(data->chan_event & BIT(chan)))
-			continue;
-		if (new_prox == data->prox_stat[chan])
-			/* No change on this channel. */
-			continue;
 
-		dir = new_prox ? IIO_EV_DIR_FALLING : IIO_EV_DIR_RISING;
+		dir = val & BIT(chan) ? IIO_EV_DIR_FALLING : IIO_EV_DIR_RISING;
 		ev = IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, chan,
 					  IIO_EV_TYPE_THRESH, dir);
 
 		iio_push_event(indio_dev, ev, timestamp);
-		data->prox_stat[chan] = new_prox;
 	}
+	data->chan_prox_stat = val;
 }
 
 static irqreturn_t sx9310_irq_thread_handler(int irq, void *private)
@@ -713,13 +715,13 @@ static irqreturn_t sx9310_trigger_handler(int irq, void *private)
 static int sx9310_buffer_preenable(struct iio_dev *indio_dev)
 {
 	struct sx9310_data *data = iio_priv(indio_dev);
-	unsigned int channels = 0;
+	unsigned long channels = 0;
 	int bit, ret;
 
 	mutex_lock(&data->mutex);
 	for_each_set_bit(bit, indio_dev->active_scan_mask,
 			 indio_dev->masklength)
-		channels |= BIT(indio_dev->channels[bit].channel);
+		__set_bit(indio_dev->channels[bit].channel, &channels);
 
 	ret = sx9310_update_chan_en(data, channels, data->chan_event);
 	mutex_unlock(&data->mutex);
-- 
2.28.0.163.g6104cc2f0b6-goog

