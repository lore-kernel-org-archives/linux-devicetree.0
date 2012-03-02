From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 0/6] AT91 more DT bindings
Date: Fri, 2 Mar 2012 20:28:44 +0100
Message-ID: <20120302192844.GB21255@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

HI,

	The following patch series add the bindings for:
	 - PMC
	 - SDRAM/DDR Controller
	 - Reset Controller
	 - Shutdown Controller

The following changes since commit c5ec01650adb1976f928177cd7e71afcb82026c5:

  ARM: at91: dt: enable usb ehci for sam9g45 and sam9x5 (2012-03-02 00:46:37 +0800)

are available in the git repository at:
  git://github.com/at91linux/linux-at91.git ..BRANCH.NOT.VERIFIED..

Jean-Christophe PLAGNIOL-VILLARD (6):
      ARM: at91/dt: add specific DT soc init
      ARM: at91: add pmc DT support
      ARM: at91: always enable sam9 restart
      ARM: at91: add RSTC (Reset Controller) dt support
      ARM: at91: add ram controller DT support
      ARM: at91: add Shutdown Controller (SHDWC) DT support

 .../devicetree/bindings/arm/atmel-at91.txt         |   60 ++++++++
 .../devicetree/bindings/arm/atmel-pmc.txt          |   11 ++
 arch/arm/boot/dts/at91sam9g20.dtsi                 |   20 +++
 arch/arm/boot/dts/at91sam9g45.dtsi                 |   21 +++
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |   11 ++
 arch/arm/boot/dts/at91sam9x5.dtsi                  |   20 +++
 arch/arm/boot/dts/at91sam9x5cm.dtsi                |   11 ++
 arch/arm/boot/dts/usb_a9g20.dts                    |   11 ++
 arch/arm/mach-at91/Kconfig                         |   10 +-
 arch/arm/mach-at91/at91sam9x5.c                    |    7 -
 arch/arm/mach-at91/board-dt.c                      |    8 +-
 arch/arm/mach-at91/clock.c                         |   54 ++++++-
 arch/arm/mach-at91/generic.h                       |    2 +
 arch/arm/mach-at91/include/mach/at91_shdwc.h       |    4 +-
 arch/arm/mach-at91/include/mach/at91sam9x5.h       |    5 -
 arch/arm/mach-at91/setup.c                         |  158 ++++++++++++++++++++
 16 files changed, 380 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel-pmc.txt

Best Regards,
J.
