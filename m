Return-Path: <SRS0=PDL5=Y3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B81CA9EBB
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 11:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F28320842
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 11:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtL0Xw3K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfKCLyY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 Nov 2019 06:54:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37530 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfKCLyY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 Nov 2019 06:54:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id q130so13201090wme.2;
        Sun, 03 Nov 2019 03:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wn+huXjsq7G+a2CTarlM5yhHdSRocSimZhW3JueGs1k=;
        b=KtL0Xw3KY7G2911evW37iUJTbmC5oYZSGbLSDKpTYT26D4K76w1V5W9ndnsA6tC5Qp
         jDwM+aDhuLYG/KeOSPfcZ6VOVVGI2kSBnEf0eN7LVDv1ZH8nK+KU9j/0tkyLsyexgxbS
         hFGDINxrAcQfEaxEs81cfvCwvvtzzxLqZLRSF5STdSL5tKZfLuwtwFJzkFeURUYa25L4
         SsEX9Kl2AoEeHlj9R+EzdUhsc8tGXdbjABlwQ5dOvy1fec5EIP2yaA2ABYi45Qg1RuDY
         yln9ie/Pn1renXZqimLUagRCi56xBTuWaYhKfClyPBxbsypJLYy34eaNbk0ONX+BFbdL
         LtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wn+huXjsq7G+a2CTarlM5yhHdSRocSimZhW3JueGs1k=;
        b=Rq5oIQSdgf2By1pLXC6cHmYE55OG4yPMpv3b5dTMbhqfeszaAoYPia3/1wwjQnMQJ2
         42GP6QoSGFXGGZ68iHlwP8nrY2CFQu7NjVIidovH7qkTc5XiJkqTvmxe6NFJHcSjgtMh
         odKXMeYgQn5CdCxri0/dGOVBXXYRCFeE1zF7A34WIu7CbhOyVsLTGdOQzZe0ahv1DUz+
         JW5kX+bgfoEM/JuUTzbbk740gG/smrkT8dNEAC/B2ieiKLqpM3HjpavaZNpOxWqm2zXa
         Bb3Ly4fjDRKEwmndbTkv6kyk3R66/ZzxH8QI/UJL+iNRbAyBynkWeYjKas0P+kq/s80t
         yZmQ==
X-Gm-Message-State: APjAAAXdT7Hlfze7ENLr9yifAhSbbYypzPgb4S+QSvazjf1NPqMyJn6G
        HrKTWgK+URIkO9Jmb0g9Jns=
X-Google-Smtp-Source: APXvYqxKoP3ya51zGI9IOezX9GvX4vPsx0jv/KPYe4S/QB3t3VmhvUbEz4FXGdFT5rPzP0RKqgP9QQ==
X-Received: by 2002:a1c:1b0d:: with SMTP id b13mr18848084wmb.120.1572782060642;
        Sun, 03 Nov 2019 03:54:20 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s10sm13819588wrr.5.2019.11.03.03.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 03:54:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: tegra: Set dma-ranges for memory subsystem
Date:   Sun,  3 Nov 2019 12:54:15 +0100
Message-Id: <20191103115415.6532-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103115415.6532-1-thierry.reding@gmail.com>
References: <20191103115415.6532-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tegra194, all clients of the memory subsystem can generally address
40 bits of system memory. However, bit 39 has special meaning and will
cause the memory controller to reorder sectors for block-linear buffer
formats. This is primarily useful for graphics-related devices.

Use of bit 39 must be controlled on a case-by-case basis. Buffers that
are used with bit 39 set by one device may be used with bit 39 cleared
by other devices.

Care must be taken to allocate buffers at addresses that do not require
bit 39 to be set. This is normally not an issue for system memory since
there are no Tegra-based systems with enough RAM to exhaust the 39-bit
physical address space. However, when a device is behind an IOMMU, such
as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
IOVA allocations to happen in this region. This is for example the case
when an operating system implements a top-down allocation policy for IO
virtual addresses.

To account for this, describe the path that memory accesses take through
the system. Memory clients will send requests to the memory controller,
which forwards bits [38:0] of the address either to the external memory
controller or the SMMU, depending on the stream ID of the access. A good
way to describe this is using the interconnects bindings, see:

	Documentation/devicetree/bindings/interconnect/interconnect.txt

The standard "dma-mem" path is used to describe the path towards system
memory via the memory controller. A dma-ranges property in the memory
controller's device tree node limits the range of DMA addresses that the
memory clients can use to bits [38:0], ensuring that bit 39 is not used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- use memory client IDs instead of stream IDs (Mikko Perttunen)

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 55 +++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 084abe2e3267..64800ad52e19 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -53,6 +53,9 @@
 			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 			resets = <&bpmp TEGRA194_RESET_EQOS>;
 			reset-names = "eqos";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_EQOSR>,
+					<&mc TEGRA194_MEMORY_CLIENT_EQOSW>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_EQOS>;
 			status = "disabled";
 
@@ -166,10 +169,16 @@
 			};
 		};
 
-		memory-controller@2c00000 {
+		mc: memory-controller@2c00000 {
 			compatible = "nvidia,tegra194-mc";
 			reg = <0x02c00000 0xb0000>;
+			#interconnect-cells = <1>;
 			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
 		};
 
 		uarta: serial@3100000 {
@@ -416,6 +425,9 @@
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_SDMMC1>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
@@ -439,6 +451,9 @@
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_SDMMC3>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
@@ -467,6 +482,9 @@
 					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRAB>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWAB>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_SDMMC4>;
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
@@ -496,6 +514,9 @@
 				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
 			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR>,
+					<&mc TEGRA194_MEMORY_CLIENT_HDAW>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HDA>;
 			status = "disabled";
 		};
@@ -831,6 +852,8 @@
 			#size-cells = <1>;
 
 			ranges = <0x15000000 0x15000000 0x01000000>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
 			display-hub@15200000 {
@@ -867,6 +890,9 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -883,6 +909,9 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -899,6 +928,9 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -915,6 +947,9 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -1182,6 +1217,19 @@
 			status = "disabled";
 
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1W>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2R>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2W>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3R>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3W>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4R>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4W>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_GPU>;
 		};
 	};
@@ -1567,6 +1615,11 @@
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_BPMPR>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPW>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAR>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAW>;
+		interconnect-names = "dma-mem";
 		iommus = <&smmu TEGRA194_SID_BPMP>;
 
 		bpmp_i2c: i2c {
-- 
2.23.0

