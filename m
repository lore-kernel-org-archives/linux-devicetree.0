Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD43BC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 08:01:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7805E207ED
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 08:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hFW4BRQ9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgFIIBD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 04:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgFIIBB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 04:01:01 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3117FC05BD43
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 01:01:01 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id v24so7723413plo.6
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itzxgfnqgSAh1Ay9xpcVxwCgvgDCbiUVPTUe7WIvLJs=;
        b=hFW4BRQ9AwTSpzVGCnmWrFZVGvxQL5CD0ubfoFZOJ0Lzf+2Cs+4RmDTgWleXAy1aug
         fmX4WtC4KI8t/fzCUBDw0yC/nMUJEfDsV2g32yq0gMCNy42Il/eKyEGi3fXfh+uMUE+o
         OzPB/CFZO3Sp/PnarEI7e0OltYNMfzXOSCO+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itzxgfnqgSAh1Ay9xpcVxwCgvgDCbiUVPTUe7WIvLJs=;
        b=gk9icc3cxAZiX3xXoYwC6iVcZ3FZDBSJQXubtm3KkOTUvi0Leyjkj8DxRnSeulXJVW
         BwuYZpT472q4umOi1r1JDUtoD9zQm4FRJb8pnXp9s9fxJN6845vp/PvQDB6w76EmruL1
         E9QWJB5YxFs/GV+uOHES846Sln9ONEGqg5itcq9FIFhdIP4qljF9yrwKf8U74yk6fe5n
         aom9r3CAU/HEUc7+pugJ5DetuVxcrL74HyvpcW7LKOEuCO96aif6s+16YB91nosAwLSm
         fHDeIUkCNBHvXnIiWCzFA1EY6mcQjbglGylKg9LM1h24OJ9I/MxtOFXgo+v12rqY124I
         uoUA==
X-Gm-Message-State: AOAM533Kxu4jmGp0t6jdQgSGCjh9a/xZKYiXXeYGCa2DiO4jjHVZ7u9H
        Z4T1L2Q82xnTU6KLSHibbXyz6w==
X-Google-Smtp-Source: ABdhPJx4KCbpY/d8Gen4dsrvOeam3rlwyvRdibOoKv1Gq0XSsIh2tkkNee7g5mfPRrfGeiDl6OJSNA==
X-Received: by 2002:a17:902:82ca:: with SMTP id u10mr2213141plz.294.1591689660329;
        Tue, 09 Jun 2020 01:01:00 -0700 (PDT)
Received: from pihsun-glaptop.lan (180-176-97-18.dynamic.kbronet.com.tw. [180.176.97.18])
        by smtp.googlemail.com with ESMTPSA id gt22sm2506252pjb.2.2020.06.09.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 01:00:59 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Lahoudere <fabien.lahoudere@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH 0/2] Add support for voltage regulator on ChromeOS EC.
Date:   Tue,  9 Jun 2020 15:59:53 +0800
Message-Id: <20200609080001.121499-1-pihsun@chromium.org>
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

Pi-Hsun Shih (2):
  dt-bindings: regulator: Add DT binding for cros-ec-regulator
  regulator: Add driver for cros-ec-regulator

 .../bindings/regulator/cros-ec-regulator.yaml |  39 +++
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/cros-ec-regulator.c         | 261 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  82 ++++++
 5 files changed, 390 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/cros-ec-regulator.yaml
 create mode 100644 drivers/regulator/cros-ec-regulator.c


base-commit: abfbb29297c27e3f101f348dc9e467b0fe70f919
-- 
2.27.0.278.ge193c7cf3a9-goog

