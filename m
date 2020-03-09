Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA5DC10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 16:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC47222522
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 16:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="k+AolkOW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgCIQtC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 12:49:02 -0400
Received: from mout.gmx.net ([212.227.15.19]:42619 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726804AbgCIQtC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Mar 2020 12:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583772532;
        bh=bJZASp2wqp9DJbqY/Zmxx2XfmImJ56qCMM/gAOy79bs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=k+AolkOW7aMPveXSRCzTW1mzf7AnpFbkVFgspbpnZTvRabNmYJv7vHXhmG+hZdW4m
         xadEFgOuNfF9RO9tM3+sggHp7u4fcF/iPFB4ylMYS4Zw1E9dsCpZJOZsWa/aO9e2ip
         o7r8KphXQ3j/bYe1/whvp14Ook5Q9+sHYLx7zRRU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from zoom ([188.223.33.120]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N4QsO-1jIX7y2CNq-011Pey; Mon, 09
 Mar 2020 17:48:52 +0100
Received: by zoom (Postfix, from userid 2000)
        id DA6F719C8597; Mon,  9 Mar 2020 16:48:50 +0000 (GMT)
From:   nick.hudson@gmx.co.uk
To:     linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Nick Hudson <nick.hudson@gmx.co.uk>, Nick Hudson <skrll@netbsd.org>
Subject: ARM: bcm2835-rpi-zero-w: Add missing pinctrl name
Date:   Mon,  9 Mar 2020 16:48:42 +0000
Message-Id: <20200309164842.8184-1-nick.hudson@gmx.co.uk>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:EWzltLxH3lc0PaDWKiDsDvrtgmxbVZf503xTW2EYG4eCK4WO0SI
 3s15ax8nQoxEuKgct+4iIiBQKyx+egXPSWusqhufDdo6QzSKLn39NODetwdcqb87WHczRBH
 VlpVFYRP9c2Zn9hfIuSOh+WIpPggeWCcBiIDuU9VTG3QNJaMYfE16GEpzut+H/F9/yCFVak
 68/tZm1NVIZr/r4dk4vSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:icy/k2Wp7oU=:uONgayPy9N7KjVWTwGtGlh
 WAVqB5tsMO0+MRSCav3ZMAZhwrnxoREnBm11+6xELUyfZqHREUXGojGXsZFl+SUW5bmtC+Y4x
 gwRGPFE3dAgRAE/5zgi6wm9RrzXPBTWPJRbFNk/w0hE1/HpwHGkFTceG6kntEdrd3X91pGtZo
 eL8xCjkOKngn2mhGgVQ8k8s96jbq2FVoHzICr1wBzVsDWYc8KCSg/v/jtA46oJU8LaWeCnz1C
 Ze1ODe7kWLiXjqpcByhjxFVvHbFrg1Lp4AYSOIghFiInxLKArs2LbxTtchpuBBuDJJAEmAZg+
 ENHfKzCkTNYiLnxwxrIsjWLNGRsSkVTmrUr+al/LGGrYkz4Jdqo3WUGVce/vnD3xTAXW6ooFZ
 2t/teEXFN/vVqGWZ7VJoUJZsqCTnpFCDRX/c3fPk6y+okdsRX+x0FkBuMNRDD67ArsY+dmJmi
 iLx9f8j/UyiUuOVAFVGllLe8lGXEMc575m7fFT2p0xPNC/2jut23grsNefUVSZ/vHVZXpO501
 +jrPDh3Faql9xnX8PSD3xyvfzWK6AY5Q2xGtOpZvln/XRTk3HV6IvVZJcp+R8b8rtJs6Pzo2J
 +YWDTYWAQplTlTTapW0s2MZNMLrPqTSbRzYUkcf6DQOccyrrzCSnUmFNuV2fagzIfMCG1TT1H
 CbRXTTAFRaKRiiGO2oLF4UkGT93wuubMlLzEz2TNoZApWmJPwqiHfklIzFZqGVs52Plka3VN5
 qfNXrP7lNseJhGo9AKt52oR+iZFchrsMlvNY4Nno3opZhsSl2kWREhWs0Y/TxUEronSTL+P6Z
 Gy8UA7us3XUfbPMJP/ufz3o0cX80NDahgz+2SznYV8uKU6Y5SBqhqqInOmEahXPafohSIQZdF
 t6+3gkhE42/hW7dejV+zOzldZMS7MfndkvFk/beH9XYSWcE12pHg2HNgmJj40r9UXj8cJEeto
 vfSFlmJplvcUPbL93kvqTL5P0AWjHOL6S4n4yG30ipcB8nbiIn/KQ+EvvsdVVi0kLRuHF9rzo
 Kerv+2sibXZ/fWcA6nPYqGMmPWCRKbVdrNPNr6kV8D3XCsZbvGamfuwnSGGdDAFORIb3QefTj
 AOx0NK++JOicgI/jPVbq4wn/QpSb9CfJFFBGvM7Xc1D08/YPYTwV2hLCuZ7BFm8N/pWcnylMA
 feH5/2Sxpbd7xEyMR6UVOhjOQnn13iD9eYx3QqoblT7eY5rU1sDLnDyq+9AGRqLlMFsIEpmUz
 mmk/mxnr4i8/RwSpJ
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Nick Hudson <nick.hudson@gmx.co.uk>

Define the sdhci pinctrl state as "default" so it gets applied
correctly and to match all other RPis.

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

