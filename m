Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3723EC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 02:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03D0F20737
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 02:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="D37rkd4v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgGFCNA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jul 2020 22:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbgGFCM7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Jul 2020 22:12:59 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD555C061794
        for <devicetree@vger.kernel.org>; Sun,  5 Jul 2020 19:12:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t15so1924220pjq.5
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2020 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from:cc;
        bh=veY7e8MhQbVJmGp0VryBoJeWwwVHOxjlznZ7MrAlILU=;
        b=D37rkd4vyTnAIChk4j8HUOxzfWgQ6LYHM8+cC0bNEDKAAmKVCMYQvouGUWhT0N7d4D
         RxL+aWDLprLyFw7xb/XhcVROWRBk9CmR862DedUXHmhzcBBOe/yXx7GJ4Tv1BLfNECbd
         3dE9CkedoAx2ob7UYc0dwjoIxMh+bcd3yq+nMRG8eot6fOGGFW6nfPYOnkHtkq/Cbwvm
         vOx7SUwUTqnqHgkDwwTuHM/yb2H/t8a3hh/Ws6HEh+6VB4ewR18EaoYUXGC+GjspRccI
         Af6ARjcYCSSlDVfgysbiZ3f4hDF0IRF7LeHDrvGu+JbH3E6CWUe7o3AEOLc4Xm8CXk9j
         ay6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from:cc;
        bh=veY7e8MhQbVJmGp0VryBoJeWwwVHOxjlznZ7MrAlILU=;
        b=BxcdD7hYYHVWM8YLFARA9EecB6HeIrEFcDOGhRgOJ6VzcQvSSvJEU/iwTdt5P+mjtb
         NhtbXqX2ifp12IWyAEoq2PvIKscZJgDhPy5prLV4hrzvuFbgtWOCI5T6zHzvqH81Rj7E
         c85+9KQt5HfOK3Rh5BPXK7PYYaLBubJosiD8enluEz31a0JakoML/i+fE/rXAr6Ol0Es
         8SvsrOezISlPvdY6ZRHpE6JjDkMAzZMpEjP+9+RN0sEquuOY/PUTm/BY8eqK02Xwmqb0
         hJ30gQ5sPhlVWsoMkp2InXj76N/58uRhUBax5gNuhq8HaD9DmhbiJkDpAfISSFpMPyjL
         Fu1w==
X-Gm-Message-State: AOAM531ZlFLsJ+9j2rfu7Rrk12w9fyASbkjH610FGhWmtNPeN2snji36
        SWjvaYOCN3ULjxfM4zLipraIdw==
X-Google-Smtp-Source: ABdhPJy/IdLJjynfkZnC7wj8/PbTGJljVqSj6Q2ack+0VIM4iwONGOONjeXkccXqH27dxG/ivd7F0g==
X-Received: by 2002:a17:90a:930b:: with SMTP id p11mr49239264pjo.230.1594001579254;
        Sun, 05 Jul 2020 19:12:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l191sm18103068pfd.149.2020.07.05.19.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 19:12:58 -0700 (PDT)
Message-ID: <5f0288aa.1c69fb81.b1c2a.eea4@mx.google.com>
Date:   Sun, 05 Jul 2020 19:12:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-225-gbb5a93aaf252
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: mainline
X-Kernelci-Branch: master
X-Kernelci-Lab-Name: lab-cip
Subject: mainline/master bisection: baseline.dmesg.crit on
 qemu_arm-vexpress-a15
To:     gtucker@collabora.com, Sudeep Holla <sudeep.holla@arm.com>,
        kernelci-results@groups.io, Andre Przywara <andre.przywara@arm.com>
From:   "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        linux-kernel@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

mainline/master bisection: baseline.dmesg.crit on qemu_arm-vexpress-a15

Summary:
  Start:      bb5a93aaf252 x86/ldt: use "pr_info_once()" instead of open-co=
ding it badly
  Plain log:  https://storage.kernelci.org/mainline/master/v5.8-rc3-225-gbb=
5a93aaf252/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-=
tc1.txt
  HTML log:   https://storage.kernelci.org/mainline/master/v5.8-rc3-225-gbb=
5a93aaf252/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-=
tc1.html
  Result:     38ac46002d1d arm: dts: vexpress: Move mcc node back into moth=
