Return-Path: <SRS0=MvHc=SL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:29706 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfDIIwQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Apr 2019 04:52:16 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH 00/11] Add more support to the RZ/G1C (r8a77470) SoC
Date: Tue,  9 Apr 2019 17:51:41 +0900
Message-Id: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-DMAC,Ether,VSP,FDP1,LVDS support 
for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04-02-v5.1-rc3 tag 
of renesas-drivers tree.

Cao Van Dong (11):
  ARM: dts: r8a77470: Add HSCIF support
  ARM: dts: r8a77470: Add MSIOF support
  ARM: dts: r8a77470: Add PWM support
  ARM: dts: r8a77470: Add CAN support
  ARM: dts: r8a77470: Add VIN support
  ARM: dts: r8a77470: Add Audio support
  ARM: dts: r8a77470: Add Audio-DMAC support
  ARM: dts: r8a77470: Add Ether support
  ARM: dts: r8a77470: Add VSP support
  ARM: dts: r8a77470: Add FDP1 support
  ARM: dts: r8a77470: Add LVDS support

 arch/arm/boot/dts/r8a77470.dtsi | 493 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 493 insertions(+)

-- 
2.7.4
