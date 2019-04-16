Return-Path: <SRS0=vr9i=SS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:13229 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbfDPB4D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Apr 2019 21:56:03 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH 0/4] Add TPU support for R-Car H3/M3-W/M3-N
Date: Tue, 16 Apr 2019 10:55:48 +0900
Message-Id: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.

For test: After booting, I found the device was registered in the boot log.

Cao Van Dong (4):
  arm64: dts: renesas: r8a7795: Add TPU support
  arm64: dts: renesas: r8a7796: Add TPU support
  arm64: dts: renesas: r8a77965: Add TPU support
  dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings

 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
 7 files changed, 39 insertions(+)

-- 
2.7.4
