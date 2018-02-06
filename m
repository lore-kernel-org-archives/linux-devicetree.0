From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a77970/r8a77995: Remove non-existing STBE region
Date: Tue,  6 Feb 2018 14:05:51 +0100
Message-ID: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "David S . Miller" <davem@davemloft.net>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi all,

The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
is not present on all R-Car Gen3 SoCs.

This patches series documents this in the DT bindings, and removes the
non-existing regions from the affected DTS files.  Note that this region
is apparently not used by the RAVB driver.

The first patch is intended for either the net or DT tree.
The last two patches are intended for the renesas tree.

Compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (3):
  dt-bindings: net: renesas-ravb: Make stream buffer optional
  arm64: dts: renesas: r8a77970: Remove non-existing STBE region
  arm64: dts: renesas: r8a77995: Remove non-existing STBE region

 Documentation/devicetree/bindings/net/renesas,ravb.txt | 5 ++++-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi              | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi              | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert
