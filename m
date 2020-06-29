Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDF2C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9301620672
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593463205;
	bh=IBqeirKPT8c7wmG4BPRldsNMENUT88K8pOX2cD5ov0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BZIIzCmQDdKFgwu+txiZTxhHC9mU6t+z8qyid3lwYnzEy2eVPFKYZuZqo6j12QjBi
	 s/mAS/O2Wtx+hQxL7oA3nK+l6AuHB7LlY0E9N2PTVmHMSfssc1Fw8OGWDowCzfFzaK
	 Lc7BjcbBnnpXzR8jh6fLZBWhvQFOLzEefDOF5csk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731714AbgF2UkF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:39908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389471AbgF2UkC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 29 Jun 2020 16:40:02 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5275120771;
        Mon, 29 Jun 2020 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593463201;
        bh=IBqeirKPT8c7wmG4BPRldsNMENUT88K8pOX2cD5ov0A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SDY6bsUD7MD6zbQ6sIlOut/22uy/Q4zhMlaod/kJLOwT1jSkUweXIC8L2UayIPiH8
         HSbR+qftW2rj6pgAGEESmVGQCOj/RstAQGpQnD2+UNRo49Z1Nv+VZeYLddG89Y7QyJ
         tF8lSoMV0UaQCRFtjehON9ARPWfKPyjTcraFYzAA=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        Dinh Nguyen <dinh.nguyen@intel.com>,
        linux-stable <stable@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: stratix10: increase QSPI reg address in nand dts file
Date:   Mon, 29 Jun 2020 15:39:49 -0500
Message-Id: <20200629203949.6601-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629203949.6601-1-dinguyen@kernel.org>
References: <20200629203949.6601-1-dinguyen@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Dinh Nguyen <dinh.nguyen@intel.com>

Match the QSPI reg address in the socfpga_stratix10_socdk.dts file.

Fixes: 80f132d73709 ("arm64: dts: increase the QSPI reg address for Stratix10
and Agilex")
Cc: linux-stable <stable@vger.kernel.org> # >= v5.6
Signed-off-by: Dinh Nguyen <dinh.nguyen@intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
index 4000c393243d..c07966740e14 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
@@ -212,12 +212,12 @@
 
 			qspi_boot: partition@0 {
 				label = "Boot and fpga data";
-				reg = <0x0 0x034B0000>;
+				reg = <0x0 0x03FE0000>;
 			};
 
-			qspi_rootfs: partition@4000000 {
+			qspi_rootfs: partition@3FE0000 {
 				label = "Root Filesystem - JFFS2";
-				reg = <0x034B0000 0x0EB50000>;
+				reg = <0x03FE0000 0x0C020000>;
 			};
 		};
 	};
-- 
2.17.1

