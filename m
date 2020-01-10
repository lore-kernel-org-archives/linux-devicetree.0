Return-Path: <SRS0=Jntx=27=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B375FC282DD
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 20:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8904020842
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 20:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zl0P/LNG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgAJUKT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jan 2020 15:10:19 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41590 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgAJUKT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jan 2020 15:10:19 -0500
Received: by mail-lf1-f67.google.com with SMTP id m30so2399202lfp.8
        for <devicetree@vger.kernel.org>; Fri, 10 Jan 2020 12:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=OlMRgK65UBkXRgjbu4gDzQiNgMmwLco+OX8ZC9CpXmo=;
        b=Zl0P/LNGucHtQfiv1wSjJ2TeReGhJJ9+a8UJgWLWqdqkKdGLI2S3ZDhIAtooVSXbPB
         j0j1ZcFTOI9+n0D+epJST49mbZvu/kEm3v28rJwO2W6JVC7cq0g+IuO/kk/xhxA1YM3n
         pNc9i3iPjo7R1aBrbO2s4C0tCXLNZcR9MW7m3Sipr4ivo14Fq4UceJlDzGzbpMIWmHPS
         4kDGz5jjoqObf4BKg0Ike7y7nVfCwCtJjps1EchJj8LVVPjidu5PwyQekWsbzghjFO4E
         7iPlyJaFdCfHvLMSngbHh1r2q4SSIbM1jugXJdoU0APhtidUdRPqXOoO0W3HqBBO4NxD
         SbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OlMRgK65UBkXRgjbu4gDzQiNgMmwLco+OX8ZC9CpXmo=;
        b=UQYVS9lyCBRJC8BZtqZgnnDDGbNdQ72yO5cVft0abxYNd1ivIkzu87XVgekksEv02/
         NuM9FOxVo0OOcBa/VniH20c/AtjHN0BgqMXdRqHA+EDtigavIhFNhWr3qFbpQ2oeC0HM
         PIkYJnsg1G2pNjYFEAbNYAgp6+1gh4c47QgCoSFlQ8K8sJXmWXrgRyKDhskm0npmLGhR
         UTmTn0I+6t6Uq3ok/4Ee4TuMd3XrCs3mdB9cYArI4cghY1/JvfGzhyC+k0w6G+saTay6
         b6wt8CcXvx0EkfBEyIEePi9NzFGyMbV9UXAdoJM0WQFDbTN3iHnf2yzaLHW0zd7JOXqz
         LilA==
X-Gm-Message-State: APjAAAUow168hopHlf487OPxKS7UZAVwThMz9nG52Rkfk30Z1qLcO+Mm
        Pq4Bxku6TnxLi3PoqTejoYQ/EQ==
X-Google-Smtp-Source: APXvYqwqJsVGRDXHH0WVbwc4z8WDuLmbk4kNkxEoQ9APMSfTQZkIComsATaF82R9mR2e8WureTh7UA==
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr3446463lfg.117.1578687017235;
        Fri, 10 Jan 2020 12:10:17 -0800 (PST)
Received: from TM-8481.Dlink (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.googlemail.com with ESMTPSA id n13sm1484225lji.91.2020.01.10.12.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 12:10:16 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, dave.stevenson@raspberrypi.com,
        ezequiel@collabora.com, sakari.ailus@linux.intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 0/2] Add IMX219 CMOS image sensor support
Date:   Fri, 10 Jan 2020 23:09:13 +0300
Message-Id: <20200110200915.22575-1-andrey.konovalov@linaro.org>
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

Changes since v2 [1]:

dt-bindings:
  - "clock-names" property removed
  - "xclr-gpios" property renamed to "reset-gpios"
  - the camera-clk mode moved out of sensor device node
  - "clock-lanes" property removed (the sensor doesn't support lane reordering)
  - "clock-noncontinuous" description made more clear (thanks Sakari)
  - "data-lanes" property reworked: it is now optional, and if it is not
    present the driver should assume four-lane operation. For two-lane
    operation (the only mode supported by the current driver) this property
    must be present and set to <1 2>

imx219 sensor driver:
  - "xclr-gpios" property renamed to "reset-gpios", the corresponding
    struct gpio_desc field in the imx219 structure is renamed to reset_gpio
  - in the driver probe() a test to check that the number of CSI-2 data lanes
    is supported by the driver was added
  - devm_clk_get() is now called with NULL as the 2nd argument, as there is
    just single clock, and there is no need to use clock ID
  - error messages are added when the driver fails to get regulators, to init
    media entity pads, or to register sensor sub-device

Thanks,
Andrey

[1] https://patchwork.kernel.org/cover/11311137/


Andrey Konovalov (1):
  dt-bindings: media: i2c: Add IMX219 CMOS sensor binding

Dave Stevenson (1):
  media: i2c: Add driver for Sony IMX219 sensor

 .../devicetree/bindings/media/i2c/imx219.yaml |  104 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx219.c                    | 1253 +++++++++++++++++
 5 files changed, 1378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 drivers/media/i2c/imx219.c

-- 
2.17.1

