Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12A4C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 19:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 631A421925
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 19:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jcc2cAsk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfKKTVg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 14:21:36 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38392 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKKTVf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 14:21:35 -0500
Received: by mail-pg1-f195.google.com with SMTP id 15so10046797pgh.5
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=zZILD+44OX1q5dyQzdM2BbgJv0kkr/NqvYdzqJF0VWU=;
        b=jcc2cAskjWBgTeYwsSv3lvsFyjpx3z/2/dQVMzCjv1lmIFKWhkHxwaMJrmIvvzX4Zr
         OF/rQM08+qFfbfpDc8ai8eZ0IFQ4+o3hIYKkDKyXMOLL24DVR1C15WLDsCUXefgV4oKA
         pMO1W8OkboYcq+mtU/Rj1PxtqnJR3JahYQwmQeCGRHFcMGdwDyYM2RtjQwMqyZJKryNL
         Ax08rcC/xS5IEgOE60HRwPIja/rZ2eeyJTh3DI9MAGLckAXXO4Tr5GPKw9R3kv6Kq3ye
         lYqLrULR/t+MCbEALuBHLQJacFwZUVEGlAqbpTSFu5C3nv2uCt0XwGTOVxA099KQGn/h
         IfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zZILD+44OX1q5dyQzdM2BbgJv0kkr/NqvYdzqJF0VWU=;
        b=qH4hCU4VUDovCBdKtvaDOKoz2pttoGbq9bEuWJut3Cf+3c/UmGCz3ocPC2jn/9LUgG
         reKRQLQxze2moMng9SXMF2FyVs5phORvqFlwDAp+jp08K8pI+tfNYwfFpSSsV6FlqDYQ
         gGIlf7/eqVNbfQI3Bk8ydMrYGLFixeN0yp6BKPiUEDnuqcvOXGgYWwFK3GP+P12QHiwL
         jA7ry669j8vwrnT2iP/ELjsoqUfMAVfNofA49bVOoOZWXHW7AyWOYat+uNRRDHqY/gs4
         MgaPitFRw+AXmha6LKsxcbuNI2VhvR7Q8Bef1vveFM94kgsPwUFzJdYclPV/V9PCxuAT
         T/+w==
X-Gm-Message-State: APjAAAWB6bugvqO89Y8FGnfe0Aht8/wqj/Lxw66VO/mr8uQ/QQ59CcUq
        JKgJqIRoZwcfifqAOd43TUpt7Q==
X-Google-Smtp-Source: APXvYqzvHgUVjW/Rd7K/W+r2O5+4vx7SxfEQkH5rCRHJfWJtzF7eQkUWs7LcfgNd2hnpOUHjHrobqg==
X-Received: by 2002:a17:90a:2623:: with SMTP id l32mr861971pje.70.1573500094683;
        Mon, 11 Nov 2019 11:21:34 -0800 (PST)
Received: from localhost ([49.248.192.129])
        by smtp.gmail.com with ESMTPSA id v24sm4331651pfn.53.2019.11.11.11.21.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 11:21:33 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/3] thermal: tsens: Handle critical interrupts
Date:   Tue, 12 Nov 2019 00:51:26 +0530
Message-Id: <cover.1573499020.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

TSENS IP v2.x supports critical interrupts and v2.3+ adds watchdog support
in case the FSM is frozen. Enable support in the driver.

Amit Kucheria (3):
  drivers: thermal: tsens: Add critical interrupt support
  drivers: thermal: tsens: Add watchdog support
  arm64: dts: sdm845: thermal: Add critical interrupt support

 arch/arm64/boot/dts/qcom/sdm845.dtsi |  10 +-
 drivers/thermal/qcom/tsens-common.c  | 170 +++++++++++++++++++++++++--
 drivers/thermal/qcom/tsens-v2.c      |  18 ++-
 drivers/thermal/qcom/tsens.c         |  21 ++++
 drivers/thermal/qcom/tsens.h         |  85 ++++++++++++++
 5 files changed, 289 insertions(+), 15 deletions(-)

-- 
2.17.1

