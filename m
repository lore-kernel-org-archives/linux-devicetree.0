Return-Path: <SRS0=70sl=NS=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Replace magic numbers in RZ/G2M dtsi
Date: Wed,  7 Nov 2018 15:24:25 +0000
Message-Id: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

We were waiting for v4.20 RC1 to be out for replacing clock and
power magic numbers within r8a774a1.dtsi as there was a dependency
with the corresponding bindings.
This series takes care of the magic numbers now that the bindings
are available by replacing them with the corresponding macros.

Thanks,
Fab

Fabrizio Castro (2):
  arm64: dts: renesas: r8a774a1: Replace power magic numbers
  arm64: dts: renesas: r8a774a1: Replace clock magic numbers

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 239 +++++++++++++++---------------
 1 file changed, 120 insertions(+), 119 deletions(-)

-- 
2.7.4
