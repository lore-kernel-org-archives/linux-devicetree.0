Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA29FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6781E215EA
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573214208;
	bh=nrwlX0+o3IBQvyjj/20EPhRXPTRgqzdCYKUR/stkalw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rT5nKi+YUpVbrq5lr1Am5BTPZRoVhv68JcafcM+/BVxdW2lsHGZ2moovCHAIqVlCI
	 cd495VLhPQWS8f3xdH2SMjUH2YUIL8GVQf0rSrMobxtdYAgL75wRZl+pcY8FuWI3Nl
	 NawyrA9LOdFTRvDJizF1/UpnsSnwZjFEzc62fY9A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391104AbfKHLp1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:45:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391102AbfKHLp1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:45:27 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F30CF222C4;
        Fri,  8 Nov 2019 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213526;
        bh=nrwlX0+o3IBQvyjj/20EPhRXPTRgqzdCYKUR/stkalw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wG3p3ZECYfbX2DjUgpkRAPwgyZDa9MzkUxW/0DNs35mLuySLp5Qghm0KSnDZWhoSY
         y7o7TRpd96UrRYORwhxec1IJ4kDToVwS0TkwEN+kUcdPmw1rFLAOfrIOT9J+bJlJzz
         /uNeXhHnjkqB2uNz+B2mR8M0NzWWjhlDaVesq8+o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 090/103] ARM: dts: socfpga: Fix I2C bus unit-address error
Date:   Fri,  8 Nov 2019 06:42:55 -0500
Message-Id: <20191108114310.14363-90-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114310.14363-1-sashal@kernel.org>
References: <20191108114310.14363-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@kernel.org>

[ Upstream commit cbbc488ed85061a765cf370c3e41f383c1e0add6 ]

dtc has new checks for I2C buses. Fix the warnings in unit-addresses.

arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dtb: Warning (i2c_bus_reg): /soc/i2c@ffc04000/adxl345@0: I2C bus unit address format error, expected "53"

Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
index b280e64941938..31b01a998b2ed 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
@@ -88,7 +88,7 @@
 	status = "okay";
 	clock-frequency = <100000>;
 
-	adxl345: adxl345@0 {
+	adxl345: adxl345@53 {
 		compatible = "adi,adxl345";
 		reg = <0x53>;
 
-- 
2.20.1

