Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D821EC33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:16:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F5682077C
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i64XnSVK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgATIQj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 03:16:39 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36383 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgATIQi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 03:16:38 -0500
Received: by mail-lf1-f67.google.com with SMTP id f24so2205899lfh.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 00:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=32qSjrlmgTQ7SJtLpH0BG/gMi8aameyFBWW4CPPRTsg=;
        b=i64XnSVKIi3G41VBkcx/pnISdsA3nAP2SEa2eiFheZ6KWEi17hD3aQe3UqwsQCKqWN
         fPvtvQwDFHZePoznFlOCTq7eureO8pOGpcuwVlR1yEiS3H2zuF6K4VrhIMcOQMhRoUgY
         +571jPkmOQpS+NMtWQQZo9YLYzXxvw26V6SErsvmf/JPFbRZ2q8nWGX9cNBY18/pe6gE
         8Ulda7zDN9tMREZ/+SEZtYABCNmR3QrIR7rW2rvCTd9u8CPP7V6lGAwjz+eyT4noyz7s
         sY3gPnCu/3tDRv8iKfpYNp1Kfz4ft+IQl8z+2Zwlo9gNMtZD1belAT3JAEOk1BCDKYAQ
         U4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=32qSjrlmgTQ7SJtLpH0BG/gMi8aameyFBWW4CPPRTsg=;
        b=Cd9tJ5TnFB/eTqvq7D3zgokFSkoJiqpIS2oEevy4rz5qbQUdWL+Z/a0cS0+PnP44Vv
         +IrU4irv9p9AOA/MQNoW9Jb0pbbGSMF3koT+UfQxRnEJSD5GYSMxdkVhPXw7n578YE1h
         a7HWzL+F3EIJebXFvZ/F50DsL3M2WPzanjb0dB87xhNEqCmYclDhHSp1+y7egRUqq624
         U51o+s8MCfAQO+4hrqYwva957BwpW9GRlDeZc5NTP2B8+FKOiRg//jTO/nnKNopDKjfc
         wly+FPHJZXp+pdrJLo6Iedu6P9JiKZKwSFzho/6r10EaSqOUdu2zpqIw198fZXVO0br4
         xc+Q==
X-Gm-Message-State: APjAAAWcHLLP54+deVVxxxu/oUO7Gvx6gyE+VTbop640O0jhX3xu7Pp+
        NWd8oZMBwZxOGguo8B8+99Xcxg==
X-Google-Smtp-Source: APXvYqwhwOCZnRex8L/j8NGhZuDJGjm6ZYIGT9mZDPghbEIMlrcb+roier0byMNeGE/1ALC9USVoZQ==
X-Received: by 2002:a19:9d5:: with SMTP id 204mr3931489lfj.120.1579508196781;
        Mon, 20 Jan 2020 00:16:36 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id m21sm16261977lfh.53.2020.01.20.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:16:35 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@iki.fi, peter.griffin@linaro.org,
        dave.stevenson@raspberrypi.com, ezequiel@collabora.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 0/2] Add IMX219 CMOS image sensor support
Date:   Mon, 20 Jan 2020 11:15:56 +0300
Message-Id: <20200120081558.25258-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support for IMX219 CMOS image sensor from Sony.
Sony IMX219 is an 8MPix, 1/4.0-inch CMOS active pixel digital image sensor
with an active array size of 3280H x 2464V. It is programmable through
I2C interface. Image data are sent through MIPI CSI-2, which can be configured
as either 2 or 4 data lanes, but this driver currently only supports 2 lanes.
The currently supported resolutions are 3280x2464 @ 15fps, 1920x1080 @ 30fps
(cropped FOV), and 1640x1232 (2x2 binned) @ 30fps.

The driver has been tested with Raspberry Pi Camera Module v2 connected to
Raspberry Pi Zero W.

Changes since v3 [1]:

dt-bindings:
  - "link-frequencies" property added

imx219 sensor driver:
  - "depends on MEDIA_CAMERA_SUPPORT" removed from the Kconfig as all the
    sensor drivers are under "if MEDIA_CAMERA_SUPPORT" now
  - in imx219_get_pad_format(), when 'which' argument is V4L2_SUBDEV_FORMAT_TRY
    update the code field in v4l2_mbus_framefmt structure, as the format code
    could change due to vflip or hflip
  - in imx219_power_on(), the delay after de-asserting the reset is changed
    (reduced from 10 mS to 6.2 mS) to fit the startup timings better. Also
    switched from using msleep() to usleep_range(), as otherwise the change
    from 10 mS to 6.2 mS wouldn't have an effect (see
    https://www.kernel.org/doc/Documentation/timers/timers-howto.txt).
    Added the comment which explains how the value of the delay was calculated,
    and why it is fixed value
  - empty lines added before "return x;" statements
  - in imx219_get_regulators() "int i;" changed to "unsigned int i;"
  - the 'dev' field dropped from struct imx219
  - the link frequencies check is added. As the current driver supports only
    single link frequency, the check just compares the link-frequency in DT to
    the predefined value.
    To be able to read link-frequencies from the DT, call to
    v4l2_fwnode_endpoint_parse() was replaced with call to
    v4l2_fwnode_endpoint_alloc_parse(), and the code was rearranged:
    imx219_check_hwcfg() was introduced, and 'ep' field was removed from imx219
    structure, as the parsed DT endpoint info is not used outside
    imx219_check_hwcfg()
  - in imx219_remove(), the code was added to power off the sensor in the case
    when runtime PM is disabled
  - 'probe_new' is used instead of 'probe'

Thanks,
Andrey

[1] https://patchwork.kernel.org/cover/11328425/


Andrey Konovalov (1):
  dt-bindings: media: i2c: Add IMX219 CMOS sensor binding

Dave Stevenson (1):
  media: i2c: Add driver for Sony IMX219 sensor

 .../devicetree/bindings/media/i2c/imx219.yaml |  114 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx219.c                    | 1312 +++++++++++++++++
 5 files changed, 1446 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 drivers/media/i2c/imx219.c

-- 
2.17.1

