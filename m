Return-Path: <SRS0=Amyu=WR=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] dt-bindings: clk: emev2: Rename bindings documentation file
Date: Wed, 21 Aug 2019 11:15:16 +0200
Message-Id: <20190821091516.16372-1-horms+renesas@verge.net.au>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the device tree clock bindings for Renesas EMMA Mobile EV2
from emev2-clock.txt to renesas,emev2-smu.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1

v2
* Drop emev2 prefix from new filename, it was unintentional
  and does not match the proposed naming scheme
---
 .../devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt} (100%)

diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/clock/emev2-clock.txt
rename to Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
-- 
2.11.0
