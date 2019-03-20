Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46724 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfCTToQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Mar 2019 15:44:16 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Date: Wed, 20 Mar 2019 20:44:08 +0100
Message-Id: <20190320194410.14870-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Simon, Magnus, Chris,

This patch series adds support for devices on the I2C bus on the RSKRZA1
board, including the GPIO expander that drives 3 LEDs.

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: rskrza1: Add I2C support
  ARM: dts: rskrza1: Add remaining LEDs

 arch/arm/boot/dts/r7s72100-rskrza1.dts | 46 +++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
