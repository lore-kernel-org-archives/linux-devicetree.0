Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EC0C4BA24
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 23:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3A7C20658
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 23:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="cOMnDUAR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgBZXdp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 18:33:45 -0500
Received: from mout.gmx.net ([212.227.15.19]:34253 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbgBZXdp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Feb 2020 18:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582760014;
        bh=PEBp0ArLq+2LbrCAGyFPB5vynzZQUrubxtUU1vOoQRc=;
        h=X-UI-Sender-Class:From:Subject:To:Date;
        b=cOMnDUARRfkzmSvPh3Atgby9BC0uO+ads8UohmMAWnFZ1Ak1Y3Wf7ubs0g5zo4WU9
         fnJbKqqNweTaMNI5PgHu5BCnZZcxVt2K3BisiJnKXXCpWCQBmhgOCNzEYJ0r1AYbE0
         DUXG6KhZlk+bXtEji6IAR7NY0vNB1+47gtMtvsHo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.43] ([188.223.33.120]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mjj8D-1jqeg92mrb-00lH1t; Thu, 27
 Feb 2020 00:33:34 +0100
From:   Nick Hudson <nick.hudson@gmx.co.uk>
Subject: [PATCH] define rpi0w sdhci pinctrl state
To:     linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Message-ID: <c34db439-3539-88c0-99f1-308d75afd1aa@gmx.co.uk>
Date:   Wed, 26 Feb 2020 23:33:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8vEkXAA8iBdb/YZBvbTOrrQtrx04cwkf9+zgIS+GCYzE3az2YML
 ZzFMLqCtqBAwezvIzN5qmtfq64dXeDPR8RHyK1LPul3hP/Udshntjz3xu/Q1FYJMc0WAnK8
 NS46tHtVGebRynPsr2ghryD52NkjGUsNd06c9GunmW2LaDvdyr06X1061ZpyuwmBETMZglq
 ctN4R/BlYUMdX3F+4ynXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7fQj1P162/Y=:wW2L/1sspxwAb3LOjSGssR
 oydQkiEpc538gML4IgK/sK8gTewvbxg5DWzYC3fveuIbED1767MudYFaRwR+6mWxKSmyDqaMs
 tjm7kKN7mm05yQBUe3e4kujwiDH1rEDHNR/wluHocFRhbmumHLMOMAaifjtCBMChLOWAHXrXk
 OV7s2ijf+ygyc6ctOTSCO3Ff3AsTcEmwxuj1q7gYMPbEi/bDwBLnZ7H3MFpPNLtb11UFuqdv8
 YgBdD9ROgw1FI9fpPsVjIyYK2+eWah6w5sfqybPyeeNqBLEikyj11gY9XeradH0UR6WGgWoAb
 CkDk6FccAe1osW/KwesKH1yxJ41lMVBwmSzBGwtZSKlaYm9GH762cDuImAjcCrHRRT+hvos1D
 04I8Hv1sNkI9967H8NgTzmwrAvxrFOTkF+LQa9ZJYExeJ5N/1k1MhDFdYqf39pEDuWmN9L1Wc
 ppOkJ0hv+/61aq6nB7EXmM2yjPDNuExAhESPMMZzw1mv9KCedmAEtzDuwYEix9TknmtMA5XB0
 Fq35BlyY0yYGqiFP2Cn2SnDfVMDDrAYb+47xvwi+0gSFlKzQnBSiTGLEDQJ0Fi/nSYOsxAcik
 UZHGwivrzocO0jIs8FzdhOL+5QWVw79M/OJeyVeUUG7m3Ob4lZzUSDtiIAuirPtyt1N4tSKfs
 f3J5GAXW5brRgmFxQ8gSboy/VZBTJLX0968QRqA+CGp/XBSYcOXePitALgAB1B1hmd0NeCR2f
 pd8JptMgTABJrDIH9Prf6++wOKRDVVZhINyp3fNrrM1rrys3QyZgg/25M2snBpyffuooteM3Q
 6fFJXVPhUO4SqEFfBTwgXlFfkrbfgzaG428IB8qNHnKHBbYZFF2A9sL4Z9zYqPqIcs+oxJDxh
 D7O8UZPUaKBcXJkhGqs9oye8p5BmyxCOtpYrXybn10QjZe+YvxVHIQIl/jBCtYLqKfPw8ydlH
 sFTps54CnACvVwLlrPTV8t0NVIJ3/aXfCb0E/EGvKYTXzoj5EC5g9nXKEhcAunHF/BikOEMz2
 gesXW38W1urp4/vS8ReVhSkrQjXsHy5HkPbcLDUj17q96bynucGTncjGNoEiNI+GcO6WVqsiQ
 jU47InDygh8Cnktu6rlzRdngBRGPRH0NxUiK8uVfQvjPEhM/ARAZnwEDXaZoYe2Hz4llyyXqN
 qqBJI7b10j1+lEYu1ZJdv2stmhJNmNSxCQsis/OCWOkg34vGeNVaaRVdtnCeuy3LBvbhx2Xx6
 us1gRAu1zJFxb70yQ
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

I'm still not sure where I should be sending this, but here goes.

Define thesdhci pinctrl state as "default" so it gets applied correctly
and to match all other RPis

Signed-off-by: Nick Hudson <skrll@netbsd.org>
=2D--
Index: bcm2835-rpi-zero-w.dts
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file:
/cvsroot/src/sys/external/gpl2/dts/dist/arch/arm/boot/dts/bcm2835-rpi-zero=
-w.dts,v
retrieving revision 1.1.1.4
diff -u -p -r1.1.1.4 bcm2835-rpi-zero-w.dts
=2D-- bcm2835-rpi-zero-w.dts	3 Jan 2020 14:33:09 -0000	1.1.1.4
+++ bcm2835-rpi-zero-w.dts	19 Feb 2020 07:53:54 -0000
@@ -112,6 +112,7 @@
  &sdhci {
  	#address-cells =3D <1>;
  	#size-cells =3D <0>;
+	pinctrl-names =3D "default";
  	pinctrl-0 =3D <&emmc_gpio34 &gpclk2_gpio43>;
  	bus-width =3D <4>;
  	mmc-pwrseq =3D <&wifi_pwrseq>;
