Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4450C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 839F42070A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386602;
	bh=LoTQH/hbzEU8zdUd3/D8MIuEqXsXY2vD04uwnTIqyw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dlBqWxaEKFRauJmJ+Z5YrvjCjsYpGol9NnGY43QHrd7e49ul4CRrQl3rZtxIOhJEs
	 +qmPBuLdeSFpfaljvvhNwGtXOYiPd0JQuD8tE26Zoa5h83INbzgj+4dRCys0kbS+GT
	 IAla2SthCNRiDkPVlLgbjSDr+sFSJKMF0NFQC9Wk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfLCPXW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:41548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:22 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D44F2080A;
        Tue,  3 Dec 2019 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386601;
        bh=LoTQH/hbzEU8zdUd3/D8MIuEqXsXY2vD04uwnTIqyw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSBKfgqJwojftYw4PitYfreOXQ36dBM/b0K0M7NN9jTyJt7vkBX+CuVVy627sPT2O
         WJ3yTuZeLf4nA2PGvEp2LqjuEQkhkKPTN70UfOBL+FXZZhnPul929Ae0FsHxStWXkX
         cMYCTnNN/nLWeiMF4+mIcZ/TkeF4yG06KG0ZY8Es=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 7/8] dt: amd-seattle: disable IPMI controller and some GPIO blocks on B0
Date:   Tue,  3 Dec 2019 15:23:05 +0000
Message-Id: <20191203152306.7839-8-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
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
index 8e341be9a399..4997a74aeb67 100644
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
@@ -79,10 +71,6 @@
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

