Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660BCC2D0DA
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 17:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A0B220CC7
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577469408;
	bh=3cMs4tT+RemEJnmuF4khxgCvz9o2HcNgNZpneHdQLRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=0qS6pw2ZkC3f45cCk9sMysZ0rBjciDKM/XCYOiDOq3yGWDFcJbcCmtwHvTEtv0FKB
	 NRpQX5jD06cGxIZHQW8z+21SjBbrE851Y1i7Y111675/pkE9JJnu2/an2pUaBwf/hb
	 xrsV0p0VAyz61M9vT2UPGAcI6dOjYpBkz2BX5BSA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfL0Rl5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 12:41:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:38476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727494AbfL0Rl4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Dec 2019 12:41:56 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48CEE22B48;
        Fri, 27 Dec 2019 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577468516;
        bh=3cMs4tT+RemEJnmuF4khxgCvz9o2HcNgNZpneHdQLRw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NeO/Q6dCwVUNNbIphP1CyWFZP1iWckxfpgcffIefAK3QEAzwk22BGzs85cSj0To7z
         1z2R7N1DDOh+0FlWm5mZRmDVm4r9YtLNZlG7tKAvmT0ZIri0MH1tTTxPD0aatXWTXC
         lDaNW+izyfy8YejZ5Y8y1ZVQYL81Gf4WLh2mjyaU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Simon Horman <simon.horman@netronome.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 048/187] ARM: dts: Cygnus: Fix MDIO node address/size cells
Date:   Fri, 27 Dec 2019 12:38:36 -0500
Message-Id: <20191227174055.4923-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Florian Fainelli <f.fainelli@gmail.com>

[ Upstream commit fac2c2da3596d77c343988bb0d41a8c533b2e73c ]

The MDIO node on Cygnus had an reversed #address-cells and
 #size-cells properties, correct those.

Fixes: 40c26d3af60a ("ARM: dts: Cygnus: Add the ethernet switch and ethernet PHY")
Reported-by: Simon Horman <simon.horman@netronome.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Simon Horman <simon.horman@netronome.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 2dac3efc7640..1bc45cfd5453 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -174,8 +174,8 @@
 		mdio: mdio@18002000 {
 			compatible = "brcm,iproc-mdio";
 			reg = <0x18002000 0x8>;
-			#size-cells = <1>;
-			#address-cells = <0>;
+			#size-cells = <0>;
+			#address-cells = <1>;
 			status = "disabled";
 
 			gphy0: ethernet-phy@0 {
-- 
2.20.1