erboard node

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       mainline
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
  Branch:     master
  Target:     qemu_arm-vexpress-a15
  CPU arch:   arm
  Lab:        lab-cip
  Compiler:   gcc-8
  Config:     vexpress_defconfig
  Test case:  baseline.dmesg.crit

Breaking commit found:

---------------------------------------------------------------------------=
----
commit 38ac46002d1df5707566a73486452851341028d2
Author: Andre Przywara <andre.przywara@arm.com>
Date:   Wed Jun 3 17:22:37 2020 +0100

    arm: dts: vexpress: Move mcc node back into motherboard node
    =

    Commit d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices
    out of bus node") moved the "mcc" DT node into the root node, because
    it does not have any children using "reg" properties, so does violate
    some dtc checks about "simple-bus" nodes.
    =

    However this broke the vexpress config-bus code, which walks up the
    device tree to find the first node with an "arm,vexpress,site" property.
    This gave the wrong result (matching the root node instead of the
    motherboard node), so broke the clocks and some other devices for
    VExpress boards.
    =

    Move the whole node back into its original position. This re-introduces
    the dtc warning, but is conceptually the right thing to do. The dtc
    warning seems to be overzealous here, there are discussions on fixing or
    relaxing this check instead.
    =

    Link: https://lore.kernel.org/r/20200603162237.16319-1-andre.przywara@a=
rm.com
    Fixes: d9258898ad49 ("arm64: dts: vexpress: Move fixed devices out of b=
us node")
    Reported-and-tested-by: Guenter Roeck <linux@roeck-us.net>
    Signed-off-by: Andre Przywara <andre.przywara@arm.com>
    Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/ve=
xpress-v2m-rs1.dtsi
index e6308fb76183..a88ee5294d35 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -100,79 +100,6 @@
 		};
 	};
 =

-	mcc {
-		compatible =3D "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
-
-		oscclk0 {
-			/* MCC static memory clock */
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 0>;
-			freq-range =3D <25000000 60000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "v2m:oscclk0";
-		};
-
-		v2m_oscclk1: oscclk1 {
-			/* CLCD clock */
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 1>;
-			freq-range =3D <23750000 65000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "v2m:oscclk1";
-		};
-
-		v2m_oscclk2: oscclk2 {
-			/* IO FPGA peripheral clock */
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 2>;
-			freq-range =3D <24000000 24000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "v2m:oscclk2";
-		};
-
-		volt-vio {
-			/* Logic level voltage */
-			compatible =3D "arm,vexpress-volt";
-			arm,vexpress-sysreg,func =3D <2 0>;
-			regulator-name =3D "VIO";
-			regulator-always-on;
-			label =3D "VIO";
-		};
-
-		temp-mcc {
-			/* MCC internal operating temperature */
-			compatible =3D "arm,vexpress-temp";
-			arm,vexpress-sysreg,func =3D <4 0>;
-			label =3D "MCC";
-		};
-
-		reset {
-			compatible =3D "arm,vexpress-reset";
-			arm,vexpress-sysreg,func =3D <5 0>;
-		};
-
-		muxfpga {
-			compatible =3D "arm,vexpress-muxfpga";
-			arm,vexpress-sysreg,func =3D <7 0>;
-		};
-
-		shutdown {
-			compatible =3D "arm,vexpress-shutdown";
-			arm,vexpress-sysreg,func =3D <8 0>;
-		};
-
-		reboot {
-			compatible =3D "arm,vexpress-reboot";
-			arm,vexpress-sysreg,func =3D <9 0>;
-		};
-
-		dvimode {
-			compatible =3D "arm,vexpress-dvimode";
-			arm,vexpress-sysreg,func =3D <11 0>;
-		};
-	};
-
 	bus@8000000 {
 		motherboard-bus {
 			model =3D "V2M-P1";
@@ -435,6 +362,79 @@
 						};
 					};
 				};
