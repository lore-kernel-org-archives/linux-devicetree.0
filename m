Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAD_ENC_HEADER,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FC1CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 08:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92642214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 08:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cards-online.eu header.i=@cards-online.eu header.b="ZFobw4+7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387582AbfJ1I6q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 04:58:46 -0400
Received: from mail.cards-online.eu ([94.177.250.130]:47056 "EHLO
        mail.cards-online.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730849AbfJ1I6p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 04:58:45 -0400
X-Greylist: delayed 492 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Oct 2019 04:58:43 EDT
Received: by mail.cards-online.eu (Postfix, from userid 1001)
        id DFB25874B2; Mon, 28 Oct 2019 09:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cards-online.eu;
        s=mail; t=1572252633;
        bh=o1av1mQqQEXBrq4rAnQb8z29k2oPhBpBUHpQXEwKVXg=;
        h=Date:From:To:Subject:From;
        b=ZFobw4+7jEREVCDnC4fNhe3DjBl34N7SOr/N0bQy8TTAfyGT4TVwXbxDewG2oT0r7
         53nInX8ZbPingRAKQXQmMQlaOV+p46I7QNHwOnxwK0ayU965TrEkY/OjGiSga2CQU1
         BFOogG894WiIyR8QJ5i+9601aVZM/zQB6aNO3HVs=
Received: by mail.cards-online.eu for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 08:50:29 GMT
Message-ID: <20191028084500-0.1.h.ho8.0.6ul6h30w2j@cards-online.eu>
Date:   Mon, 28 Oct 2019 08:50:29 GMT
From:   =?UTF-8?Q?
         "=D0=A0=D0=B0=D0=B4=D0=BA=D0=BE_=D0=93=D0=B0=D0=B2=D1=80=D0=B8=D0=BB=D0=BE=D0=B2"
         ?= <radko.gavrilov@cards-online.eu>
To:     <devicetree@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=90=D0=BD=D0=B3=D0=B0=D0=B6=D0=B8=D1=80=D0=B0=D0=BD_=D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB?=
X-Mailer: mail.cards-online.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,

=D0=92=D1=8A=D0=B2 =D0=B2=D1=81=D0=B5=D0=BA=D0=B8=D0=B4=D0=BD=D0=B5=D0=B2=
=D0=BD=D0=B8=D1=82=D0=B5 =D1=81=D0=B8 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BD=
=D0=B8 =D0=BA=D0=BE=D0=BD=D1=82=D0=B0=D0=BA=D1=82=D0=B8 =D1=81 =D1=80=D0=B0=
=D0=B7=D0=BB=D0=B8=D1=87=D0=BD=D0=B8 =D0=BF=D0=B0=D1=80=D1=82=D0=BD=D1=8C=
=D0=BE=D1=80=D0=B8 =D1=81=D0=B5 =D1=83=D0=B1=D0=B5=D0=B4=D0=B8=D1=85=D0=BC=
=D0=B5, =D1=87=D0=B5 =D0=B4=D0=BE=D0=BF=D1=8A=D0=BB=D0=BD=D0=B8=D1=82=D0=B5=
=D0=BB=D0=BD=D0=B8=D1=82=D0=B5 =D1=81=D1=82=D0=B8=D0=BC=D1=83=D0=BB=D0=B8=
 =D0=B7=D0=B0 =D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0 =D0=BF=
=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D0=BB=D1=8F=D0=B2=D0=B0=D1=82 =
=D0=B5=D0=B4=D0=B8=D0=BD =D0=BE=D1=82 =D0=BD=D0=B0=D0=B9-=D0=B4=D0=BE=D0=B1=
=D1=80=D0=B5 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B5=D1=89=D0=B8=D1=82=D0=B5=
 =D0=BC=D0=B5=D1=85=D0=B0=D0=BD=D0=B8=D0=B7=D0=BC=D0=B8 =D0=B7=D0=B0 =D0=B7=
=D0=B0=D1=81=D0=B8=D0=BB=D0=B2=D0=B0=D0=BD=D0=B5 =D0=BD=D0=B0 =D0=B5=D1=84=
=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=B8=
 =D0=BB=D0=BE=D1=8F=D0=BB=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0=
 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BD=D0=BE=D1=82=D0=BE =D0=BC=D1=8F=D1=81=
=D1=82=D0=BE.

=D0=A2=D0=BE=D1=87=D0=BD=D0=BE =D0=BF=D0=BE=D0=B2=D0=B8=D1=88=D0=B0=D0=B2=
=D0=B0=D0=BD=D0=B5=D1=82=D0=BE =D0=BD=D0=B0 =D0=B0=D0=BD=D0=B3=D0=B0=D0=B6=
=D0=B8=D1=80=D0=B0=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BA=D1=8A=D0=BC=
 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BD=D0=B0=D1=82=D0=B0 =D1=81=D1=80=D0=B5=
=D0=B4=D0=B0 =D0=BF=D0=BE=D1=81=D1=82=D0=B5=D0=BF=D0=B5=D0=BD=D0=BD=D0=BE=
 =D1=81=D1=82=D0=B0=D0=BD=D0=B0 =D0=BE=D1=81=D0=BD=D0=BE=D0=B2=D0=BD=D0=B0=
 =D0=B3=D1=80=D0=B8=D0=B6=D0=B0 =D0=BD=D0=B0 =D0=BF=D0=BE=D0=B2=D0=B5=D1=87=
=D0=B5=D1=82=D0=BE =D0=B1=D0=B8=D0=B7=D0=BD=D0=B5=D1=81 =D0=BB=D0=B8=D0=B4=
=D0=B5=D1=80=D0=B8 =D0=B2 =D1=81=D1=82=D1=80=D0=B0=D0=BD=D0=B0=D1=82=D0=B0=
=2E

=D0=98=D0=BC=D0=B5=D0=BD=D0=BD=D0=BE =D0=BF=D0=BE=D1=80=D0=B0=D0=B4=D0=B8=
 =D1=82=D0=BE=D0=B2=D0=B0, =D0=BA=D0=BE=D0=BC=D0=BF=D0=B0=D0=BD=D0=B8=D0=B8=
=D1=82=D0=B5 =D0=B2=D1=81=D0=B5 =D0=BF=D0=BE-=D1=87=D0=B5=D1=81=D1=82=D0=BE=
 =D0=B8=D0=B7=D0=B1=D0=B8=D1=80=D0=B0=D1=82 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=
=D1=80=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 =D0=BA=
=D0=B0=D1=82=D0=BE =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B0 =D0=BF=
=D1=80=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B0, =D0=BA=D0=BE=D1=8F=
=D1=82=D0=BE =D0=B1=D0=B8 =D0=BC=D0=BE=D0=B3=D0=BB=D0=B0 =D0=B4=D0=B0 =D0=
=B1=D1=8A=D0=B4=D0=B5 =D0=BE=D0=BF=D0=BE=D0=BB=D0=B7=D0=BE=D1=82=D0=B2=D0=
=BE=D1=80=D0=B5=D0=BD=D0=B0 =D0=BF=D0=BE =D0=B8=D0=B7=D0=B1=D0=BE=D1=80 =D0=
=BD=D0=B0 =D1=81=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D1=8F - =D0=B2=
 =D0=BC=D0=B0=D0=B3=D0=B0=D0=B7=D0=B8=D0=BD=D0=B8, =D1=80=D0=B5=D1=81=D1=82=
=D0=BE=D1=80=D0=B0=D0=BD=D1=82=D0=B8 =D0=B8=D0=BB=D0=B8 =D0=BE=D0=BD=D0=BB=
=D0=B0=D0=B9=D0=BD =D0=B7=D0=B0=D0=B2=D0=B5=D0=B4=D0=B5=D0=BD=D0=B8=D1=8F=
=2E

=D0=9E=D1=81=D0=B2=D0=B5=D0=BD =D0=BF=D0=BE-=D1=81=D0=B5=D1=80=D0=B8=D0=BE=
=D0=B7=D0=BD=D0=B0=D1=82=D0=B0 =D0=B0=D0=BD=D0=B3=D0=B0=D0=B6=D0=B8=D1=80=
=D0=B0=D0=BD=D0=BE=D1=81=D1=82 =D0=B8 =D0=BB=D0=BE=D1=8F=D0=BB=D0=BD=D0=BE=
=D1=81=D1=82, =D0=BA=D0=BE=D1=8F=D1=82=D0=BE =D1=81=D0=B5 =D0=BD=D0=B0=D0=
=B1=D0=BB=D1=8E=D0=B4=D0=B0=D0=B2=D0=B0 =D0=BF=D1=80=D0=B8 =D1=81=D0=BB=D1=
=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5 =D1=81=D0=BB=D0=B5=D0=
=B4 =D0=BF=D1=80=D0=B8=D0=BB=D0=B0=D0=B3=D0=B0=D0=BD=D0=B5=D1=82=D0=BE =D0=
=BD=D0=B0 =D1=82=D0=B0=D0=B7=D0=B8 =D0=BC=D1=8F=D1=80=D0=BA=D0=B0, =D0=BA=
=D0=BE=D0=BC=D0=BF=D0=B0=D0=BD=D0=B8=D0=B8=D1=82=D0=B5 =D0=BF=D0=BE=D0=BB=
=D1=83=D1=87=D0=B0=D0=B2=D0=B0=D1=82 =D0=B8 =D0=B4=D0=BE=D0=BF=D1=8A=D0=BB=
=D0=BD=D0=B8=D1=82=D0=B5=D0=BB=D0=B5=D0=BD =D1=81=D1=82=D0=B8=D0=BC=D1=83=
=D0=BB =D0=BE=D1=82 =D0=BC=D0=B5=D1=81=D1=82=D0=BD=D0=BE=D1=82=D0=BE =D0=B4=
=D0=B0=D0=BD=D1=8A=D1=87=D0=BD=D0=BE=D1=82=D0=BE =D0=B7=D0=B0=D0=BA=D0=BE=
=D0=BD=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=D0=BB=D1=81=D1=82=D0=B2=D0=BE.

=D0=91=D0=B8=D1=85=D1=82=D0=B5 =D0=BB=D0=B8 =D0=B8=D1=81=D0=BA=D0=B0=D0=BB=
=D0=B8 =D0=B4=D0=B0 =D0=92=D0=B8 =D0=B7=D0=B0=D0=BF=D0=BE=D0=B7=D0=BD=D0=B0=
=D0=B5=D0=BC =D0=BF=D0=BE-=D0=BF=D0=BE=D0=B4=D1=80=D0=BE=D0=B1=D0=BD=D0=BE=
 =D1=81 =D1=82=D0=B5=D0=B7=D0=B8 =D1=80=D0=B5=D1=88=D0=B5=D0=BD=D0=B8=D1=8F=
, =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=B2=D1=8F=D1=80=D0=B2=D0=B0=D0=BC=D0=B5=
 =D0=B1=D0=B8=D1=85=D0=B0 =D0=B1=D0=B8=D0=BB=D0=B8 =D0=BF=D0=BE=D0=B4=D1=85=
=D0=BE=D0=B4=D1=8F=D1=89=D0=B8 =D0=B8 =D0=B7=D0=B0 =D0=92=D0=B0=D1=88=D0=B0=
=D1=82=D0=B0 =D0=BA=D0=BE=D0=BC=D0=BF=D0=B0=D0=BD=D0=B8=D1=8F =D0=B8 =D1=81=
=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8?


=D0=A0=D0=B0=D0=B4=D0=BA=D0=BE =D0=93=D0=B0=D0=B2=D1=80=D0=B8=D0=BB=D0=BE=
=D0=B2
www.cards-online.eu=20
