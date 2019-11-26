Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C44C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CC8620835
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574768614;
	bh=KNgAyjCj86/GJyuk/2jTo3LbE3F5sE4AcCdsTKzpeAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=FdWtLO2AGmYcalbn9cp69fsZQ1woZ6sl6Osf4UCZ4z6HCEM7Da1VjT/AY+dYAC9Nx
	 GQfe+NHEUPlBn0Y7m09DswFyL4nKzs4CCXfbUG2GZorS7khj5DIoyxs3f1Lb2Jcz1q
	 CkPwdZ0OC1Ms+TouXtDaEDFU+UwEJduJpeMYs6XY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfKZLnd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:43:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:35256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfKZLnd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 06:43:33 -0500
Received: from e123331-lin.home (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6A152084D;
        Tue, 26 Nov 2019 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574768613;
        bh=KNgAyjCj86/GJyuk/2jTo3LbE3F5sE4AcCdsTKzpeAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V6/yMOfmzW9dijyHanRQbmYX/qq4IUb6R99xF0HXWRmnQHrgRQiMEd0C4CnOY9fFL
         28TNDr1BAsBGqH5zuXTzcAVcZ7VgR9SawFlbOGZjE/nkrsmmxGPWREGcyd9otb+P3g
         S+on++fFH80xowK9tQWyj8ysKHINY7Gz615em3I0=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 7/8] dt: amd-seattle: disable IPMI controller and some GPIO blocks on B0
Date:   Tue, 26 Nov 2019 12:43:18 +0100
Message-Id: <20191126114319.2755-8-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126114319.2755-1-ardb@kernel.org>
References: <20191126114319.2755-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Disable some peripherals that are not usable on B0 silicon based
Overdrives.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index be8db5758c94..899ffcf9da36 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -36,14 +36,6 @@
 	status = "ok";
 };
 
-&gpio2 {
-	status = "ok";
-};
-
-&gpio3 {
-	status = "ok";
-};
-
 &gpio4 {
 	status = "ok";
 };
@@ -83,10 +75,6 @@
 	};
 };
 
-&ipmi_kcs {
-	status = "ok";
-};
-
 &smb0 {
 	/include/ "amd-seattle-xgbe-b.dtsi"
 };
-- 
2.17.1

