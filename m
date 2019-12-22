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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854E4C3F68F
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CE7120665
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHezw3Kg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfLVOK7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46652 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfLVOK7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so13883742wrl.13;
        Sun, 22 Dec 2019 06:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NLd2mHZgSanSF4J79TwmNol8PZQ1XjUStKYPMmwtKY=;
        b=pHezw3KgOalhagOA8ELZM/hrh4fQ8lAGOKSnJXcC1LfySeZAeMTRvGB02qX6RwTjIi
         LgPx2hiGAxsNdsvD52YPPI50k3Q2OO0xrZRSpZgDqHN61SkaI94lyaMh3r0dQiylmSmn
         /XS47KLgP83xghibqMP0a0ASi3mWcjeRvpvBCK4LVemxShy+qYSafIiALVnaDj6rXJBv
         1CErmlegu57ZvPDSY9A4e9eY47urKn2fM7mgHnfUAJEar7/qCPpfBQ892bkbYTSeCa0L
         YckvpvcqKpqeiX9fY/4OSOOCRne4KZobZRnrvmuEojjGsys7LF3KE9+2l3jYEeOY9/Z3
         1LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NLd2mHZgSanSF4J79TwmNol8PZQ1XjUStKYPMmwtKY=;
        b=hPifkMtsxe6RHlSLD8y7e3r0umObV1imnLTOVWDp4Ud+Ss53WGe749DI5vBqrEG8PT
         JNmgejFQKzyX8xaWhvA3Q8h4ZxNhMWAg9CqoYQkJrK9lldiYsnUsIV/wEcAAEJkqQL3u
         MiexNh76tLdKemGX8ipJh/DnDqnEg2wVG55LJakk6Wy6I1enxGkKYyQP7j+HL2LSXjyQ
         SEB94tSuXb5IKbfiNu5gj6d+GHA3n3kJ/b19j+c3wn/mpwc8oWfsB4fR5CIsG+V87qat
         ZoNjx8iudHNDo9XiLnT9u1hOOqZ4R7CxXok0KYarjbcuAyjlExygST+JYrQWMOnh6JFq
         HDaQ==
X-Gm-Message-State: APjAAAW+Ubr44ClDsE9NrR/UJYsgtQYLtBKECUKbr7Jan3SVxZA9H62d
        UhhYRrBH1O1HGyTg6qZUvKA=
X-Google-Smtp-Source: APXvYqxRYGHgLZemcl/o8PPZd4p2Lzq1fSAv3l9MR1in32eLNeV1VqBcGboJgv2+yaSFlVoDnWG8vA==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr27216079wrp.388.1577023857414;
        Sun, 22 Dec 2019 06:10:57 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id f16sm17271848wrm.65.2019.12.22.06.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/13] arm64: tegra: Add external memory controller on Tegra186
Date:   Sun, 22 Dec 2019 15:10:34 +0100
Message-Id: <20191222141035.1649937-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the external memory controller as a child device of the memory
controller on Tegra186. The memory controller really represents the
memory subsystem that encompasses both the memory and external memory
controllers. The external memory controller uses the BPMP to obtain the
list of supported EMC frequencies and set the EMC frequency.

Also set up the dma-ranges property to describe that all memory clients
can address up to 40 bits using the memory controller client interface
(MCCIF), unless otherwise limited by the DMA engines of the hardware.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 584498a999d4..dba7f57469c5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -144,6 +144,27 @@ memory-controller@2c00000 {
 		reg = <0x0 0x02c00000 0x0 0xb0000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 		status = "disabled";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
+
+		/*
+		 * Memory clients have access to all 40 bits that the memory
+		 * controller can address.
+		 */
+		dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
+
+		emc: external-memory-controller@2c60000 {
+			compatible = "nvidia,tegra186-emc";
+			reg = <0x0 0x02c60000 0x0 0x50000>;
+			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA186_CLK_EMC>;
+			clock-names = "emc";
+
+			nvidia,bpmp = <&bpmp>;
+		};
 	};
 
 	timer@3010000 {
-- 
2.24.1

