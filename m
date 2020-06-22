Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0378CC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 15:23:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1CA920739
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 15:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QIqapg7U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgFVPXy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 11:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729205AbgFVPXx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 11:23:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9075AC061573
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 08:23:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id t194so16149178wmt.4
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/6MBthvd6z52RmcbVSvKwI0rMiVPtPQAGgLYFja/1c8=;
        b=QIqapg7UGAmb7VCS9WiE39Ucx7flL+0/1f0tX4gViGTqA0Dt1WWk0CfUL0bB1CWZe1
         0F5wNMEyPlkrayB6yKdsbfAtGYkWKvzorXou4ujarZc+GnvkTtj4XYGaSJPqC8i+g6CB
         M2cjdIbSGr+aE2ZeRyC67jAkGhOSWxxIkT/GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/6MBthvd6z52RmcbVSvKwI0rMiVPtPQAGgLYFja/1c8=;
        b=TJ3z7jk5uDrfNEA82+COyYtrPw/B5ESW/Xh1KD1rm483IhT5kydoGMibTCzVFkTNIJ
         ckd0DRdpTc/O1Tj3iDO8LF2zGp6b1ZYZuRvHD/F1RVMJQYCxrxhPwVhzEnj6pIxr9D/g
         0rnNQRYRxysiSCEAa9XJZeDU1htzXISYmS0BCd/S7FW4uZK5EKQ8urPQ7KFeZ7hvcBnj
         9Ukh0ViYsd1F+leTgy5BRkynsRjR1uMn8YpPmLfFThH8tvEaEQZ9QNL/9Kip5TWQTnOn
         xtDF98mee9nzCwQsXqxPk26sHuQMV14Cu2OPOOTbtT9m6e5oDIVo7p0jlcrovEaJB2EC
         ZAsQ==
X-Gm-Message-State: AOAM53303WP/YLzhanHWZexysRg7jrVJfEO0b7pEQcAJqZ3OCXoXoibg
        +LdX1V0v+ZFKUU6uRPVSSAytbQ==
X-Google-Smtp-Source: ABdhPJzBqoqGaZ3AGchbWoNgqa479fduCq/sAUf3WneGLyZ7HwXh6yxNJZvcIOQjzKi5Q3M8R73oyQ==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr7854723wmh.165.1592839432304;
        Mon, 22 Jun 2020 08:23:52 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id m65sm16890177wmf.17.2020.06.22.08.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 08:23:51 -0700 (PDT)
Date:   Mon, 22 Jun 2020 15:23:50 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200622152350.GB260716@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
 <20200618191026.GA73379@chromium.org>
 <1592639284.8804.712.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592639284.8804.712.camel@mhfsdcap03>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jun 20, 2020 at 03:48:04PM +0800, Dongchun Zhu wrote:
> Hi Tomasz,
> 
> Thanks for the review.
> 
> On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> > 
> > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1057 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > 
> > 
> > Thank you for the patch. Please see my comments inline.
> > 
> > [snip]
> > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > +			   struct v4l2_subdev_pad_config *cfg,
> > > +			   struct v4l2_subdev_format *fmt)
> > > +{
> > > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > +
> > > +	mutex_lock(&ov02a10->mutex);
> > > +
> > > +	if (ov02a10->streaming) {
> > > +		mutex_unlock(&ov02a10->mutex);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	/* Only one sensor mode supported */
> > > +	mbus_fmt->code = ov02a10->fmt.code;
> > > +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > +	ov02a10->fmt = fmt->format;
> > > +
> > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> > 
> > If fmt->which is V4L2_SUBDEV_FORMAT_TRY, the internal driver state must not
> > be affected. It also should not depend on whether the sensor is streaming
> > or not. Basically it should be considered a special "candidate" format,
> > which isn't programmed to the hardware, but just stored aside.
> > 
> 
> Hmm. Maybe we shall use FORMAT_TRY like this:
> struct v4l2_mbus_framefmt *frame_fmt;
> ...
> if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> 	frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> else
> 	frame_fmt = &ov02a10->fmt;
> 
> *frame_fmt = *mbus_fmt;
> 
> (Remove 'ov02a10->fmt = fmt->format;' above)
>

Yes, I guess that should work. Also the ov02a10->streaming condition
shouldn't be checked if fmt->which is V4L2_SUBDEV_FORMAT_TRY).

Best regards,
Tomasz
