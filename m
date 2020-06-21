Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CAAC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AFD32336F
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="AjoO0/Rd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgFUTki (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:40:38 -0400
Received: from mout.web.de ([212.227.15.3]:39119 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730170AbgFUTkh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 21 Jun 2020 15:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592768429;
        bh=cUH/lxbu1fDaoPxE38bxOH+KGOlEgJnXQgjvrcxT/uA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=AjoO0/RdHCDO/Vym1em35nW2F3J0HbBPyQgDgZBTEFQRM0jq3ZVwlr6tI6Myw5Vnp
         PM/LHKKaZDCw69NLYjrrlRVNrqq1RtbQD0sdkmouq61LhF91lBFqf5UtcWJxkEgpBX
         6M2I8W3VGrxGh2eyxF/jupodQA1eueiqsJxK8BS4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from LaptopNick.fritz.box ([79.227.109.96]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2BI2-1ijXtr0Hi2-013cJK; Sun, 21
 Jun 2020 21:40:29 +0200
From:   Nick Reitemeyer <nick.reitemeyer@web.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: [PATCH 1/2] ARM: defconfig: u8500: Enable CONFIG_KEYBOARD_TM2_TOUCHKEY
Date:   Sun, 21 Jun 2020 21:38:22 +0200
Message-Id: <20200621193822.133683-1-nick.reitemeyer@web.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DyZiYPMqoGw8YEI0qM3yC3WNyGI7BEBQYd5iDRdmlUuzABPAeLs
 M9EpxDT3nveEpsqTy2ZVLl26OST0WENzbaskw/yo1XflVinz//I41TAQcPEA7QMOidaazqP
 KPFO3IbzAVgcIvjMiZa76ftAyixPs9UTGoZrczDHkmBaEnXlB7ihxN+s56avLYx1GY270nw
 uyPxukCrpvAhFOv7wWzEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i2D3AhZIRJo=:6O38u/UKDaD2I0lxJBHm6a
 PRYX1r/BL9JzjPmqTeiRhVDK8mXpiOjCvgjne+Ze04epEexrz0JYZF/bZtpQtEtuXc2VyIPfS
 1C8jGNfIaSY49K3BfzEHTnQy8HV17qj68mbzQgBrMKgX5D0cr2884uuLdIdNQWLkTNZ8a1UaE
 MrA5mXHxPBpTS8xb8VS5RQWIzL73SNFIrdjOGGRxMRqd439masWZpfiOty/bV7jFdy4DKmMWE
 SmYfL3sshxnUd2ZzsLHOY2bYIXkVRU+aZp0JYJjDT5UGMrsP45oqg4Hlkij9CJmzS2E6Nf60E
 0+URUnGbqO44ZN1C1hJZ+c4v3xM5oUyZ0J2AUEZJnAg+RsMTH+TquEglMDOVfMyv000udmPLZ
 2bJ2eWtLTNGIjQE/0YrjkoxjPYDQJKir8H9hZefBM26L0dYscbs88cntbjK43Pn5QdlNUTEfY
 6WJwzuhpKc2pe/57Bdtq9kZ946QP/6UTfpTRKUQYVS3wXZJ2HgO6tWHhXPWCzJe/P1+oYmh93
 AgdUM8aR0SpvQzoOgoUR2vKcuVAPtKx+Y3IGw8ZsKn9IzVmzbjBnA2UO3J0kA0+FP28TCcRLz
 ILYietK6gGyH/6kgMZdzserYc4ck0QYJy2nQnH+/B6uMtRQeOFR8f2q1rqLXD67RcA2QIPFNu
 n4XJhlvVReGi+HwaLyKhZOL2E239mMMd38GdB8uq7MeYwSrZyig26G5QMk9gjsPFhk6IaOKAI
 /dfS5z+A6+EW2HMn2L0t3SpqlaabTvPpFjWqpTjLX8I0xtFEzJI0UW7csE1twBB2q/KuBqmpJ
 UkjXIGdBWboY250B5UWOktKV06KI0jd+fq1xVBgm+d0sulP57plhXgRLKBHsGcDK6JpNO2f/f
 9ANTN3PQIKJ3NUe1cIVSKhWe3cVPHI8RklAxo4/tUwvhLn+Cpr+twoaONipiqCOScaJWxMbco
 mcFMqZtZVv4TL8q75ZDgKH/GytZaXl5gfA3wbgNkYxwDsQZz1jhiHo5M40OXq2kjsxsw07V2+
 7LDpF2PRXfRB1oZ7x6XUOjaWUrjcbTfuYhZ+uBIUHo0r/xK7uWoJ7yKLxV1Ca720KZJGs6Qv6
 ie6nkX32z9ec3NFOaEOat+fqdEYvgEuTv5ub4qzuQYxRv1MEvUGvrBM9+NbT3uXvOkkMITlxG
 +c/uSxErYONux+2+cjVR0GgZvDw1VfwhutzosY1Slr4VDGcOLVsHaL8MLCEwM7feHO5SHfpZQ
 x5N2I1E7wLWTG46WU
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Required for touchkey support on samsung-golden.

Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
=2D--
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_def=
config
index 28dd7cf56048..dba57fd7da52 100644
=2D-- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -56,6 +56,7 @@ CONFIG_KEYBOARD_GPIO=3Dy
 CONFIG_KEYBOARD_NOMADIK=3Dy
 CONFIG_KEYBOARD_STMPE=3Dy
 CONFIG_KEYBOARD_TC3589X=3Dy
+CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=3Dy
 CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
=2D-
2.27.0

