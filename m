From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Subject: [RFC 0/4] Add Z clock support
Date: Tue, 10 May 2016 11:40:45 +0700
Message-ID: <5731664D.1030909@rvc.renesas.com>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>, "Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

This series adds Z clock support for R-Car Gen3.
It was written on top of "[PATCH 0/4] clk: renesas: cpg-mssr: Add 
support for R-Car M3-W" series.

Dien Pham (1):
   arm64: dts: r8a7795: Add Z clock scaling support

Khiem Nguyen (3):
   clk: renesas: rcar-gen3-cpg: Add Z clock
   clk: renesas: r8a7795: Add Z clock
   clk: renesas: r8a7796: Add Z clock

  arch/arm64/boot/dts/renesas/r8a7795.dtsi |  26 ++++++
  drivers/clk/renesas/r8a7795-cpg-mssr.c   |   1 +
  drivers/clk/renesas/r8a7796-cpg-mssr.c   |   2 +
  drivers/clk/renesas/rcar-gen3-cpg.c      | 143 
+++++++++++++++++++++++++++++++
  drivers/clk/renesas/rcar-gen3-cpg.h      |   1 +
  5 files changed, 173 insertions(+)

-- 
1.9.1
