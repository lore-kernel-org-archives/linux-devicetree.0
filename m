From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4 v1] Mezzanine Low Speed connector bus
Date: Thu, 23 Aug 2018 12:33:28 +0200
Message-ID: <20180823103332.32047-1-linus.walleij@linaro.org>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dev@lists.96boards.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Andy Shevchenko <andy@infradead.org>
List-Id: devicetree@vger.kernel.org

I have been a bit hesitant to reiterate the series, but this is
anyways a v1 of the 96Boards Mezzanine Low Speed connector
driver framework.

I know the boards have a high speed connector as well, just
trying to work stepwise and do the simple things first.

What convinced me to continue was very real usecases that exist
today, as this makes the secure96 Mezzanine work:

- Get something upstream that makes it possible to without
  any trouble or extensive ugly hacking probe and use the
  secure96 mezzanine. This is motivated by the IoT design
  space which needs a way to plug in proper security and the
  secure96 offers a TPM chip for root of trust and key
  handling.

- A clear indication that the same approach will work just
  as fine with ACPI without reinventing the universe. I do
  not have a definitive proof of this, but it is more
  plausible that this will be reusable for ACPI than any of
  the DT-centric ideas I've seen for populating
  daughterboards. There are 96boards using ACPI today.
  A secure96 TPM is desireable for things like the ARM
  developer box which has this LS connector:
  https://www.96boards.org/product/developerbox/

- Some indication that binding the connector like this will
  not implicate or screw things up for the DT-overlays
  idea, i.e. a both/and and not either/or approach.

The idea is for this to go upstream through ARM SoC the day
noone actively NACK it and someone actively ACK it. Expect
some more iterations.

Linus Walleij (4):
  eeprom: at24: Allow passing gpiodesc from pdata
  spi: Make of_find_spi_device_by_node() available
  bus: Add DT bindings for 96Boards low speed connector
  bus: 96boards Low-Speed Connector

 .../bus/96boards,low-speed-connector.txt      |  50 +++
 drivers/bus/Kconfig                           |   2 +
 drivers/bus/Makefile                          |   4 +-
 drivers/bus/daughterboards/96boards-ls-bus.c  |  39 ++
 .../daughterboards/96boards-ls-connector.c    | 367 ++++++++++++++++++
 .../bus/daughterboards/96boards-mezzanines.h  |  77 ++++
 .../bus/daughterboards/96boards-secure96.c    | 265 +++++++++++++
 drivers/bus/daughterboards/Kconfig            |  50 +++
 drivers/bus/daughterboards/Makefile           |   6 +
 drivers/misc/eeprom/at24.c                    |   6 +-
 drivers/spi/spi.c                             |  33 +-
 include/linux/platform_data/at24.h            |   2 +
 include/linux/spi/spi.h                       |   4 +
 13 files changed, 888 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/96boards,low-speed-connector.txt
 create mode 100644 drivers/bus/daughterboards/96boards-ls-bus.c
 create mode 100644 drivers/bus/daughterboards/96boards-ls-connector.c
 create mode 100644 drivers/bus/daughterboards/96boards-mezzanines.h
 create mode 100644 drivers/bus/daughterboards/96boards-secure96.c
 create mode 100644 drivers/bus/daughterboards/Kconfig
 create mode 100644 drivers/bus/daughterboards/Makefile

-- 
2.17.0
