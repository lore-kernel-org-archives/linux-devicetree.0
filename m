Return-Path: <SRS0=Pf9O=KL=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/2] ARM: shmobile: Add support for RZ/A2
Date: Fri, 27 Jul 2018 11:53:31 -0500
Message-Id: <20180727165333.60598-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Introduce RZ/A2 (R7S9210) as an SoC that can be selected.

There is no DT mainlined yet, so this is what the entry would look
like for the BSID register:

	bsid: chipid@fcfe8004 {
		compatible = "renesas,bsid";
		reg = <0xfcfe8004 4>;
	};


Chris Brandt (2):
  soc: renesas: identify RZ/A2
  dt-bindings: arm: Document RZ/A2 SoC DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt | 10 ++--
 drivers/soc/renesas/renesas-soc.c                  | 55 ++++++++++++++++++----
 2 files changed, 53 insertions(+), 12 deletions(-)

-- 
2.16.1