+
+				mcc {
+					compatible =3D "arm,vexpress,config-bus";
+					arm,vexpress,config-bridge =3D <&v2m_sysreg>;
+
+					oscclk0 {
+						/* MCC static memory clock */
+						compatible =3D "arm,vexpress-osc";
+						arm,vexpress-sysreg,func =3D <1 0>;
+						freq-range =3D <25000000 60000000>;
+						#clock-cells =3D <0>;
+						clock-output-names =3D "v2m:oscclk0";
+					};
+
+					v2m_oscclk1: oscclk1 {
+						/* CLCD clock */
+						compatible =3D "arm,vexpress-osc";
+						arm,vexpress-sysreg,func =3D <1 1>;
+						freq-range =3D <23750000 65000000>;
+						#clock-cells =3D <0>;
+						clock-output-names =3D "v2m:oscclk1";
+					};
+
+					v2m_oscclk2: oscclk2 {
+						/* IO FPGA peripheral clock */
+						compatible =3D "arm,vexpress-osc";
+						arm,vexpress-sysreg,func =3D <1 2>;
+						freq-range =3D <24000000 24000000>;
+						#clock-cells =3D <0>;
+						clock-output-names =3D "v2m:oscclk2";
+					};
+
+					volt-vio {
+						/* Logic level voltage */
+						compatible =3D "arm,vexpress-volt";
+						arm,vexpress-sysreg,func =3D <2 0>;
+						regulator-name =3D "VIO";
+						regulator-always-on;
+						label =3D "VIO";
+					};
+
+					temp-mcc {
+						/* MCC internal operating temperature */
+						compatible =3D "arm,vexpress-temp";
+						arm,vexpress-sysreg,func =3D <4 0>;
+						label =3D "MCC";
+					};
+
+					reset {
+						compatible =3D "arm,vexpress-reset";
+						arm,vexpress-sysreg,func =3D <5 0>;
+					};
+
+					muxfpga {
+						compatible =3D "arm,vexpress-muxfpga";
+						arm,vexpress-sysreg,func =3D <7 0>;
+					};
+
+					shutdown {
+						compatible =3D "arm,vexpress-shutdown";
+						arm,vexpress-sysreg,func =3D <8 0>;
+					};
+
+					reboot {
+						compatible =3D "arm,vexpress-reboot";
+						arm,vexpress-sysreg,func =3D <9 0>;
+					};
+
+					dvimode {
+						compatible =3D "arm,vexpress-dvimode";
+						arm,vexpress-sysreg,func =3D <11 0>;
+					};
+				};
 			};
 		};
 	};
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [719fdd32921fb7e3208db8832d32ae1c2d68900f] afs: Fix storage of cell=
 names
git bisect good 719fdd32921fb7e3208db8832d32ae1c2d68900f
# bad: [bb5a93aaf25261321db0c499cde7da6ee9d8b164] x86/ldt: use "pr_info_onc=
e()" instead of open-coding it badly
git bisect bad bb5a93aaf25261321db0c499cde7da6ee9d8b164
# bad: [0c7415c31ea9482c4377287af5f459778bf64d2a] Merge tag 'tpmdd-next-v5.=
8-rc4' of git://git.infradead.org/users/jjs/linux-tpmdd
git bisect bad 0c7415c31ea9482c4377287af5f459778bf64d2a
# bad: [e44b59cd758acdd413512d4597a1fabdadfe3abf] Merge tag 'arm-fixes-5.8-=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad e44b59cd758acdd413512d4597a1fabdadfe3abf
# good: [91a9a90d040e8b9ff63d48ea71468e0f4db764ff] Merge tag 'sched_urgent_=
for_5.8_rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 91a9a90d040e8b9ff63d48ea71468e0f4db764ff
# bad: [42d3f7e8da1bc55e3109f612c519c945f6587194] Merge tag 'imx-fixes-5.8'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/f=
ixes
git bisect bad 42d3f7e8da1bc55e3109f612c519c945f6587194
# bad: [6d89c73ca5813768a2cc66f7420ac0cbddf4f37d] Merge tag 'arm-soc/for-5.=
8/soc-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
git bisect bad 6d89c73ca5813768a2cc66f7420ac0cbddf4f37d
# bad: [0f77ce26ebcf6ea384421d2dd47b924b83649692] Revert "ARM: sti: Impleme=
nt dummy L2 cache's write_sec"
git bisect bad 0f77ce26ebcf6ea384421d2dd47b924b83649692
# bad: [d68ec1644dd546851d651787a638aead32a60a6f] Merge tag 'juno-fix-5.8' =
of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into ar=
m/fixes
git bisect bad d68ec1644dd546851d651787a638aead32a60a6f
# bad: [38ac46002d1df5707566a73486452851341028d2] arm: dts: vexpress: Move =
mcc node back into motherboard node
git bisect bad 38ac46002d1df5707566a73486452851341028d2
# first bad commit: [38ac46002d1df5707566a73486452851341028d2] arm: dts: ve=
xpress: Move mcc node back into motherboard node
---------------------------------------------------------------------------=
----
