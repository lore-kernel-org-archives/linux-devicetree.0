Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49449 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfDKHya (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:54:30 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Date: Thu, 11 Apr 2019 16:54:02 +0900
Message-Id: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Dear everyone,

This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-DMAC,Ether,VSP,FDP1,LVDS support 
for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04-02-v5.1-rc3 tag 
of renesas-drivers tree. Currently, I only add patches to the tree and compiled. 
Unfortunately, RZ/G1C board is not available, so I have not tested these patches on this board yet.

cc Biju,
I know it is very difficult. however I still want to ask if you can help me test them?
If possible, I will send the .dts file separately to you.
Because I am known you can be available this board. Thanks!

Cao Van Dong (20):
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
  ARM: dts: r8a77470: Add audio clocks
  ARM: dts: r8a77470: Add can clocks
  dt-bindings: display: renesas: lvds: Add r8a77470 support
  media: dt-bindings: media: rcar_vin: Document r8a77470 bindings
  ASoC: rsnd: Document r8a77470 bindings
  dt-bindings: pwm: Document r8a77470 bindings
  sh_eth: Document r8a77470 bindings
  spi: sh-msiof: Document r8a77470 bindings
  dt-bindings: can: rcar_can: Document r8a77470 bindings

 .../bindings/display/bridge/renesas,lvds.txt       |   1 +
 .../devicetree/bindings/media/rcar_vin.txt         |   1 +
 .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
 Documentation/devicetree/bindings/net/sh_eth.txt   |   1 +
 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   1 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
 Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
 arch/arm/boot/dts/r8a77470.dtsi                    | 608 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
 9 files changed, 616 insertions(+)

-- 
2.7.4
