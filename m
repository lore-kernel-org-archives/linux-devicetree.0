From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.15
Date: Mon, 20 Nov 2017 12:34:30 -0600
Message-ID: <CAL_JsqLxRXZgjHYrQ3Upnp_X0ej8Cb1_0+gjjEmBGB5jbYEtvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT fixes for 4.15.

Rob

The following changes since commit aa25e446ce76c37bfd75ac06598c316af94e9a26=
:

  dt-bindings: usb: add #phy-cells to usb-nop-xceiv (2017-11-13 16:50:01 -0=
600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.15

for you to fetch changes up to def4db33e69609a43b28b399d569b6a0d3ba272a:

  dt-bindings: trivial-devices: Remove fsl,mc13892 (2017-11-20 12:26:23 -06=
00)

----------------------------------------------------------------
DeviceTree fixes for 4.15:

- Remove mc13892 as a trivial device

- Improve of_find_node_by_name() documentation

- Fix unit test dtc warnings

- Clean-ups of USB binding documentation

- Fix potential NULL deref in of_pci_map_rid

----------------------------------------------------------------
Johan Hovold (4):
      dt-bindings: usb: fix example hub node name
      dt-bindings: usb: fix reg-property port-number range
      dt-bindings: usb: clean up compatible property
      dt-bindings: usb: document hub and host-controller properties

Jonathan Neusch=C3=A4fer (1):
      dt-bindings: trivial-devices: Remove fsl,mc13892

Rob Herring (2):
      of: unittest: let dtc generate __local_fixups__
      of: unittest: disable interrupts_property warning

Robin Murphy (1):
      of/pci: Fix theoretical NULL dereference

Stephen Boyd (1):
      of: Document exactly what of_find_node_by_name() puts

 .../devicetree/bindings/trivial-devices.txt        |  1 -
 .../devicetree/bindings/usb/usb-device.txt         | 33 +++++++----
 drivers/of/base.c                                  |  6 +-
 drivers/of/of_pci.c                                |  2 +-
 drivers/of/unittest-data/Makefile                  |  1 +
 drivers/of/unittest-data/testcases.dts             | 65 +-----------------=
----
 6 files changed, 29 insertions(+), 79 deletions(-)
