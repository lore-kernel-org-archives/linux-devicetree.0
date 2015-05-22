From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH v4 0/2] socfpga: support suspend to ram
Date: Fri, 22 May 2015 13:02:13 -0500
Message-ID: <1432317735-29413-1-git-send-email-atull@opensource.altera.com>
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
To: Dinh Nguyen <dinguyen@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alan Tull <atull@opensource.altera.com>, Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Delicious Quinoq <delicious.quinoa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Support suspend to ram on socfpga.
  * allocate space in ocram using sram driver.
  * Add a function in ocram to place DDR in self-refresh
    and suspend.
  * SDRAM ECC is mutually exclusive with using ocram for
    suspend, so disable SDRAM ECC if socfpga suspend is
    enabled.
  * Add a device tree binding document for the Altera
    SOCFPGA SDRAM controller that is used to put DDR in
    self-refresh mode.

Alan Tull (2):
  ARM: socfpga: support suspend to ram
  ARM: socfpga: dts: add sdram controller dt binding doc

 .../arm/altera/socfpga-sdram-controller.txt        |   12 ++
 arch/arm/mach-socfpga/Kconfig                      |   10 +-
 arch/arm/mach-socfpga/Makefile                     |    1 +
 arch/arm/mach-socfpga/core.h                       |    6 +-
 arch/arm/mach-socfpga/pm.c                         |  150 +++++++++++++++++++
 arch/arm/mach-socfpga/self-refresh.S               |  157 ++++++++++++++++++++
 arch/arm/mach-socfpga/socfpga.c                    |    6 +-
 drivers/edac/Kconfig                               |    2 +-
 8 files changed, 340 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
 create mode 100644 arch/arm/mach-socfpga/pm.c
 create mode 100644 arch/arm/mach-socfpga/self-refresh.S

-- 
1.7.9.5
