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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E655C2D0D4
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:11:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 157C22070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIuz0c3D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfLVOLB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:11:01 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39828 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLVOLB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:11:01 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so13939802wrt.6;
        Sun, 22 Dec 2019 06:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IZ2ifsUJ0JDecwnLRVKVryT2ldTM9sS1JLZapFRyFbA=;
        b=aIuz0c3DIOIV/V+RoJaNOt6Nn5j607gJYUni3sEgec5lT2zUWSZPU+Yj6XQ0G7MofH
         /DUytOuJemu6cW+YXcGa9hLeNq/rqhKyp7/fPTej2dWEtKuJHSp9hY+IOlChisFnR4dD
         ugg2D1RyA3GjfZrXmxU5Sf9qTZqo8OmsCDUe39MsJgpKkQnUKWoXAVHU4gkl/+jt9bu8
         GUqNf/XVUC0UEmw2nZlY8uMmCd/3Wivkx9pshLdC6AZAtJHXT0nXHZ++W8mWhRl1q5V0
         3ZGlxCbqtbfRXj1F8PJoUcoXHEbVnLoRRVTKVMfc/TCxe09p9CFAZpCp26SVekLHVgAK
         Sb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZ2ifsUJ0JDecwnLRVKVryT2ldTM9sS1JLZapFRyFbA=;
        b=epKAm9cxbAJgWNjGvQjjIUbY65+MYbCS/dx8Pd6jMutEpzJlFL5YFqh5xkJJ+fYgG0
         jHcoKgSr4KCxIiIZg6lnHgEbl6Xl7QoItIweV2uGv6p2I8T69miqz9APV9zFgDCTsCwR
         yCC0PyFvy2isrpYfMC05pEuHNMApA4wW5zHAJGleqIy0neBeHYOm9laGBtPktTzNPnU0
         e7xUJnxax13YvE6GWeL+rRnB9WZsHuEqluZ2JOcLSnWNpxW31GMOD3BcpLTLMHfmfutY
         OKAMzMM0rJT5kq0BYCXHUtjlT0bCF4w0ZxYcFMBtkxHohbZesD/Sac6a1fj/t0SNi1P5
         A1yg==
X-Gm-Message-State: APjAAAUndr9uEmB9nQCvVIFo7GPKpNAxmHZPaiscA4N5i0L9nqJnvVts
        WvTzTrgge5WIyorGkuzNpVI=
X-Google-Smtp-Source: APXvYqzIPId95QD1p9h5yyQqJIuAkR5ecaXNbnqV/zOLqeN67IxeDaDqVDQUlrB6cCQ/CY+ZiuuuVw==
X-Received: by 2002:a5d:4c85:: with SMTP id z5mr24874687wrs.42.1577023859107;
        Sun, 22 Dec 2019 06:10:59 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id e6sm16834831wru.44.2019.12.22.06.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/13] arm64: tegra: Add the memory subsystem on Tegra194
Date:   Sun, 22 Dec 2019 15:10:35 +0100
Message-Id: <20191222141035.1649937-14-thierry.reding@gmail.com>
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

The memory subsystem on Tegra194 encompasses both the memory and
external memory controllers. The EMC is represented as a subnode of the
MC and a ranges property is used to describe the register ranges.

A dma-ranges property is also added to describe that all memory clients
can address up to 39 bits using the memory controller client interface
(MCCIF), unless otherwise limited by the DMA engines of the hardware. A
memory client can technically use 40 bits of addresses, but the memory
controller on Tegra194 uses bit 39 to determine the XBAR format used to
access memory. Use of this bit needs to be explicitly controlled by the
operating system drivers for devices that can use this on-the-fly format
conversion. Using the dma-ranges property prevents the operating system
from using the bit implicitly, for example in I/O virtual address
mappings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  4 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 43 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index b6ffd5dde20d..cc23d59240ac 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -48,6 +48,10 @@ phy: phy@0 {
 			};
 		};
 
+		memory-controller@2c00000 {
+			status = "okay";
+		};
+
 		serial@3110000 {
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 9f000bb7fca7..73e23ca158dc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
 #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
+#include <dt-bindings/memory/tegra194-mc.h>
 
 / {
 	compatible = "nvidia,tegra194";
@@ -166,6 +167,48 @@ clkreq {
 			};
 		};
 
+		mc: memory-controller@2c00000 {
+			compatible = "nvidia,tegra194-mc";
+			reg = <0x02c00000 0x100000>,
+			      <0x02b80000 0x040000>,
+			      <0x01700000 0x100000>;
+			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x01700000 0x0 0x01700000 0x0 0x100000>,
+				 <0x02b80000 0x0 0x02b80000 0x0 0x040000>,
+				 <0x02c00000 0x0 0x02c00000 0x0 0x100000>;
+
+			/*
+			 * Bit 39 of addresses passing through the memory
+			 * controller selects the XBAR format used when memory
+			 * is accessed. This is used to transparently access
+			 * memory in the XBAR format used by the discrete GPU
+			 * (bit 39 set) or Tegra (bit 39 clear).
+			 *
+			 * As a consequence, the operating system must ensure
+			 * that bit 39 is never used implicitly, for example
+			 * via an I/O virtual address mapping of an IOMMU. If
+			 * devices require access to the XBAR switch, their
+			 * drivers must set this bit explicitly.
+			 *
+			 * Limit the DMA range for memory clients to [38:0].
+			 */
+			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
+
+			emc: external-memory-controller@2c60000 {
+				compatible = "nvidia,tegra194-emc";
+				reg = <0x0 0x02c60000 0x0 0x90000>,
+				      <0x0 0x01780000 0x0 0x80000>;
+				clocks = <&bpmp TEGRA194_CLK_EMC>;
+				clock-names = "emc";
+
+				nvidia,bpmp = <&bpmp>;
+			};
+		};
+
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
 			reg = <0x03100000 0x40>;
-- 
2.24.1

