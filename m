Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D352CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 16:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22577218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 16:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfJaQld (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 12:41:33 -0400
Received: from shell.v3.sk ([90.176.6.54]:48150 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728645AbfJaQld (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 31 Oct 2019 12:41:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A295C51142;
        Thu, 31 Oct 2019 17:35:10 +0100 (CET)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Te_oO1nBQVKz; Thu, 31 Oct 2019 17:35:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 51A1651146;
        Thu, 31 Oct 2019 17:35:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 6mCmVhTsI1n8; Thu, 31 Oct 2019 17:34:59 +0100 (CET)
Received: from belphegor.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 3979C51144;
        Thu, 31 Oct 2019 17:34:59 +0100 (CET)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     soc@kernel.org
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 4/4] ARM: dts: mmp3-dell-ariel: Add a serial point alias
Date:   Thu, 31 Oct 2019 17:34:55 +0100
Message-Id: <20191031163455.1711872-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031163455.1711872-1-lkundrak@v3.sk>
References: <20191031163455.1711872-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Make sure UART3, where the console is, is called ttyS2. That is
consistent with the early console.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mm=
p3-dell-ariel.dts
index 0855b5f1d1f35..c1947b5a688d7 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -14,6 +14,10 @@
 	model =3D "Dell Ariel";
 	compatible =3D "dell,wyse-ariel", "marvell,mmp3";
=20
+	aliases {
+		serial2 =3D &uart3;
+	};
+
 	chosen {
 		#address-cells =3D <0x1>;
 		#size-cells =3D <0x1>;
--=20
2.23.0

