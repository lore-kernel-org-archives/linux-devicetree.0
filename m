Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819D7C5ACC4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 00:31:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 553C921D56
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 00:31:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MwQ43G3L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgBTAbT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 19:31:19 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34089 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgBTAbS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 19:31:18 -0500
Received: by mail-pl1-f193.google.com with SMTP id j7so813732plt.1
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 16:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DABA29lvnKahjWN65Up4SMobg1WasA5eEpWwvMJgQ6c=;
        b=MwQ43G3L6srlNwtHvkvQm7lWzatySi2qtRIS8jSsEzV/L1rc8pljgk7Y+GaBeB0a3g
         g5tzG4g5+kBakUYEupMRcyj0AfFMZF7u4DIbkC8/KAL+JaJzUuiP6OCpEpq35cMyPpFm
         FZpDUv7g7zh5JZUAn2AI5GXe4m6dfpUzjeCGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DABA29lvnKahjWN65Up4SMobg1WasA5eEpWwvMJgQ6c=;
        b=JhKkGQsOBT64ANNA9mYFm3CWBeapsjPe75Zq1iH0c4EIaoNZQXHAawWHPmQQBqvXDp
         2FCswXLVQJnFD75P1b+Kb1r7d66YoeJ22hVhtVrmNhDK5h56plY0Xowi8acTBbJXP2fr
         SoBPCd9cctrsu5Y/p63p7VgDwOKzwCfdjHiKKfpF9+rBv0vHQG0KkyeQP9rzxv/5EoRn
         osKNVgKZ5gP4vpzBZ+OJ8EoSVkveo0Mnxvv92OsBaDxh4RhRrBsyDAW14jMHrimWHMWC
         nNWTcnJaQqwWAgqDTjXKBg90YIx7vM+oQubnE1eYR9pl+aSblAmTHGKPFwlQC26ujWoM
         0bFA==
X-Gm-Message-State: APjAAAWyz9WY2bzqAof8G9WcB+RgVfLVT2IZUgDS8Z/0QWxE+omAtQIW
        82rSsTc6wyGQyLamDVgNcw/I6Q==
X-Google-Smtp-Source: APXvYqymv8vYYbZdsvczre9QEC7s9GoJR4iHu3CXG7yzljDmTeKtEZ7UkIZXpBWJCXWfZeZ4h5Zv0Q==
X-Received: by 2002:a17:90a:191a:: with SMTP id 26mr370789pjg.111.1582158677720;
        Wed, 19 Feb 2020 16:31:17 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id d69sm815370pfd.72.2020.02.19.16.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:31:17 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@intel.com, enric.balletbo@collabora.com,
        bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/4] platform/chrome: Add Type C connector class driver
Date:   Wed, 19 Feb 2020 16:30:53 -0800
Message-Id: <20200220003102.204480-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following series introduces a Type C port driver for Chrome OS devices
that have an EC (Embedded Controller). It derives port information from
ACPI or DT entries. This patch series adds basic support, including
registering ports, and setting certain basic attributes.

v2: https://lkml.org/lkml/2020/2/7/646
v1: https://lkml.org/lkml/2020/2/5/676

Changes in v3:
- Fix DT bindings entry in Documentation to use usb-connector binding.
- Fixed minor code nits in driver file.

Prashant Malani (4):
  dt-bindings: Add cros-ec Type C port driver
  platform/chrome: Add Type C connector class driver
  platform/chrome: typec: Get PD_CONTROL cmd version
  platform/chrome: typec: Update port info from EC

 .../bindings/chrome/google,cros-ec-typec.yaml |  86 +++++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_typec.c       | 340 ++++++++++++++++++
 4 files changed, 438 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
 create mode 100644 drivers/platform/chrome/cros_ec_typec.c

-- 
2.25.0.265.gbab2e86ba0-goog

