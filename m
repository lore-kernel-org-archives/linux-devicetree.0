From: Priit Laes <plaes@plaes.org>
Subject: [PATCH 0/2] ARM: dts: sunxi: Add display clocks to sun[47]i.dtsi
Date: Tue, 10 May 2016 22:24:05 +0300
Message-ID: <1462908247-10474-1-git-send-email-plaes@plaes.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Priit Laes <plaes@plaes.org>
List-Id: devicetree@vger.kernel.org

Enable the display and TCON clocks that are needed to drive the display
engine, tcon and TV encoders.

Please note that currently the parent handling for clocks using 
'allwinner,sun4i-a10-display-clk' compatible with number of parents !=4
is broken (like de_[bf]e[01]_clk clocks present in patches).

Priit Laes (2):
  ARM: sun4i: A10: Add display and TCON clocks
  ARM: sun7i: A20: Add display and TCON clocks

 arch/arm/boot/dts/sun4i-a10.dtsi | 91 ++++++++++++++++++++++++++++++++++++----
 arch/arm/boot/dts/sun7i-a20.dtsi | 85 ++++++++++++++++++++++++++++++++++---
 2 files changed, 164 insertions(+), 12 deletions(-)

-- 
2.8.2
