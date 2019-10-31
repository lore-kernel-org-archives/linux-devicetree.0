Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE911CA9EC3
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 12:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 807A02080F
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 12:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yoTArB90"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfJaMXh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 08:23:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45563 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMXg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 08:23:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so3935110pgj.12
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=L7FbNq4GtcEGuMrNoamJkpzDtDF+1hg78dDxcjF8GrA=;
        b=yoTArB90N55H99xOlmJsXTlX5Q4PdrQV2uSRnS11/me3WlG9q7aAWgOJjafBlLqLz2
         JOi5ezGa/Q/VE6g75yQmuFb29m7vFH7/gKIGz3b/RvsoUWVYM21Hj0Ly7PoDvYb45wHP
         ntHx4AkgwlGfAIHnOfHVMcQVxHhOMr0n/xikhaRl+QVGIqAHdOLFRkChL7eKRtHP+Ise
         pRoH/2YffkBa92Mlswd0f/wyi3PU9lIhTE0dtndJ5v3tf2JGgDdfc8vm2SJQrp/cTeGY
         3WLB3mIXHHn0OKZzq4FbUHFHaQlAAProeAAcniPwRBNNllznqIZHTQIlVd5Vndg+1hDW
         y0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L7FbNq4GtcEGuMrNoamJkpzDtDF+1hg78dDxcjF8GrA=;
        b=MA34ZRijrmbT0uNWeQdm3MJv2tuxoUuqZvEjAsg8acpxYhDY7/E1kFT/RR4eif4YsX
         qV5MivHzD6cYJKycekX2RI+YOKizcIufQ+/BZUSCUaG7s39X+NNxXOmuBpKnP7JYHjX0
         qQ1vvuAQAjLG6dSOdM9KM7KJm+NDF4/C1AljD8DI38xiRO/madBi2I6oQg+NavdP7h9I
         eiSixrK9E94bRCwIzNhDr9MJ0BGglIbTsbtkdPpzw2xtGAlhw01ZBg1Ndq4PMdr0CmdU
         4czovRTyUjkT/lNstAufqnYFpScFRSKcggCeRIDeiAukDi6I5ASrT8fK4o/i2n7VibrD
         WxmQ==
X-Gm-Message-State: APjAAAWQUrrVsvBdbugVqT21fKODP3Gx723VgDAj9nScqB9ALmic3Um1
        yGdLsSulgblvjmxcXThS9dhrtA==
X-Google-Smtp-Source: APXvYqzkMwwYEMRk7E7iMmBJE8XD9e61/YS3XuGQMYPLmQolNAnvK2BAUeKzmOayGe1Fd76SpxyXug==
X-Received: by 2002:a17:90a:48:: with SMTP id 8mr6777617pjb.82.1572524616055;
        Thu, 31 Oct 2019 05:23:36 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id j25sm2983077pfi.113.2019.10.31.05.23.31
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 31 Oct 2019 05:23:34 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjiang.yu@unisoc.com,
        baolin.wang@linaro.org, baolin.wang7@gmail.com,
        zhang.lyra@gmail.com, orsonzhai@gmail.com
Subject: [PATCH v2 0/5] Improve the SC27XX fuel gauge controller
Date:   Thu, 31 Oct 2019 20:22:39 +0800
Message-Id: <cover.1572523415.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This patch set adds one battery resistance-temperature table to optimize
the real battery internal resistance in different tempertures, and
calibrates the resistance of coulomb counter to improve the accuracy
of the coulomb counter.

Any comments are welcome. Thanks.

Changes from v1:
 - Fix the order of values in resistance-temp-table property's description.
 - Add an unit suffix for FGU resistance property.

Baolin Wang (4):
  dt-bindings: power: Introduce one property to describe the battery
    resistance with temperature changes
  power: supply: core: Add battery internal resistance temperature
    table support
  dt-bindings: power: sc27xx: Add a new property to describe the real
    resistance of coulomb counter chip
  power: supply: sc27xx: Calibrate the resistance of coulomb counter

Yuanjiang Yu (1):
  power: supply: sc27xx: Optimize the battery resistance with measuring
    temperature

 .../devicetree/bindings/power/supply/battery.txt   |    5 ++
 .../devicetree/bindings/power/supply/sc27xx-fg.txt |    3 +
 drivers/power/supply/power_supply_core.c           |   67 +++++++++++++++++++-
 drivers/power/supply/sc27xx_fuel_gauge.c           |   49 +++++++++++++-
 include/linux/power_supply.h                       |   10 +++
 5 files changed, 130 insertions(+), 4 deletions(-)

-- 
1.7.9.5

