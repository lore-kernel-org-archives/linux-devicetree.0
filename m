Return-Path: <SRS0=QVA0=AO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F87EC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 05:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D17920772
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 05:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="IvOC+2fE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgGCFi0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jul 2020 01:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCFiZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jul 2020 01:38:25 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72BC08C5C1
        for <devicetree@vger.kernel.org>; Thu,  2 Jul 2020 22:38:25 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g67so13692487pgc.8
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2020 22:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from:cc;
        bh=3W1Ir0ATg2X5Cof7ujTvIDyePzAAh0cylDgcNkiamw8=;
        b=IvOC+2fEs2DVgSEhTqmegCunBeGpCQYNq+fA7rcFPFjlBXZrLlBcehGsQylUfz9a4H
         kdCjk9xfn5GvGxUYNDU28GbqS09eH4+dGhsOUtQsuiOLjw8NFCcZs6BWLnBKknLvR6Sj
         xqysi0lg6dPl7PssJpbfMFFjIbluBdPz5YCUNyNKq8fccYpQFzScZOcttR87vx40175B
         wnsOrzrDN34SdfB4PtIfl0lk5zvo30rJvbpSEP5l2fvMR3NkCkkTT/vO8oT+e/uHZw90
         IavnZDUUAeMYfdVPmSPlH9ChnJO60jwMiyANy+XUZJd5h45NMRh5Hpus2MlwsrPJGSD/
         xQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from:cc;
        bh=3W1Ir0ATg2X5Cof7ujTvIDyePzAAh0cylDgcNkiamw8=;
        b=msf7aLE8qizVM9mY80XPvJ75IWPHAHdkSeFCVER4PNwoabPNUytJMVOlEcwSPvwOjg
         mLJxJkJTwc1PeXjJILCgJEIpXMzl2zFuyxr+d/PjNFiUsVeArfk74Ic4rPIUgf5EoJ7M
         kDLBpmxiZ7xCsfT2RRiCYrQSI9Yao0QjATgsmLW/V3DIW3UUNEIRzi7eU6nLoYNy2F4U
         lR/bQJPNAZUBERyWZxTE673DPyVfbFtxDCvu2Ypt2RLJQYZFK2rbQ/XG18Az45+/UDr+
         AknCquZ2KqfDsnXZfIHtrywVNzkXW7GGlaBNsKHDNRk/5mAEgfw2JLM7mu2qGfntJuVq
         +j4w==
X-Gm-Message-State: AOAM531cRHA5CvvXoK5r/gM5mTeHgjycFhsnmMp+ZKjYvx4oHc1FZPDj
        6J0LCkgVXw1JViCz7JO0KLgp2g==
X-Google-Smtp-Source: ABdhPJze9yuWsziRu1telzYE6WdG6IRcMBB8abdfExliL+03/ONcpaftw3akPnlBEs+xZ3lxU+0PIw==
X-Received: by 2002:a62:55c3:: with SMTP id j186mr31605619pfb.237.1593754705089;
        Thu, 02 Jul 2020 22:38:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o8sm9809361pgb.23.2020.07.02.22.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 22:38:24 -0700 (PDT)
Message-ID: <5efec450.1c69fb81.7626b.b08a@mx.google.com>
Date:   Thu, 02 Jul 2020 22:38:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-37-g7cc2a8ea1048
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: mainline
X-Kernelci-Branch: master
X-Kernelci-Lab-Name: lab-cip
Subject: mainline/master bisection: baseline.dmesg.crit on
 qemu_arm-vexpress-a15
To:     Andre Przywara <andre.przywara@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        kernelci-results@groups.io, gtucker@collabora.com
From:   "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
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
  Start:      7cc2a8ea1048 Merge tag 'block-5.8-2020-07-01' of git://git.ke=
rnel.dk/linux-block
  Plain log:  https://storage.kernelci.org/mainline/master/v5.8-rc3-37-g7cc=
2a8ea1048/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-t=
c1.txt
  HTML log:   https://storage.kernelci.org/mainline/master/v5.8-rc3-37-g7cc=
2a8ea1048/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-t=
c1.html
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
# bad: [7cc2a8ea104820dd9e702202621e8fd4d9f6c8cf] Merge tag 'block-5.8-2020=
-07-01' of git://git.kernel.dk/linux-block
git bisect bad 7cc2a8ea104820dd9e702202621e8fd4d9f6c8cf
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
