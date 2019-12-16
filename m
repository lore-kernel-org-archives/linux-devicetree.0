Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE64C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 17:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3AC820700
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 17:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IGnhB3L2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfLPRrl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 12:47:41 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40485 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfLPRrl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 12:47:41 -0500
Received: by mail-pf1-f195.google.com with SMTP id q8so5971784pfh.7
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=23EgKnWEsl0Hd3XbTrDUtuEdXnQvPbAjdUpGkg0hfXw=;
        b=IGnhB3L2ap3ulPumsoKZ4TVu/FXmghrIC8FwJJpv4Dfc3bbyxjUaFsLSYDCUhkyW4p
         +xreDjgbdjUxX7sC1gFq9aTbQ106feVMgzzFTVc8tnhMRI6v14HsQKFIkyuf/GInQA/u
         KccmCNYTo1rTVXvYurh1NY7uS4X8vgOpk+9rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=23EgKnWEsl0Hd3XbTrDUtuEdXnQvPbAjdUpGkg0hfXw=;
        b=oW/SAT/4IwFsiyaKSx7TLRn+ADsBauO4a0cSLWXXu3fRJwS4uCCm4BLPz4zNtsu2JC
         g0GPz0qopL2vvs2O6SemaLbv5ZkbL3a3Otlx5fp2W7G+crua4PtGyarU05gn382vQtjy
         cMEeG3o4MSu4hCzGZsPadB3lhZaj9+hIazt7G6lTdnJhnJZz2fHiHDPDfG8DO4AHSZGE
         klSb7GEz20awb+i13DGZxTMv5DH16OyhBzaa4CJ6ow0/MB7x6j/LLK142NfdXooEXFss
         wTt48qYGbW/aWH9rlCZK7GvLfS7YvZPGmz6gK73Ii0OQt/SsA4aMYzzag/c/Qjk7olkg
         ubWQ==
X-Gm-Message-State: APjAAAUPF9rP2zwHEomqu8pq+NLhPgHAJyOjAx8FgVGT+jkr+0IJ6qoK
        X3vM15zBl2ibqYfXG2JLVQ5Z1w==
X-Google-Smtp-Source: APXvYqyImG7BVxbhsOeBlgf/l2MpA9ppdirUWWsjIQfweo+/Xeo7ac2PoYXkrH8FYNr02BUC+wD+oA==
X-Received: by 2002:a63:211f:: with SMTP id h31mr18905268pgh.299.1576518460259;
        Mon, 16 Dec 2019 09:47:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:6d28:a89:f9e1:1506])
        by smtp.gmail.com with ESMTPSA id a6sm22342924pgg.25.2019.12.16.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 09:47:39 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Akash Gajjar <akash@openedev.com>, Tom Cubie <tom@radxa.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 0/4] arm64: dts: rockchip: Add Rock Pi N10 support
Date:   Mon, 16 Dec 2019 23:17:07 +0530
Message-Id: <20191216174711.17856-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Unlike, other Rock PI boards from radxa, Rock Pi N10 SBC is based
on SOM + Carrier board combination.

Rock Pi N10 is a Rockchip RK3399Pro based SBC, which has
- VMARC RK3399Pro SOM (as per SMARC standard) from Vamrs.
- Dalang carrier board from Radxa.

patch 0001: dt-bindings for Rock Pi N10

patch 0002: VMARC RK3399Pro SOM dtsi support

patch 0003: Radxa Dalang carrier board dtsi support

patch 0004: Rock Pi N10 dts support

Tested basic peripherals and will all more in future patches.

Any inputs?
Jagan.

Jagan Teki (4):
  dt-bindings: arm: rockchip: Add Rock Pi N10 binding
  arm64: dts: rockchip: Add VMARC RK3399Pro SOM initial support
  ARM: dts: rockchip: Add Radxa Dalang Carrier board
  arm64: dts: rockchip: Add Radxa Rock Pi N10 initial support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../dts/rockchip-radxa-dalang-carrier.dtsi    |  81 +++++
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399pro-rock-pi-n10.dts    |  17 +
 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     | 333 ++++++++++++++++++
 5 files changed, 438 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi

-- 
2.18.0.321.gffc6fa0e3

