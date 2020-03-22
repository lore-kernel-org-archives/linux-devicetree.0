Return-Path: <SRS0=OpRu=5H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AD1C4332B
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Mar 2020 16:23:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAB0520724
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Mar 2020 16:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="ma1pavz3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgCVQXv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Mar 2020 12:23:51 -0400
Received: from mr85p00im-hyfv06021301.me.com ([17.58.23.188]:51437 "EHLO
        mr85p00im-hyfv06021301.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726797AbgCVQXv (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 22 Mar 2020 12:23:51 -0400
X-Greylist: delayed 451 seconds by postgrey-1.27 at vger.kernel.org; Sun, 22 Mar 2020 12:23:51 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1584893780; bh=lUx573AhALdx5V9UYwZ7h1AoyYiVLJFqxyU5PbCpUmI=;
        h=From:To:Subject:Date:Message-Id;
        b=ma1pavz3PiIsOwmVg9f8z7scVV4fmyT4WEaiFHd1Jfe6z1KZ/QiF+koKGHn5g8vFt
         zsOuP+vYp9d3BhrD5UCEpuEgj+gNe0sEIIRGZZl9QkTgkxilYyaiw8fGLG3csK8LVB
         vDe5XSdhxWVH9GEX0h6wcmicy7F6pALXxdnLE1rkhvaxTkYCIK3LebQhjfT6o4w2Ec
         OgFTYgeui3spfmsbg/IJ90cGWPsNREGUUO8GVuU4S4TQKTVyfiupgqDSHoftrm9+g4
         5D6snyGBajUHf4ee0/amhe5JQWUpUzYWSSreAi87oLzjzwowH+U8XCEKEcj+x5Z34V
         J7cc00aKTq15g==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by mr85p00im-hyfv06021301.me.com (Postfix) with ESMTPSA id 6D26140520;
        Sun, 22 Mar 2020 16:16:19 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     patrice.chotard@st.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     avolmat@me.com
Subject: [PATCH] dts: arm: stih407-family: remove duplicated rng nodes
Date:   Sun, 22 Mar 2020 17:16:16 +0100
Message-Id: <20200322161616.19111-1-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2020-03-22_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-2003220099
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

the 2 rng nodes are duplicated within the stih407-family.dtsi

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/stih407-family.dtsi | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 7c36c37260a4..23a1746f3baa 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -767,20 +767,6 @@
 				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
 		};
 
-		rng10: rng@8a89000 {
-			compatible      = "st,rng";
-			reg		= <0x08a89000 0x1000>;
-			clocks          = <&clk_sysin>;
-			status		= "okay";
-		};
-
-		rng11: rng@8a8a000 {
-			compatible      = "st,rng";
-			reg		= <0x08a8a000 0x1000>;
-			clocks          = <&clk_sysin>;
-			status		= "okay";
-		};
-
 		mailbox0: mailbox@8f00000  {
 			compatible	= "st,stih407-mailbox";
 			reg		= <0x8f00000 0x1000>;
-- 
2.17.1

