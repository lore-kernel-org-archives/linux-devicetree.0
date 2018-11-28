Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44066 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbeK1Uza (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 28 Nov 2018 15:55:30 -0500
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 00/12] serial: Add Tegra Combined UART driver
Date: Wed, 28 Nov 2018 10:54:09 +0100
Message-Id: <20181128095421.20573-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Pekka Pessi <ppessi@nvidia.com>, Mika Liljeberg <mliljeberg@nvidia.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Hi everyone,

this is a reworked version of Mikko's earlier proposal[0]. I've reworked
the TCU driver itself so that it relies less on global variables as well
as added a Kconfig option to allow the console support to be selected. I
also fixed a couple of issues that manifested themselves as I was moving
towards the IRQ driven mode (TCU was passing a pointer to a local
variable which was getting stored in the mailbox's ring buffer and the
data pointed at was becoming stale by the time the mailbox got around to
dequeue it).

The biggest bulk of the changes is in the mailbox driver. This series
addresses all of Jassi's comments from back at the time. One notable
additional change is that shared mailboxes are now interrupt driven,
which removes the need for polling mode.

Unfortunately there is still an issue because the TCU uses the mailbox
in atomic context for both TTY and console modes, so we get a sleeping-
while-atomic BUG when using mbox_client->tx_block = true in order to
rate-limit mbox_send_message(). In order to work around this, I added a
new mbox_flush() API that will allow flushing the mailbox in atomic
context by using the mailbox controller's implementation of ->flush().
For Tegra HSP shared mailboxes this is done by spinning on the shared
mailbox register until the receiver has marked the mailbox as empty. I
have been running this locally for a couple of days now and it works
perfectly.

Furthermore this series incorporates Mikko's work in progress on
splitting up the mailbox controllers and allowing multiple controllers
to match on the same device tree node during mbox_request_channel().

The new mbox_flush() API introduces a build-time dependency between the
TCU driver and the mailbox framework, so patches 1-9 would need to go
through one tree. Patch 9 was already acked by Greg, so I would suggest
that Jassi pick up the first 9 patches and I pick up patches 10-12 into
the Tegra tree.

Changes in v3:
- add a patch from Bartosz Golaszewski to use devm_kstrdup_const()
- add a patch to use device-managed registration to simplify code
- introduce explicit mailbox flush API

Changes in v2:
- address all of Pekka's comments regarding shared interrupts, registers
  that don't exist on Tegra186 and shared mailbox directionality
- add a patch to enable the TCU in the 64-bit ARM default configuration

Thanks,
Thierry

[0]: https://lore.kernel.org/patchwork/project/lkml/list/?series=357641

Bartosz Golaszewski (1):
  mailbox: tegra-hsp: use devm_kstrdup_const()

Mikko Perttunen (5):
  mailbox: Allow multiple controllers per device
  dt-bindings: tegra186-hsp: Add shared mailboxes
  dt-bindings: serial: Add bindings for nvidia,tegra194-tcu
  arm64: tegra: Add nodes for TCU on Tegra194
  arm64: tegra: Mark TCU as primary serial port on Tegra194 P2888

Thierry Reding (6):
  mailbox: Support blocking transfers in atomic context
  mailbox: tegra-hsp: Add support for shared mailboxes
  mailbox: tegra-hsp: Add suspend/resume support
  mailbox: tegra-hsp: Use device-managed registration API
  serial: Add Tegra Combined UART driver
  arm64: defconfig: Enable Tegra TCU

 .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  30 +-
 .../bindings/serial/nvidia,tegra194-tcu.txt   |  35 ++
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  38 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/mailbox/mailbox.c                     |  31 +-
 drivers/mailbox/tegra-hsp.c                   | 517 +++++++++++++++---
 drivers/tty/serial/Kconfig                    |  22 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/tegra-tcu.c                | 298 ++++++++++
 include/dt-bindings/mailbox/tegra186-hsp.h    |  11 +
 include/linux/mailbox_client.h                |   1 +
 include/linux/mailbox_controller.h            |   4 +
 include/uapi/linux/serial_core.h              |   3 +
 14 files changed, 903 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
 create mode 100644 drivers/tty/serial/tegra-tcu.c

-- 
2.19.1
