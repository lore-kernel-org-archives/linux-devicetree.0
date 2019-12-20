Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B4DC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 07:01:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 605C224683
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 07:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfLTHBp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 02:01:45 -0500
Received: from [167.172.186.51] ([167.172.186.51]:59308 "EHLO shell.v3.sk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725920AbfLTHBp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 02:01:45 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id D43EFDFC79;
        Fri, 20 Dec 2019 06:53:25 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id jl0z1ywG4n5I; Fri, 20 Dec 2019 06:53:23 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 4F93DDFC9F;
        Fri, 20 Dec 2019 06:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id e92W2l2Ck0O1; Fri, 20 Dec 2019 06:53:22 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 39C66DFC76;
        Fri, 20 Dec 2019 06:53:22 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Olof Johansson <olof@lixom.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 5/5] ARM: dts: mmp3-dell-ariel: Enable the HSIC
Date:   Fri, 20 Dec 2019 07:53:14 +0100
Message-Id: <20191220065314.237624-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191220065314.237624-1-lkundrak@v3.sk>
References: <20191220065314.237624-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There's a SMSC USB2640 (USB hub & SD controller) connected to it, but
the SD card slot footprint is unpopulated. Also connected to the hub is
a SMSC LAN7500 gigabit ethernet adapter.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mm=
p3-dell-ariel.dts
index c1947b5a688d7..15449c72c042b 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -49,6 +49,28 @@ &usb_otg_phy0 {
 	status =3D "okay";
 };
=20
+&hsic0 {
+	status =3D "okay";
+
+	usb1@1 {
+		compatible =3D "usb424,2640";
+		reg =3D <0x01>;
+		#address-cells =3D <0x01>;
+		#size-cells =3D <0x00>;
+
+		mass-storage@1 {
+			compatible =3D "usb424,4040";
+			reg =3D <0x01>;
+			status =3D "disabled";
+		};
+	};
+};
+
+&hsic_phy0 {
+	status =3D "okay";
+	reset-gpios =3D <&gpio 63 GPIO_ACTIVE_HIGH>;
+};
+
 &mmc3 {
 	status =3D "okay";
 	max-frequency =3D <50000000>;
--=20
2.24.1

