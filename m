From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/7] aspeed: Integrate pinctrl and gpio drivers
Date: Tue, 30 Aug 2016 17:25:53 +0930
Message-ID: <20160830075600.11559-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

Hi all,

Here's v3 of the Aspeed pinctrl and gpio driver integration patches. v2 of the
integration series can be found at:

  https://lkml.org/lkml/2016/8/19/403

v3 captures changes required to address review comments from v2 of the driver
series:

  https://lkml.org/lkml/2016/8/22/343

Since v2:

* Add interrupt-controller property to gpio devicetree nodes
* Drop unit address from pinctrl devicetree nodes
* ARCH_ASPEED selects MFD_SYSCON

Cheers,

Andrew

---

Andrew Jeffery (7):
  mach-aspeed: Select pinctrl drivers
  mach-aspeed: Select GPIO driver
  aspeed-g4: Add syscon and pin controller nodes
  palmetto: Request relevant mux functions in devicetree
  aspeed-g4: Add gpio controller to devicetree
  aspeed-g5: Add syscon and pin controller nodes
  aspeed-g5: Add gpio controller to devicetree

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  14 +
 arch/arm/boot/dts/aspeed-g4.dtsi              | 430 ++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi              | 214 +++++++++++++
 arch/arm/mach-aspeed/Kconfig                  |   6 +
 4 files changed, 664 insertions(+)

-- 
2.9.3.1.g0db844e
