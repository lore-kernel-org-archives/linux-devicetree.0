Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001E6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 14:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAE8B221FF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590159295;
	bh=rgoYLS+WMEIn3HQPScbZElKfuAs0VrEeOrN4VJIZ2TQ=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=kI3ZiXRvV5Mx70r+n3CVzjKkyclP9x2WSTEePzDcw3oMAXNJYf+o8KMC0gtWKqhZN
	 4hpIs7mkAn/S1veshtYdlGRJTgQ4STwXI1Tz+k35YCNoN8upwRRdVAG4pPWAtZ/H0f
	 DtYIS/orhKC61XV3h+A3X/Ny5KI3dOzv1ReTthMU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731012AbgEVOyy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 10:54:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730942AbgEVOvW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 May 2020 10:51:22 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BD8422256;
        Fri, 22 May 2020 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590159082;
        bh=rgoYLS+WMEIn3HQPScbZElKfuAs0VrEeOrN4VJIZ2TQ=;
        h=From:To:Cc:Subject:Date:From;
        b=ngckiuZVIwXXtf1HJK7uYSt3h1dbuQx+KUcLR4wsjec/CFex0JD1u69FUPmxLUnqQ
         YhXki5UUZvRzdR+VrWF2Sx/OEZwWrmX9p6ChVRrGvGdaIradmJhQINYXFy/HnSXRFB
         yUUFwu/YYZKj9/wZ6Tf6Sx+wDDUsQZzumPNsuekA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johan Jonker <jbx6244@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/19] ARM: dts: rockchip: fix phy nodename for rk3228-evb
Date:   Fri, 22 May 2020 10:51:02 -0400
Message-Id: <20200522145120.434921-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Johan Jonker <jbx6244@gmail.com>

[ Upstream commit 287e0d538fcec2f6e8eb1e565bf0749f3b90186d ]

A test with the command below gives for example this error:

arch/arm/boot/dts/rk3228-evb.dt.yaml: phy@0:
'#phy-cells' is a required property

The phy nodename is normally used by a phy-handle.
This node is however compatible with
"ethernet-phy-id1234.d400", "ethernet-phy-ieee802.3-c22"
which is just been added to 'ethernet-phy.yaml'.
So change nodename to 'ethernet-phy' for which '#phy-cells'
is not a required property

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=~/.local/lib/python3.5/site-packages/dtschema/schemas/
phy/phy-provider.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/r/20200416170321.4216-1-jbx6244@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/rk3228-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3228-evb.dts b/arch/arm/boot/dts/rk3228-evb.dts
index 5670b33fd1bd..aed879db6c15 100644
--- a/arch/arm/boot/dts/rk3228-evb.dts
+++ b/arch/arm/boot/dts/rk3228-evb.dts
@@ -46,7 +46,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		phy: phy@0 {
+		phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id1234.d400", "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			clocks = <&cru SCLK_MAC_PHY>;
-- 
2.25.1

