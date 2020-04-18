Return-Path: <SRS0=a4mE=6C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AEAC38A2E
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Apr 2020 12:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09331206D9
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Apr 2020 12:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="q08HAg/Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgDRMfs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Apr 2020 08:35:48 -0400
Received: from smtp-outgoing.laposte.net ([160.92.124.98]:60581 "EHLO
        smtp-outgoing.laposte.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgDRMfs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Apr 2020 08:35:48 -0400
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
        by mlpnf0101.laposte.net (SMTP Server) with ESMTP id 494C9W52BzzFpTy;
        Sat, 18 Apr 2020 14:35:43 +0200 (CEST)
X-mail-filterd: 0.4.0.2
X-mail-filterd: 0.4.0.2
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK, (-100)(0000)gggruggvucftvghtrhhoucdtuddrgeduhedrfeelgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfntefrqffuvffgpdfqfgfvpdggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeggihhntggvnhhtucfuthgvhhhlrocuoehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvtheqnecuffhomhgrihhnpehrrghsphgsvghrrhihphhirdhorhhgnecukfhppeekkedruddvuddrudegledrgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheprhhomhhurghlugdrsggvrhhgvghrihgvpdhinhgvthepkeekrdduvddurddugeelrdegledpmhgrihhlfhhrohhmpehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhhjuhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggvnhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhdrfhgrihhnvghllhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhtvghfrghnrdifrghhrhgvnhesihdvshgvrdgtohhmpdhrtghpthhto
 heprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhpihdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepnhhsrggvnhiijhhulhhivghnnhgvsehsuhhsvgdruggvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-lpn-mailing: LEGIT
Received: from romuald.bergerie (unknown [88.121.149.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mlpnf0101.laposte.net (SMTP Server) with ESMTPSA id 494C9W2c7bzFpTw;
        Sat, 18 Apr 2020 14:35:43 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
        by romuald.bergerie (Postfix) with ESMTPS id 1329E381F5A4;
        Sat, 18 Apr 2020 14:35:43 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.93)
        (envelope-from <vincent@radicelle.bergerie>)
        id 1jPmhC-0001fl-Oi; Sat, 18 Apr 2020 14:35:42 +0200
From:   =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
To:     devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] ARM: dts: bcm2835-rpi-zero-w: Fix led polarity
Date:   Sat, 18 Apr 2020 14:35:22 +0200
Message-Id: <20200418123522.6390-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd; t=1587213346; bh=XWpoOgwwiaPGH2pwzpgAmnxIC35KGk78zHkgFD/F910=; h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding; b=q08HAg/YkCNLBaYGoLcZ0Yb1AdR1aCghdilcqYBNc8mQMHP0agMh+FMzp9yjWsgb1pPOwKYSjV9SJLPHQ3l5zWhHTTt6GZE9nP89wsrnxBlYOfbqFsnMk0Qr8YPXaeS9JS7KZf1nj7X9/P+m/9+zNXjy0ZzOYoXm91w+CPZdVtcBTUVoe4GnAKE1vJCLZLdMCVAgGSvblRAFqmTzuUGwNkOmMWOQQ3LsG/LKs8CIJCJZAxtQCPhPVlXjwFiITV/8Urv5Dq4vAVIiGfr9WFwr8t12R3VJweawyQGMzIILTdPZ9VSlI5WJ3xF3hIHyO73p2xxNg+OXUXq/xDK7OjBxZQ==;
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The status "ACT" led on the Raspberry Pi Zero W is on when GPIO 47 is low=
.

This has been verified on a board and somewhat confirmed by both the GPIO
name ("STATUS_LED_N") and the reduced schematics [1].

[1]: https://www.raspberrypi.org/documentation/hardware/raspberrypi/schem=
atics/rpi_SCH_ZeroW_1p1_reduced.pdf

Fixes: 2c7c040c73e9 ("ARM: dts: bcm2835: Add Raspberry Pi Zero W")
Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts=
/bcm2835-rpi-zero-w.dts
index 4c3f606e5b8d8..f65448c01e317 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -24,7 +24,7 @@ chosen {
=20
 	leds {
 		act {
-			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
+			gpios =3D <&gpio 47 GPIO_ACTIVE_LOW>;
 		};
 	};
=20
--=20
2.25.1

