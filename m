From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 0/3] reset: Add a driver for the reset controller on the AR71XX/AR9XXX
Date: Mon,  3 Aug 2015 19:23:50 +0200
Message-ID: <1438622633-9407-1-git-send-email-albeu@free.fr>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Hi all,

this small serie add a trivial driver for the reset controller found
on the AR71XX/AR9XXX SoC. Of note is only the fact that the ATH79 board
support code use a custom API for this and ioremap the same memory area.
However this custom API is only used by board not supporting OF, so it
won't come into play for boards using OF. As such it should still be safe,
even if the double ioremap is a bit ugly.

Alban

Alban Bedel (3):
  devicetree: Add bindings for the ATH79 reset controller
  reset: Add a driver for the reset controller on the AR71XX/AR9XXX
  MIPS: ath79: Add the reset controller to the AR9132 dtsi

 .../devicetree/bindings/reset/ath79-reset.txt      |  20 ++++
 arch/mips/Kconfig                                  |   1 +
 arch/mips/boot/dts/qca/ar9132.dtsi                 |   8 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-ath79.c                        | 128 +++++++++++++++++++++
 5 files changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ath79-reset.txt
 create mode 100644 drivers/reset/reset-ath79.c

-- 
2.0.0
