From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/7] aspeed: Integrate pinctrl and gpio drivers
Date: Fri, 19 Aug 2016 22:16:58 +0930
Message-ID: <20160819124705.24633-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi all,

This series contains the SoC-related patches of the Aspeed pinctrl and gpio
drivers. The v2 has been split out from the original monolithic series found at:

  https://lkml.org/lkml/2016/7/20/69 

The combined series has been tested with both the AST2400 (g4) and AST2500 (g5)
SoCs on OpenPOWER Palmetto and Aspeed AST2500 EVB machines respectively, and
similarly in QEMU with the palmetto-bmc and ast2500-evb machines[1].

Cheers,

Andrew

Andrew Jeffery (7):
  mach-aspeed: Select pinctrl drivers
  mach-aspeed: Select GPIO driver
  aspeed-g4: Add syscon and pin controller nodes
  palmetto: Request relevant mux functions in devicetree
  aspeed-g4: Add gpio controller to devicetree
  aspeed-g5: Add syscon and pin controller nodes
  aspeed-g5: Add gpio controller to devicetree

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  14 +
 arch/arm/boot/dts/aspeed-g4.dtsi              | 429 ++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi              | 213 +++++++++++++
 arch/arm/mach-aspeed/Kconfig                  |   5 +
 4 files changed, 661 insertions(+)

-- 
2.9.3
