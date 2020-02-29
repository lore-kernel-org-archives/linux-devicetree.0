Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F090EC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 09:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B94CC2468A
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 09:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="T6TqMTtX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgB2Jo2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 04:44:28 -0500
Received: from mout.gmx.net ([212.227.15.15]:35613 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbgB2Jo2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Feb 2020 04:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582969460;
        bh=IbPpx2+40p0C4K8R3LarbXZlz4M+K8npKF9xM0145sM=;
        h=X-UI-Sender-Class:From:Subject:Date;
        b=T6TqMTtX2rcJ/JWgGrGVT8g5DKpTEfkMQyCXoFBc0wVYJH8lmd6HGxZKuqhU/1ASy
         BVLW3gDbCV4xLiU8+L9YmPfJjdF6OvRxedkgdFb9Xr6TWW5B9pGOGvFGe60Rc3GURa
         RHxvXSQNR/wFzFaW66sRDP7hVG+0TGWqfUSCWY+E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from zoom ([188.223.33.120]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Md6Qr-1jh2My3hzf-00aGn9; Sat, 29
 Feb 2020 10:44:20 +0100
Received: by zoom (Postfix, from userid 2000)
        id 77B7619C1BC9; Sat, 29 Feb 2020 09:44:15 +0000 (GMT)
From:   Nick Hudson <nick.hudson@gmx.co.uk>
Subject: [PATCH] ARM: bcm2835-rpi-zero-w-dts: Add missing pinctrl-names
Message-Id: <20200229094415.77B7619C1BC9@zoom>
Date:   Sat, 29 Feb 2020 09:44:15 +0000 (GMT)
X-Provags-ID: V03:K1:eZoTJs3XbuAfABcf1g3UZoP5D40a7wRPieELlSEWsm7G/Fcx+3b
 1b8gdTGTQmjRaHNHQOudcVexXZWRCp6Gf6EBkEtSYxBNgzetevr0vwcxLZNmTl1XHwt2KYX
 kISicN2zkLSJ2O00Q/cn4LJ/dKYAlhf7dKgcx2pfLxGRbG5EjJJ/bgMwucY7Q+icxRxCVWC
 aisqi3bMIGeGKH/cUmPXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gT+5MDDyRks=:85so6DKPK6Wj+G32KEfo9C
 DPeQwJnmTkjTXB1IdIMLOdy7IfPcolmCoc/DYrGpRSE37qu95C8bQ0bVTONzn1wUUCzH1JHOB
 gL1v4F8yZQxr2an7KhRtBeLMZ4CG47Ed5Fg5wJ362sg3l4BFbJLc1UlhsR4hElXm0UIMzOkb/
 r97Bx2cguG0D8bZFFFM7wa+f0OVmVD3Ifg7TaZCB0fHi1MwkcfSvIgmHLJC19tx2DusrxZDr0
 DP5j9+XTSqUIejAXx0Q88PS4MxgzeqY8lG7uFfcrWHoHfv7Hhri+fBhc/qrlAcnCFnUsVNYEI
 ThkdYPwsetm14reSuKfhBJsq4YYUPbI8XwxPI06hCwbnCExTrjTGLZf1MYGnuM6tbBK+Y8z9C
 USfI4EP4BkWeHdpVPsiDrtdF7NstggPz4LyHPTaI6WVpRhQmHtXDsRvewcTBt/xtFj5xtpeyy
 m+EPQPGdCKPDujU3VyfX/ywl+unjynLIqXJArWsg7XkSKVjWHwCWKdrSm5tmKx5ndmMjMU1Vu
 TrI7qHQjEXGr+DZNdeDcZ+DZ2Fdh1KzS/ghRfm3o+YInWhl7ZDibQ6STAieknI+9X2g477sAF
 R3rcePYKwv9xS1MUMgql3n2grYmaRUUdsgNcUOBe+XoiaUjxkEWxVrPSo28bmta2sjngrAPXF
 p0+EP32zrHw2S0hG54iMjOzS76+iURbORgPfRV6um7HH94w5lF/FLhLFLeC/PFQ8RgjMDblU6
 eF+8ZQWewW5L5dsZ1i/Fn1vrmm5Rk7lW8vet2lRvey289MyGsa83eP1tn3kSnfoDbVnxahgWz
 8qe8MHb8QmyGrBhX4DaocLKkE1ifAKn1kb4DgX0lMBYVKmFzwmsar87mKDF0avb+/63L9i2Ws
 +3ipYOTYAAFBhHy0IdntwFwVRw/DGMv6Du+eEhhpJMfNyYjgtBEqAuVBaO1DFL1d+Xf3lq3+e
 XwSJS//Yq3XSGZgceIOEPhgRjWglOxXHe/86uC1j+ecpWLaC0mmGi1G5HStJOMyXfZfJECrg4
 be3tXO0rfkR33JDeO1LI+yz0wxRm77m/+etV8LZteDXqq5DTO4mtFpCZ/kAG8VeD7IORK+9NZ
 JHhCDHwaszfvfHW9pQsfBkUdBB/p80bIdoe/tetmA8n0BGgulJhL5NhTQVGb4Hh8lP2BQcltZ
 tHSghLRoHbwNkX8F4ZjUFsTWxEIq6b4T0Vd5M4XHdo7DPRoCVATZ5iBHev9chOOxFPJmrTA7v
 XjHcFTUFKWDSO0G52
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define the sdhci pinctrl state as "default" so it gets applied
correctly and to match other RPis.

Signed-off-by: Nick Hudson <skrll@netbsd.org>
=2D--
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/=
bcm2835-rpi-zero-w.dts
index b75af21069f9..4c3f606e5b8d 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -112,6 +112,7 @@
 &sdhci {
 	#address-cells =3D <1>;
 	#size-cells =3D <0>;
+	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&emmc_gpio34 &gpclk2_gpio43>;
 	bus-width =3D <4>;
 	mmc-pwrseq =3D <&wifi_pwrseq>;
=2D-
2.17.1

