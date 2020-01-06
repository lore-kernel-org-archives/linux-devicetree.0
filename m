Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04496C32771
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:06:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C66FA21775
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6vlhfEm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgAFIG3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 03:06:29 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39185 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFIG3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 03:06:29 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so18618304plp.6
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kc4OOP9HlDHrazGn8ygbL0+SnkDIKiZeyDLgjyCdafs=;
        b=N6vlhfEmOvMy7F7CmodSMsAX5uy/sztUmVOPhLo8EIl9iFwQ2NLWDi1zBiQ0HUI+ro
         H563QhrI02xzr4klertPbDzI0unhimjQiTnFJo9Lm/Y5LNTk7uQDut/SczTOtbFuvfFy
         T67gJwf+zgRk1FzK/lyW90NtqOanKwHtonwbvMw3QYn1nQeU/MYxDRE9oMfGw9yOKWz+
         R8hxdeoq07y1LNcYCPr4h+rDa12O9RqgQPqubsGtauUci2YgAYgyBn6YjxkUe+fniB3F
         AwcjV8JD6WgPv2DEehMpZ9CoJhopQgW3nafA0e470xlqukNHjbhNdSOkkOZynRJ+An8G
         VJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kc4OOP9HlDHrazGn8ygbL0+SnkDIKiZeyDLgjyCdafs=;
        b=QvN2rN7XbFwls3izQ0hOOhPVA3nAcyD7hHE5dghYzlS61VcjzPFU9o5VskSAh5rCra
         qtlIW6VoQGT5UzL8t6rUT/Cf36D02oBXdlaOG65tp6ERKOmb0Brb3b4HCAh0ho2vomQ1
         mJLgTiVZm5gSpCda1KecqrIPsC3w314nv31tycFQZunvi/ou6q5W6cQtTs+n5Ss4rORK
         eElV9sj/8U3nXoIs1S7w0mK6G3dkq3Uyqq0khix5k3fwDPhJHxSYNs4VN3QI/bwpzngi
         KN8pPv9kwMD3HgQTTBT2gU4xCAcn5h1IScq3gmWO/mxE8WZt15wdvDOgWpv6+N6qSTTk
         xYuA==
X-Gm-Message-State: APjAAAXndZQcL3QufNGzmbUogkBwVOos5VcfOiJVxh9JqUj0WNN/vUVr
        kL3VUNFh6FONllXT0wGIjGmEfGirtgA=
X-Google-Smtp-Source: APXvYqzPwEbf3yDTuo1YSLiQbcrhWeM/h2hOgU19IgmTT+k+BL1n/XH4cHd3sSgnA+OFj25/f1W7Gw==
X-Received: by 2002:a17:902:d898:: with SMTP id b24mr100079663plz.133.1578297988771;
        Mon, 06 Jan 2020 00:06:28 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y20sm11916038pfe.107.2020.01.06.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:06:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: qcom: gcc-msm8996: Fix CLKREF parenting
Date:   Mon,  6 Jan 2020 00:05:44 -0800
Message-Id: <20200106080546.3192125-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We've always seen intermittent resets of msm8996 during boot, seemingly related
to PCIe somehow. The likely cause of these errors are the fact that the CLKREF
of all PHYs are parented by LN_BB, which while being on during boot is disabled
by the UFS host driver if it fails to find its PHY.

As such, depending on the timeing (and success) of the UFS initialization, PCIe
might loose its clocking.

These two patches ensures that LN_BB, connected to the CXO2 pad on the SoC, is
described as parent for all the CLKREF clocks. So that they all vote for this
clock appropriately.

Bjorn Andersson (2):
  clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
  arm64: dts: qcom: msm8996: Define parent clocks for gcc

 .../devicetree/bindings/clock/qcom,gcc.yaml   | 10 ++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  3 ++
 drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
 3 files changed, 41 insertions(+), 7 deletions(-)

-- 
2.24.0

