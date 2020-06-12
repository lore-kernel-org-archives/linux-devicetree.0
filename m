Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADFEC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 04:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB4B02078C
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 04:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WlHj4pso"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgFLEFf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 00:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgFLEFf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 00:05:35 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE76C03E96F
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 21:05:33 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m1so3536684pgk.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 21:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=85+tXbAucR1bugiRvSByYbhr5wkv6IY9XidvyzSLZWs=;
        b=WlHj4psoyA9tlTc6VPj2OiMWyd7DySl+1Z8xyv0iR1SiLd1PbPGGVsJb2TFJPlVZ3m
         IWfZzbdOEMI1IWfOqVORgs9ceYRH8G+3IXoeLFKx88oj+vLY97Swe+ZEQpRyl33WTqJ4
         vfEBmSbEkYJpbJXmQdiXcnfIx59jadys1G2fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=85+tXbAucR1bugiRvSByYbhr5wkv6IY9XidvyzSLZWs=;
        b=hy3MKc08LFrjlDG0qQh8rzkPxz1PVE6dfE4fzCnkiW/U1H67QkFf3RRj7lzv7uI/b3
         khmKfEeSXOjMHDYrwVv4LBBUZayxW1uZUoPtJO8zB630YZnnw2CWo7sYT5vx5/5/e3kP
         AIC6s905EPxIrekpDiCaNF8KkspUopgvQH2adCfwKJ02/hrN8gx3NlsDKZCrlHKVTusR
         338k6duGupCspQP4UqwSdgCRp/MFNAkCzH2sNlICPellGBJhRDknlYq7ulncayDfOv/+
         HbR/yqiMYjd+lzuJx9kWVsi45+R6WOQ/2yg8C/b/CdIElE+hsZuUfXya+aFiNkxOtYEP
         N7wg==
X-Gm-Message-State: AOAM530yoTr8qhQhw00s0YJnCZ9jed0pl2QNnUIP6aWyvPeZQnaCexMD
        QqUtXZ6sHKaAT+BGwnXMKJszZA==
X-Google-Smtp-Source: ABdhPJy7D/3Ug2UIIg3pNs0AofwMiYtpMZjmyGD1IyzPLuqegWshNFYq7jT6iNoMzDjfGVXll5XKgQ==
X-Received: by 2002:a62:7a4a:: with SMTP id v71mr10361639pfc.35.1591934733183;
        Thu, 11 Jun 2020 21:05:33 -0700 (PDT)
Received: from pihsun-glaptop.lan (180-176-97-18.dynamic.kbronet.com.tw. [180.176.97.18])
        by smtp.googlemail.com with ESMTPSA id u7sm4686983pfu.162.2020.06.11.21.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 21:05:32 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        Mark Brown <broonie@kernel.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Yicheng Li <yichengli@chromium.org>
Subject: [PATCH v6 0/3] Add support for voltage regulator on ChromeOS EC.
Date:   Fri, 12 Jun 2020 12:05:17 +0800
Message-Id: <20200612040526.192878-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
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

Changes from v5:
* Move new host command to a separate patch.
* Use devm_regulator_register.
* Address review comments.

Changes from v4:
* Change compatible name from regulator-cros-ec to cros-ec-regulator.

Changes from v3:
* Fix dt bindings file name.
* Remove check around CONFIG_OF in driver.
* Add new host commands to cros_ec_trace.
* Address review comments.

Changes from v2:
* Add 'depends on OF' to Kconfig.
* Add Kconfig description about compiling as module.

Changes from v1:
* Change compatible string to google,regulator-cros-ec.
* Use reg property in device tree.
* Change license for dt binding according to checkpatch.pl.
* Address comments on code styles.

Pi-Hsun Shih (3):
  dt-bindings: regulator: Add DT binding for cros-ec-regulator
  platform/chrome: cros_ec: Add command for regulator control.
  regulator: Add driver for cros-ec-regulator

 .../regulator/google,cros-ec-regulator.yaml   |  51 ++++
 drivers/platform/chrome/cros_ec_trace.c       |   5 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/cros-ec-regulator.c         | 257 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  82 ++++++
 6 files changed, 406 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
 create mode 100644 drivers/regulator/cros-ec-regulator.c


base-commit: b791d1bdf9212d944d749a5c7ff6febdba241771
-- 
2.27.0.290.gba653c62da-goog

