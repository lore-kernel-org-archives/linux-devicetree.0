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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C387C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A17A2070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnl7ok3k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfLVOKl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52778 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfLVOKl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so13385769wmc.2;
        Sun, 22 Dec 2019 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/VDBOK2IJqgukN9tSgWPXP9FuHvsRdT8O5ST1j5LKEI=;
        b=rnl7ok3k3yjSKvrZzu7/K3jfanSdQylXdtfY/RoXQpe+JzH8lTjtrV5oWs0XohTMJP
         nPfrMz9rKWA2kLADIV4PliiG0IS+oWJC5kZNEPaW+I8m+PSfv/9HD78grLlzoEYJUNgh
         6XhbHzwIgPpu8BtTdVmkoKyYB6P5NZ8rjcDLKnkuOgrBegB5rm3qg0NRtixyQnCJ5Zyx
         m7pWENICuUdxl3Mrgv93EuLvdkr+HwNz8sWpRUj9JCQymTcndTgvjxabLYsA6E+54WBc
         BkHb6R5ZTuLRsMJcpYS1E1jYGVJeCS37KXuHw0BiCJYxnE5N9BoehShBbytL3/ezI8rF
         2Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/VDBOK2IJqgukN9tSgWPXP9FuHvsRdT8O5ST1j5LKEI=;
        b=tokdpnQQV+Nfto3RcHaoYqHiuWH9EAMgDEg59onomIsvv0iS7V+Pe6j5ZQu0uvS1Gk
         weWFRqVVvkOFw7AU5pU+A/Bxr0ZA0rS2o9hFCOCp6y5197MGwQkCycBBwc8/uqv7Ynx8
         JtMCHblb+zmvq+1pju9KMo0A1Lx/8MXqW/K/OA4sNyYinzFCElZZYhHz8Z3KT2epWMof
         DKSAYW1sEzJulOCGXX2WknN5SgMldrIE2z5E4J4/MhQ5bPtxNh62RkCbhReAKvT2abKe
         HlvuZXnBbRj96I3HPBKl7MB0smRfzNHRQa7yFdpIEpf1yYsf5xfBzeC3GM6jQRxfPlw1
         mYqw==
X-Gm-Message-State: APjAAAWj0UpjjzoGIKlrOVoaR/vlq8VPmKeff7LltXm+Uz+y6nTPhUuC
        byLOS6tcrwfmvNE+Y0vKtE4=
X-Google-Smtp-Source: APXvYqxznfu5OShpVsrN3qzpIHEnzPpf0Bh5ApTGjy7QwGouyzgUUr2uDphv4ytkG04CXs9mfuA43A==
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr8411887wmc.171.1577023838861;
        Sun, 22 Dec 2019 06:10:38 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id s128sm16794353wme.39.2019.12.22.06.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/13] dt-bindings: memory: Add Tegra186 memory client IDs
Date:   Sun, 22 Dec 2019 15:10:23 +0100
Message-Id: <20191222141035.1649937-2-thierry.reding@gmail.com>
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

Add IDs for the memory clients found on NVIDIA Tegra186 SoCs. This will
be used to describe interconnect paths from devices to system memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/memory/tegra186-mc.h | 139 +++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
index 64813536aec9..82a1e27f7357 100644
--- a/include/dt-bindings/memory/tegra186-mc.h
+++ b/include/dt-bindings/memory/tegra186-mc.h
@@ -108,4 +108,143 @@
 #define TEGRA186_SID_SE_VM6		0x4e
 #define TEGRA186_SID_SE_VM7		0x4f
 
