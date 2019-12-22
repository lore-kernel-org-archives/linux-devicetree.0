Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1E9C2D0D5
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A327520665
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBbq2oP3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLVLjd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 06:39:33 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35059 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLVLjc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 06:39:32 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so13520864wmb.0;
        Sun, 22 Dec 2019 03:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B0lfJ+VcaGtD3PW0Wa4pit/WSnXYE0W9SB/mi4iBH64=;
        b=SBbq2oP3rcv2Sro3HIiFGo5YZ2H9wvEaBgfgnvY5scafh4Cbf646VR5rQZrYG9WNPZ
         vXe2sLFTlH0E/8NRAVHEMJyEqx2re5RFN5QqMIgkzLdG9WrobZmyJ3fhbnqEPGaqklqO
         kv8AoFaf+oeUuSLZiFhkbTTRljH8tWjD48MqiK452NCJtm045Zp8QVQ9x+Ow2Q8qIT5O
         PbXXTIP4koMChqrkteG5ZA9wd1pt6GM1FkKcCkNzGHe7d38Snc5N2taZKVCkSzFWutcH
         FpgX0PRVgMwdE+jR2mXTMhGPu+YT5QuBczQzg95a1zHwAMuUH56a1J7lkUK5bxMdzLeH
         l29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0lfJ+VcaGtD3PW0Wa4pit/WSnXYE0W9SB/mi4iBH64=;
        b=ecz1uS/5dB0QloB/t2r0xoI+eQctsClIe7ifDVZNc/QIAmCeWT1CtHsJ4jPUgqSHek
         hwYqwrOpTZOl+H4pr4K93PflJKqqXeJHNPf7KPUMIIsdUyU1kDxqSvZqoncaYEttyWnl
         /pxPbR4ZnRZ2W/frla0meSP17SehEC6hNIyI0Kibq2OPkmhfPypd2iByr8tGzNmF8tNn
         0SduH/AX0p5iNzd6nYtKEXF+N0KgdH/70z5I94nVSH72Uk6XHGN/PbbfZcJWBX8yiksS
         3HRGed+bT/x0f3WlFSZkpSLHZaaXjsuiZDLBy2iPLUByP6iJI8DiEKICM39ybz7nrtCZ
         EvrQ==
X-Gm-Message-State: APjAAAUARTeeVYIijcSQBkpmjNbjZ4BVSgDlJ9f2dIignALeZyqg7npX
        dS736ImRw+zT2/V63qqntKw=
X-Google-Smtp-Source: APXvYqzRNoSFzkAgQ2e+hSJpNqGmMcEO2KK1q9QgC1atj31i1Dm54vGeG1/O1goX0b4meJst5Fd+2Q==
X-Received: by 2002:a1c:6585:: with SMTP id z127mr26160679wmb.113.1577014770854;
        Sun, 22 Dec 2019 03:39:30 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id s3sm16110500wmh.25.2019.12.22.03.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:29 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/6] arm64: tegra: Let the EMC hardware use the EMC clock
Date:   Sun, 22 Dec 2019 12:39:19 +0100
Message-Id: <20191222113921.1469372-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222113921.1469372-1-thierry.reding@gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The EMC hardware block needs access to the EMC clock in order to scale
the external memory frequency. Add the clocks property so that drivers
for the EMC can acquire a reference to the EMC clock.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 3abbe56cdfab..31caebada944 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -605,6 +605,8 @@ mc: memory-controller@70019000 {
 	emc: emc@7001b000 {
 		compatible = "nvidia,tegra132-emc", "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
+		clocks = <&tegra_car TEGRA124_CLK_EMC>;
+		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
 	};
-- 
2.24.1

