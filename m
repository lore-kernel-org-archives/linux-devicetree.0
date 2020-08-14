Return-Path: <SRS0=/1Tz=BY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7576AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 04:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F9FE20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 04:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgHNEqU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Aug 2020 00:46:20 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:41899 "EHLO smtpbgbr2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgHNEqU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Aug 2020 00:46:20 -0400
X-QQ-mid: bizesmtp5t1597380307tzyqxx2we
Received: from localhost.localdomain (unknown [119.145.4.99])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 14 Aug 2020 12:45:06 +0800 (CST)
X-QQ-SSF: 01400000008000Z0Z000000A0000000
X-QQ-FEAT: pmMLH+Cxa1v6KlNt1P5Rz5lDZ9AWyt49rut86Rq/bDKA4pKcR+HLIGJsBOYCW
        KYJyHTCFEd9OSM6Cr4mvQYugn0IEVxi6zh2a1slONOaFNz6KvnVgYOvRKI0Nso2HEyPQGYG
        IrUji9oas+CQPgS185higGzHO/3/rlOpgMVeDliZROE3fMaZDa6EdcsqMbBCIM4pLVJXw7h
        B1wDmmn7qswzngySjJ2XiDUBUZRcNumKOPIw6xTinSatHDBitIi3SZNSaRfhVR/VrcCu/ch
        2JHaJZWCkU7db9U0PVgB0C94bBaKNadKqTD9Q9qlmgRHPKk/t//8CG2mXMxJZoV9YV6qIMg
        w6njEhKxMV8E/84DbAnmnEarESN1g==
X-QQ-GoodBg: 2
From:   Xingyu Wu <wuxy@bitland.com.cn>
To:     mchehab@kernel.org, robh+dt@kernel.org, davem@davemloft.net,
        sakari.ailus@linux.intel.com, shawnx.tu@intel.com,
        hverkuil-cisco@xs4all.nl, dave.stevenson@raspberrypi.com,
        manivannan.sadhasivam@linaro.org, bingbu.cao@intel.com,
        tfiga@chromium.org, drinkcat@chromium.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dongchun.zhu@mediatek.com, sj.huang@mediatek.com,
        wuxy@bitland.com.cn, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        hao.he@bitland.com.cn
Subject: [PATCH V3] Add GalaxyCore image sensor driver 
Date:   Fri, 14 Aug 2020 12:44:51 +0800
Message-Id: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
X-Mailer: git-send-email 2.7.4
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series add GalaxyCore GC5035 image sensor driver.

Change in v3:
1.Optimize gc5035 driver.
2.Redescibe reset-gpio in documentation.

Hao He (3):
  dt-bindings: vendor-prefixes: Add GalaxyCore
  media: dt-bindings: media: i2c: Document GC5035 bindings
  media: i2c: gc5035: Add GC5035 image sensor driver

 .../bindings/media/i2c/galaxycore,gc5035.yaml      |  128 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/gc5035.c                         | 1953 ++++++++++++++++++++
 6 files changed, 2105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc5035.yaml
 create mode 100644 drivers/media/i2c/gc5035.c