+/*
+ * memory client IDs
+ */
+
+/* Misses from System Memory Management Unit (SMMU) Page Table Cache (PTC) */
+#define TEGRA186_MEMORY_CLIENT_PTCR 0x00
+/* PCIE reads */
+#define TEGRA186_MEMORY_CLIENT_AFIR 0x0e
+/* High-definition audio (HDA) reads */
+#define TEGRA186_MEMORY_CLIENT_HDAR 0x15
+/* Host channel data reads */
+#define TEGRA186_MEMORY_CLIENT_HOST1XDMAR 0x16
+#define TEGRA186_MEMORY_CLIENT_NVENCSRD 0x1c
+/* SATA reads */
+#define TEGRA186_MEMORY_CLIENT_SATAR 0x1f
+/* Reads from Cortex-A9 4 CPU cores via the L2 cache */
+#define TEGRA186_MEMORY_CLIENT_MPCORER 0x27
+#define TEGRA186_MEMORY_CLIENT_NVENCSWR 0x2b
+/* PCIE writes */
+#define TEGRA186_MEMORY_CLIENT_AFIW 0x31
+/* High-definition audio (HDA) writes */
+#define TEGRA186_MEMORY_CLIENT_HDAW 0x35
+/* Writes from Cortex-A9 4 CPU cores via the L2 cache */
+#define TEGRA186_MEMORY_CLIENT_MPCOREW 0x39
+/* SATA writes */
+#define TEGRA186_MEMORY_CLIENT_SATAW 0x3d
+/* ISP Read client for Crossbar A */
+#define TEGRA186_MEMORY_CLIENT_ISPRA 0x44
+/* ISP Write client for Crossbar A */
+#define TEGRA186_MEMORY_CLIENT_ISPWA 0x46
+/* ISP Write client Crossbar B */
+#define TEGRA186_MEMORY_CLIENT_ISPWB 0x47
+/* XUSB reads */
+#define TEGRA186_MEMORY_CLIENT_XUSB_HOSTR 0x4a
+/* XUSB_HOST writes */
+#define TEGRA186_MEMORY_CLIENT_XUSB_HOSTW 0x4b
+/* XUSB reads */
+#define TEGRA186_MEMORY_CLIENT_XUSB_DEVR 0x4c
+/* XUSB_DEV writes */
+#define TEGRA186_MEMORY_CLIENT_XUSB_DEVW 0x4d
+/* TSEC Memory Return Data Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSRD 0x54
+/* TSEC Memory Write Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSWR 0x55
+/* 3D, ltcx reads instance 0 */
+#define TEGRA186_MEMORY_CLIENT_GPUSRD 0x58
+/* 3D, ltcx writes instance 0 */
+#define TEGRA186_MEMORY_CLIENT_GPUSWR 0x59
+/* sdmmca memory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCRA 0x60
+/* sdmmcbmemory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCRAA 0x61
+/* sdmmc memory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCR 0x62
+/* sdmmcd memory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCRAB 0x63
+/* sdmmca memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCWA 0x64
+/* sdmmcb memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCWAA 0x65
+/* sdmmc memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCW 0x66
+/* sdmmcd memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCWAB 0x67
+#define TEGRA186_MEMORY_CLIENT_VICSRD 0x6c
+#define TEGRA186_MEMORY_CLIENT_VICSWR 0x6d
+/* VI Write client */
+#define TEGRA186_MEMORY_CLIENT_VIW 0x72
+#define TEGRA186_MEMORY_CLIENT_NVDECSRD 0x78
+#define TEGRA186_MEMORY_CLIENT_NVDECSWR 0x79
+/* Audio Processing (APE) engine reads */
+#define TEGRA186_MEMORY_CLIENT_APER 0x7a
+/* Audio Processing (APE) engine writes */
+#define TEGRA186_MEMORY_CLIENT_APEW 0x7b
+#define TEGRA186_MEMORY_CLIENT_NVJPGSRD 0x7e
+#define TEGRA186_MEMORY_CLIENT_NVJPGSWR 0x7f
+/* SE Memory Return Data Client Description */
+#define TEGRA186_MEMORY_CLIENT_SESRD 0x80
+/* SE Memory Write Client Description */
+#define TEGRA186_MEMORY_CLIENT_SESWR 0x81
+/* ETR reads */
+#define TEGRA186_MEMORY_CLIENT_ETRR 0x84
+/* ETR writes */
+#define TEGRA186_MEMORY_CLIENT_ETRW 0x85
+/* TSECB Memory Return Data Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSRDB 0x86
+/* TSECB Memory Write Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSWRB 0x87
+/* 3D, ltcx reads instance 1 */
+#define TEGRA186_MEMORY_CLIENT_GPUSRD2 0x88
+/* 3D, ltcx writes instance 1 */
+#define TEGRA186_MEMORY_CLIENT_GPUSWR2 0x89
+/* AXI Switch read client */
+#define TEGRA186_MEMORY_CLIENT_AXISR 0x8c
+/* AXI Switch write client */
+#define TEGRA186_MEMORY_CLIENT_AXISW 0x8d
+/* EQOS read client */
+#define TEGRA186_MEMORY_CLIENT_EQOSR 0x8e
+/* EQOS write client */
+#define TEGRA186_MEMORY_CLIENT_EQOSW 0x8f
+/* UFSHC read client */
+#define TEGRA186_MEMORY_CLIENT_UFSHCR 0x90
+/* UFSHC write client */
+#define TEGRA186_MEMORY_CLIENT_UFSHCW 0x91
+/* NVDISPLAY read client */
+#define TEGRA186_MEMORY_CLIENT_NVDISPLAYR 0x92
+/* BPMP read client */
+#define TEGRA186_MEMORY_CLIENT_BPMPR 0x93
+/* BPMP write client */
+#define TEGRA186_MEMORY_CLIENT_BPMPW 0x94
+/* BPMPDMA read client */
+#define TEGRA186_MEMORY_CLIENT_BPMPDMAR 0x95
+/* BPMPDMA write client */
+#define TEGRA186_MEMORY_CLIENT_BPMPDMAW 0x96
+/* AON read client */
+#define TEGRA186_MEMORY_CLIENT_AONR 0x97
+/* AON write client */
+#define TEGRA186_MEMORY_CLIENT_AONW 0x98
+/* AONDMA read client */
+#define TEGRA186_MEMORY_CLIENT_AONDMAR 0x99
+/* AONDMA write client */
+#define TEGRA186_MEMORY_CLIENT_AONDMAW 0x9a
+/* SCE read client */
+#define TEGRA186_MEMORY_CLIENT_SCER 0x9b
+/* SCE write client */
+#define TEGRA186_MEMORY_CLIENT_SCEW 0x9c
+/* SCEDMA read client */
+#define TEGRA186_MEMORY_CLIENT_SCEDMAR 0x9d
+/* SCEDMA write client */
+#define TEGRA186_MEMORY_CLIENT_SCEDMAW 0x9e
+/* APEDMA read client */
+#define TEGRA186_MEMORY_CLIENT_APEDMAR 0x9f
+/* APEDMA write client */
+#define TEGRA186_MEMORY_CLIENT_APEDMAW 0xa0
+/* NVDISPLAY read client instance 2 */
+#define TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 0xa1
+#define TEGRA186_MEMORY_CLIENT_VICSRD1 0xa2
+#define TEGRA186_MEMORY_CLIENT_NVDECSRD1 0xa3
+
 #endif
-- 
2.24.1

