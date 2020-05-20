Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEBAC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 04:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5148820758
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 04:31:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wnFPDkwl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgETEb0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 00:31:26 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42551 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgETEb0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 00:31:26 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 125F48066C;
        Wed, 20 May 2020 16:31:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1589949084;
        bh=HYil0aCAK5+cV7uSyh8qqAy3CoMjINfwMnZ5mKZOyJY=;
        h=From:To:Cc:Subject:Date;
        b=wnFPDkwlnxE7l21Sb9GAbJZ+A4pZIzashwqsB3ngY6yzLVnI5amSFVPnzR+1dIJEQ
         Hgt0HzYpPYXR7ndeRDCQ5qzj1OHypN1NVtMrYDdVBV/e6QX5G27dJq9P7A/sXgzIbb
         Rhoa4owNYgIunsFoyY5JapdSZrS0EnNcz4YgTG7hXKg4FR8FbvY+KeOT75PRcGj9SC
         EcgEbc9HVATgUlcTcWsc9H7L31SGWvMkwZtfGtGbuSVDJpjcVfMKiMpogi4XypkWIm
         aT041vMpVGX6l0/HmEnW0nIXh0eLLiEnML0uKzan0AdEWeWfzjDMQ8FYZhBQGbuw04
         vOIBeoY/EG9Fg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5ec4b29b0000>; Wed, 20 May 2020 16:31:23 +1200
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id 7C97D13ED56;
        Wed, 20 May 2020 16:31:22 +1200 (NZST)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 761965407CD; Wed, 20 May 2020 16:31:23 +1200 (NZST)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        f.fainelli@gmail.com,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH] ARM: dts: bcm: HR2: Fix PPI interrupt types
Date:   Wed, 20 May 2020 16:30:42 +1200
Message-Id: <20200520043042.7281-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These error messages are output when booting on a BCM HR2 system:
    GIC: PPI11 is secure or misconfigured
    GIC: PPI13 is secure or misconfigured

Per ARM documentation these interrupts are triggered on a rising edge.
See ARM Cortex A-9 MPCore Technical Reference Manual, Revision r4p1,
Section 3.3.8 Interrupt Configuration Registers.

The same issue was resolved for NSP systems in commit 5f1aa51c7a1e
("ARM: dts: NSP: Fix PPI interrupt types").

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/bcm-hr2.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-hr2.dtsi b/arch/arm/boot/dts/bcm-hr2.d=
tsi
index 6142c672811e..5e5f5ca3c86f 100644
--- a/arch/arm/boot/dts/bcm-hr2.dtsi
+++ b/arch/arm/boot/dts/bcm-hr2.dtsi
@@ -75,7 +75,7 @@ a9pll: arm_clk@0 {
 		timer@20200 {
 			compatible =3D "arm,cortex-a9-global-timer";
 			reg =3D <0x20200 0x100>;
-			interrupts =3D <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts =3D <GIC_PPI 11 IRQ_TYPE_EDGE_RISING>;
 			clocks =3D <&periph_clk>;
 		};
=20
@@ -83,7 +83,7 @@ twd-timer@20600 {
 			compatible =3D "arm,cortex-a9-twd-timer";
 			reg =3D <0x20600 0x20>;
 			interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) |
-						  IRQ_TYPE_LEVEL_HIGH)>;
+						  IRQ_TYPE_EDGE_RISING)>;
 			clocks =3D <&periph_clk>;
 		};
=20
@@ -91,7 +91,7 @@ twd-watchdog@20620 {
 			compatible =3D "arm,cortex-a9-twd-wdt";
 			reg =3D <0x20620 0x20>;
 			interrupts =3D <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
-						  IRQ_TYPE_LEVEL_HIGH)>;
+						  IRQ_TYPE_EDGE_RISING)>;
 			clocks =3D <&periph_clk>;
 		};
=20
--=20
2.25.1

