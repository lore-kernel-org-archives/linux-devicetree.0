Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33186CA9EBD
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 07:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07E1221783
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 07:19:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTL+jOMS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730751AbfJ1HTv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 03:19:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36827 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732466AbfJ1HTv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 03:19:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id v19so6295495pfm.3
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ruFTA66AHlVe9lksioBMwwIdADskrYqVYX9wRS0DjSA=;
        b=vTL+jOMSUKziFxGvmULpDuosEPrE9KNb5fxyiR+KvMpwfnMbiRIvHpP2o5MjkeTB7D
         p9IzmnmSdzH9Ebhsgv9/FEJ3GvtMf7K0tcnXKQUEuX02OlyaqugYFxSTQoFmQ8ZVki6R
         oms977+Ts142oOpF5S2arRJX+8lgoKQAYGD23LlOqe4Fo/ZNpttBx6kqD2o1kJBUjj9G
         gCQKnJxj+vAPwE0GDYuhcZj9GXOEQJS0u2ZDtQYOwt2kq74qAJ0UDhKxoMBgk2SutMI1
         8XCULjpZnMYTYz+Cvs0NaAyWVsjaeDwquo63f33xc4yZrvZ76gbBILwyNUGSLaNNN+Dk
         iPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ruFTA66AHlVe9lksioBMwwIdADskrYqVYX9wRS0DjSA=;
        b=Fq2AQq79EvK7CYhu5ouuwtoHiEKyKD6jwOUGVRl0ENB8SP6IE8dseCsKuTSnT648Fe
         lXB1NJmeMLpq6CKfoodoBqT4vZaltNR260Ugg7T3rhlRTUFtJ1vJwWgx5SMimKW5E876
         ZTAYWCtVCOz/PWLOfsOswSX0wsHjkF48dtn1UESu/zvUKUSQrNEnpHK7xtK+dwe3AOo+
         m6nYwspLRnFClxZ09dsB+Wra5dPK7EACj/6kX1c6QtXGYfob5koY8EB97+uDM/ZKU7VR
         30XOhDpETF+WZQ4C8vIjNcWI4tBXsU39UB4ZK6CUAVq9SUKA/z4dGR14zRvQQIE3pHSS
         b/KA==
X-Gm-Message-State: APjAAAUqKq5AxnG88A5JakkzOpASOJ+u63F2YNgSObvWuTB8vQMPV+15
        5waLwAbbTor4KC9A5g2sDfvuyA==
X-Google-Smtp-Source: APXvYqykCw0rNzi3pE0X43+v5Bhy9g1kQP5vUS1px1WVWvFUlOsJdC9QkPi2amj89VM5Vk26EpLSvw==
X-Received: by 2002:a17:90a:9a9:: with SMTP id 38mr10789292pjo.45.1572247190245;
        Mon, 28 Oct 2019 00:19:50 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 13sm11504703pgq.72.2019.10.28.00.19.46
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Oct 2019 00:19:49 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjiang.yu@unisoc.com,
        baolin.wang@linaro.org, baolin.wang7@gmail.com,
        zhang.lyra@gmail.com, orsonzhai@gmail.com
Subject: [PATCH 0/5] Improve the SC27XX fuel gauge controller
Date:   Mon, 28 Oct 2019 15:18:56 +0800
Message-Id: <cover.1572245011.git.baolin.wang@linaro.org>
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
 .../devicetree/bindings/power/supply/sc27xx-fg.txt |    2 +
 drivers/power/supply/power_supply_core.c           |   67 +++++++++++++++++++-
 drivers/power/supply/sc27xx_fuel_gauge.c           |   49 +++++++++++++-
 include/linux/power_supply.h                       |   10 +++
 5 files changed, 129 insertions(+), 4 deletions(-)

-- 
1.7.9.5

