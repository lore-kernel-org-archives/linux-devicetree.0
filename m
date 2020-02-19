Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF61C34050
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 16:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4FC120675
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 16:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W6PLPkjf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgBSQQf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 11:16:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53145 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgBSQQf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 11:16:35 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so1304419wmc.2
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+/8NBRunUt2cYIUgm6UzoQu0mbqXIeIWTzSaZcaWsQ=;
        b=W6PLPkjfa6jJmDWuoYCZsHA88TvgIL51Cbyjc5ca1imFA3/NSj8tkicmlN4w7wPiO9
         0zv/6/MKaQ9+QoEY9FZmtF9bNeSHyHyJL/19gBuZZbzBHUUnl6zi1V+wRxYIS/z5AEkj
         4M6biZ8o7JuQgM8/P1pKVGyHWT+8dEltcO+drS/uprfVbzTFA1oCxj+65xc7fXqZlA5c
         JD6Y3ZI0wFuYF1WKVLMDvt+kNhGmr221aFK8W1sTa9A4TPMg5FIp88sBz7H6zJ7MZajn
         Vd36Ron3bH0Z+7wfRrjFmpfaGBczzKfBtg6x8eHiV14JpjMjrpBBoWpSXRjqrhZ7mHfs
         EDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+/8NBRunUt2cYIUgm6UzoQu0mbqXIeIWTzSaZcaWsQ=;
        b=hFPNB/vMSqVVNTLJM4Xmaev+VPfjHm4iDt5T+gqdg0ytMqMxkcBaHRg/6+tAnW9N7e
         wvUiKYNdFuXSmH1evTBbNvcCosmz/37ADZOrIYSto5M1AUUdQbFVFHuRJbm7Ns+Q5+ih
         UvI4kMcyIHr3OrCnM+QjPlJpN2RlDPhF5nOQi8yTNztRAylZIfy/eW+9ApYMPGVq0hLL
         Y6uWgK9veR3jlXOQEy/PJgrhrMmsLEq1rSGdZosfO6+TpOOpj+bAx3zaTt+TkwnDfQsC
         bviQQR6HrTvR0mfknrnYkwqWy5xEsvX3RaFDuSlGBV19118Febfak3tj+JDYALveddV8
         eJgg==
X-Gm-Message-State: APjAAAXzA5sE+gUYSz0RiwsGCCem8ylE553uDNU+wmQRaQ5i03vva7YZ
        htNgD/ql0uppJ/gMIhWE9FmMmYeRyBs=
X-Google-Smtp-Source: APXvYqwsSbAJTu0d+yE+5cwhYVK1iTFlFVggTFQ/jxCdmXpEFk00rIB42Y4vjMiPT7At4RjkPx66Sg==
X-Received: by 2002:a05:600c:228f:: with SMTP id 15mr11436237wmf.56.1582128992130;
        Wed, 19 Feb 2020 08:16:32 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id a22sm437140wmd.20.2020.02.19.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 08:16:31 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: meson: add internal DAC support
Date:   Wed, 19 Feb 2020 17:16:23 +0100
Message-Id: <20200219161625.1078051-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support for the internal audio DAC provided on the
Amlogic gxl, g12a and sm1 SoC families. On each of these SoC families,
there is glue between this codec on the audio provider. The architecture
is similar to the one used for the synopsys hdmi codec on these SoCs

Changes since v1 [0]:
* Change some kcontrol names
* Move DAC sources to DAPM

[0]: https://lore.kernel.org/r/20200219133646.1035506-1-jbrunet@baylibre.com/

Jerome Brunet (2):
  ASoC: meson: add t9015 internal codec binding documentation
  ASoC: meson: add t9015 internal DAC driver

 .../bindings/sound/amlogic,t9015.yaml         |  58 +++
 sound/soc/meson/Kconfig                       |   8 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/t9015.c                       | 333 ++++++++++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
 create mode 100644 sound/soc/meson/t9015.c

-- 
2.24.1

