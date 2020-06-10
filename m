Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BF1C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 09:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFFB3206F4
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 09:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aX3EBJ3E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgFJJHz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Jun 2020 05:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgFJJHz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Jun 2020 05:07:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5C4C03E96B
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 02:07:54 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k2so604702pjs.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msttcuXgTgSFdNl79f5Us0DrDSuIDFwDNZzBPlqdIFQ=;
        b=aX3EBJ3ESkpfoWwYdS9w1TCVlPztY9Umy3YDrF8wPcfnGf5KFjPHEOjduewtzdeP9/
         +HFL8CyS73LlRQoU2VcjR5damI7PvO67iu2Dw68511xhfPv7/aOLl1Ch8gLyUdkEbGjD
         +HPWcbx7w4kaL8NF1JKRbCLeALe0XdzqpQKiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msttcuXgTgSFdNl79f5Us0DrDSuIDFwDNZzBPlqdIFQ=;
        b=TLtUOXxFN6b8VVOx8h2/lFtM7qL8wN51V7UIejW2M6LRTRp8MJ4u4N/D29MLo9OjQb
         P6IaRL/K2PcpE9Qu0BH7joSIZPZA8pWaS5MA3B8XI2nDHXHNFUVgt7ilTViqNl3nFcVF
         WgEdH0dNBglEbHjZc2Okdja3xcj7Y2bL6au+WrfYQ61GUx85tZaun/uZWOp8nvjn/E3S
         27QSVxceYWykn/Mu662e2rwPBlJnfIWBYgES50AlossIB0Mo9IpOp91fLafidvO8bWhS
         THH3TYh/f4nCWlVU4rVbjF24Hqx+OJOdde5L3YLFSTWSZUtR+0JTaFCGai7kHm/vcLYN
         4Ncw==
X-Gm-Message-State: AOAM530p/3ljgwJO1cDAD8HJ9b5OT54FnMq49htI9HyXe/hF0wa8NEmc
        1tusg5R/d7DSXNfkFdccCGV9og==
X-Google-Smtp-Source: ABdhPJxeqRl3cY85LMvJTwNG2oDQqv/KgQ4p/MrvakVtCM2syItYeJM2hU54mpCIutkAcWHdrXpirA==
X-Received: by 2002:a17:90b:707:: with SMTP id s7mr2030037pjz.215.1591780074384;
        Wed, 10 Jun 2020 02:07:54 -0700 (PDT)
Received: from pihsun-glaptop.lan (180-176-97-18.dynamic.kbronet.com.tw. [180.176.97.18])
        by smtp.googlemail.com with ESMTPSA id j17sm10607644pgk.66.2020.06.10.02.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 02:07:53 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        linux-kernel@vger.kernel.org (open list),
        Mark Brown <broonie@kernel.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Yicheng Li <yichengli@chromium.org>
Subject: [PATCH v3 0/2] Add support for voltage regulator on ChromeOS EC.
Date:   Wed, 10 Jun 2020 17:07:38 +0800
Message-Id: <20200610090748.45908-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for controlling voltage regulator that is connected and
controlled by ChromeOS EC. Kernel controls these regulators through
newly added EC host commands.

Changes from v2:
* Add 'depends on OF' to Kconfig.
* Add Kconfig description about compiling as module.

Changes from v1:
* Change compatible string to google,regulator-cros-ec.
* Use reg property in device tree.
* Change license for dt binding according to checkpatch.pl.
* Address comments on code styles.

Pi-Hsun Shih (2):
  dt-bindings: regulator: Add DT binding for cros-ec-regulator
  regulator: Add driver for cros-ec-regulator

 .../bindings/regulator/cros-ec-regulator.yaml |  43 +++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/cros-ec-regulator.c         | 262 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  82 ++++++
 5 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/cros-ec-regulator.yaml
 create mode 100644 drivers/regulator/cros-ec-regulator.c


base-commit: 5b14671be58d0084e7e2d1cc9c2c36a94467f6e0
-- 
2.27.0.278.ge193c7cf3a9-goog

