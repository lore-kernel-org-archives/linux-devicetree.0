Return-Path: <soeren.brinkmann@gmail.com>
Sender: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soeren.brinkmann@gmail.com>
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 0/7] tty: xuartps: Rebranding + DT documentation
Date: Mon, 10 Mar 2014 14:21:11 -0700
Message-Id: <1394486478-31037-1-git-send-email-soren.brinkmann@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

this series rebrands the Xilinx PS UART driver as Cadence UART and
documents its DT bindings (+ some clean up along the way).

The rebranding goes as far as reasonable. Things like file name, kconfig
symbols and other things with user space impact are left as is. Please
refer to the discussion in the RFC threads[1-2] for more details.

Similar the DT binding has been extended. In addition to the new and
preferred Cadence binding, the current xuartps binding is maintained.
Though, only the Cadence names for clock-names are documented.

References:
 [1]  https://lkml.org/lkml/2014/3/4/405
 [2]  https://lkml.org/lkml/2014/3/7/450

Changes from the latest RFC:
 - squashed function/symbol renaming into 'tty: xuartps: Rebrand driver
   as Cadence UART'
 - Revised the commit message of 'tty: xuartps: Don't write IRQ disable
   register to enable interrupts' (was 'tty: xuartps: Remove bogus
   comment and register write'

   	Thanks,
	Sören

Soren Brinkmann (7):
  tty: xuartps: Clean up
  tty: xuartps: Print warning in clock notifier
  tty: xuartps: Refactor read-modify-writes
  tty: xuartps: Don't write IRQ disable register to enable interrupts
  tty: xuartps: Rebrand driver as Cadence UART
  tty: cadence: Document DT binding
  ARM: zynq: DT: Migrate UART to Cadence binding

 .../devicetree/bindings/serial/cdns,uart.txt       |   20 +
 arch/arm/boot/dts/zynq-7000.dtsi                   |    8 +-
 drivers/tty/serial/Kconfig                         |    9 +-
 drivers/tty/serial/xilinx_uartps.c                 | 1116 ++++++++++----------
 include/uapi/linux/serial_core.h                   |    2 +-
 5 files changed, 560 insertions(+), 595 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/cdns,uart.txt

-- 
1.9.0.1.g4196000
