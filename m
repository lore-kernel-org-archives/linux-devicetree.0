Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EBECA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 22:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D858021D82
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 22:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t7oj1A8/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfJYWu2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 18:50:28 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34564 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfJYWuV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 18:50:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id k7so2070412pll.1
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=osNStqGe/+pixQ+TIIwo4hgOQ0iCE+khF0tMpALPhbA=;
        b=t7oj1A8/ELwYNKEiPY/Pw18dHmD+od22U+4C5NhOE2wd5jiFHCseOjSRPgNDzrSyKq
         dPtd5CcVf9iIPtDONddh2eO4eP3j6pOkNRnByhXulltB5XaUZ4VBvTkOfFT3PuuTpbgR
         fm3I84wjJaEQhBPHt7WSbAUDubIimzLHWBCLSLWX5sMsbyrT3fCHo5F1xVc6KrpAYg6a
         AgjQBcwoRkdatjyjUVB6aSuWoLUrCrbKujOVSG/5gs8lzDyIeWuQNxGe2iKOkrtKXEpq
         1wh9xGKkBGFWOlUKiBuDHcJfU/9wkfMXegJLC9PRvNvTK7V02u/r9lQ0YSfzf7FIX6cd
         JAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=osNStqGe/+pixQ+TIIwo4hgOQ0iCE+khF0tMpALPhbA=;
        b=FMTLhZfhxF2FRT6y0+Y+2FpkI2v2ygGkH2sNVUHC57JktSMO3D+POLO7w+Rw3YKD1Z
         50T6SXJxo5aILRAeIIawyRnifOyzf8kTuWVN0i0Jqn7iEhtQr7YldR5W6l+8qO/0quX+
         OfP28bMMTb3rc/lzPnyomFbaG60G+o4BxTqFLC6lVMXr+/nANnuLNmL2egRQNFOGQP8O
         Xpxzs6+pui4TCFjbkI297ycsttPye3ZQgacs13htLt3nnSRDjgk/Cs4OE689vMWOOt3U
         1vsH93vOo0aFHSOUk0O4ZOZZRR74yMVpZNA7XJvO6EKGWNma9/BhLBYzQoPk+CU0VbyM
         lcdw==
X-Gm-Message-State: APjAAAUkZ6Oz7EtQiRXNuGqz2O7Cj3gi2BtHLGrgNa4kkDHBu/do+kF5
        yRknLhYmcAGHbiqOtfWhPnCpuA==
X-Google-Smtp-Source: APXvYqwEfPgMUzNALdpaZ7hIfRdBK9Sl+x7omJQowf6j1uRY6bjZJnZXHQcn0Yn6ut98Jyy0zAwi0g==
X-Received: by 2002:a17:902:8a96:: with SMTP id p22mr6280974plo.272.1572043819516;
        Fri, 25 Oct 2019 15:50:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id o15sm2758018pjs.14.2019.10.25.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 15:50:19 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Laura Abbott <labbott@redhat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "Andrew F . Davis" <afd@ti.com>, Chenbo Feng <fengc@google.com>,
        Alistair Strachan <astrachan@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 3/3] example: dts: hi3660-hikey960: Add dts entries to test cma heap binding
Date:   Fri, 25 Oct 2019 22:50:09 +0000
Message-Id: <20191025225009.50305-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025225009.50305-1-john.stultz@linaro.org>
References: <20191025225009.50305-1-john.stultz@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds example test entry to create and expose a camera cma region
via the dmabuf heaps interface

This isn't a patch I'm submitting to merge, but just an example
of how this functionality can be used, which I've used for
testing.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 190ac29b9e2f..783c5b2abd2d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -75,12 +75,23 @@
 		};
 
 		/* global autoconfigured region for contiguous allocations */
-		linux,cma {
+		cma_default: linux,cma {
 			compatible = "shared-dma-pool";
 			reg = <0x0 0x20C00000 0x0 0x4000000>;
 			reusable;
 			linux,cma-default;
 		};
+
+		cma_camera: cma-camera {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x24C00000 0x0 0x4000000>;
+			reusable;
+		};
+	};
+
+	cma_heap {
+		compatible = "dmabuf-heap-cma";
+		memory-region = <&cma_camera>;
 	};
 
 	reboot-mode-syscon@32100000 {
-- 
2.17.1

