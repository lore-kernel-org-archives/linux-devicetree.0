Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98382C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 18:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F08C207E8
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 18:39:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCCO7aSY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgFZSjf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 14:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFZSje (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 14:39:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153DBC03E979
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 11:39:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k6so10431712wrn.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMDuwUNRs+EOO6BCVWiN596G+KVOPQeVgYe+K4ZjvT4=;
        b=TCCO7aSY8BJU1krb1NDt6A93pmACuYX6CLcNKLUqE5K1TuGD68Ba5bZKyj6t/YyLao
         kxaAgirKKS/B7znVCLSWEUuIZDodn1O49sQz17M8+G5zmEvfI/slWHqe2EYL7Z69cOby
         DrPzYvbB7qJYxuz1aJwPHghvPDVKi2VTMIDIGINZ7U1zyz6rzj+s9ziMq9X482t56iVr
         euF6u+3tGAhgn4wi04xERtBQkRETNn0KyuAdghF08ql41QqWA5VneUeVxGMvAgeW2mTH
         Kb6e95doqC+//a7gtbyH4WQzkuNm57O16bkyY5cdXcLTo4ayo7U5qbFI0aRxiKiegtov
         d4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMDuwUNRs+EOO6BCVWiN596G+KVOPQeVgYe+K4ZjvT4=;
        b=XbPNYbrtP7AkxHDO4Zq5czJ39HCXswcixolqK5AclXRqzQDM7wt8dJJaTDtxZQmx4k
         iPL30DqjRnmNZwSYad0u5oLm6JZvXiI1f+S/a81wgNDP/IJZP5HSadNccgswoRlA1L91
         SSIbNNMSDsklN2cQiXpyULflon6LSxw3/PsOIlce44o7ubALuDVcSTYG/lJ9rHDPH1vf
         L6tSPgE9EFG7cDFOz1XpZ7GGI7dKnwbSPVjP9XGJrfvobs6rFlau93NCDBNY3WWvMQXN
         F1anDzog8u5CY76QdxQKOkj4DcZ1BvlRk6h5YnLzKBeKi3AOql79cMTtrGzcyMfwHuth
         eVUA==
X-Gm-Message-State: AOAM531Z3Co+/0Zuz7ZgGFZUb2Q1HqkKpox0FuRXQs7hqqEwHK6kaZJj
        zE5ZPo87vVUNZtRSSugf1WU=
X-Google-Smtp-Source: ABdhPJzZstgecs1WxLIZHjOJnUEHcC+lmy4vIreQNJKXFZwzU7wmJQ89HrJbWsOJm+TWnRoOaVKpEQ==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr5632120wrn.157.1593196772886;
        Fri, 26 Jun 2020 11:39:32 -0700 (PDT)
Received: from tool.localnet ([213.177.196.114])
        by smtp.googlemail.com with ESMTPSA id u10sm18047670wml.29.2020.06.26.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 11:39:32 -0700 (PDT)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     jason@lakedaemon.net
Cc:     andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: dlink-dns327l: fix reg-init PHY
Date:   Fri, 26 Jun 2020 20:39:05 +0200
Message-ID: <10150060.RLU44xrj3c@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The marvell PHY reg-init registers for the D-Link DNS-327L are wrong.
Currently the first field is used to set the page 2, but this is
pointless. The usage is not correct, and we are setting the wrong
registers.

=46ix it.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
=2D--
 arch/arm/boot/dts/armada-370-dlink-dns327l.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts b/arch/arm/boot=
/dts/armada-370-dlink-dns327l.dts
index baa459dd5..2008c6eaa 100644
=2D-- a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
+++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
@@ -247,9 +247,8 @@ &uart1 {
 &mdio {
 	phy0: ethernet-phy@0 { /* Marvell 88E1318 */
 		reg =3D <0>;
=2D		marvell,reg-init =3D <0x0 0x16 0x0 0x0002>,
=2D				<0x0 0x19 0x0 0x0077>,
=2D				<0x0 0x18 0x0 0x5747>;
+		marvell,reg-init =3D <0x2 0x19 0x0 0x0077>,
+				   <0x2 0x18 0x0 0x5747>;
 	};
 };
=20
=2D-=20
2.27.0




