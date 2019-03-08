From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree for 5.1
Date: Fri, 8 Mar 2019 14:37:47 -0600
Message-ID: <CAL_JsqLkW7OYJEaONK3Uh9Ly0iXaaOMpwKPgP8EpdBCc9i3UJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT updates for 5.1.

Rob

The following changes since commit 1c7fc5cbc33980acd13d668f1c8f0313d6ae9fd8:

  Linux 5.0-rc2 (2019-01-14 10:41:12 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-5.1

for you to fetch changes up to 935665c1a117f34662549f01e1c9bc5ea7132556:

  of: unittest: unflatten device tree on UML when testing (2019-02-28
11:50:10 -0600)

----------------------------------------------------------------
Devicetree updates for v5.1:

- Fix a unittest failure on UML. Preparation for converting to
  kunit test framework.

- Add annotations to dtx_diff output

- Fix unittest reporting of expected error

- Move DMA configuration for virtual devices into the driver that
  needs it (s5p-mfc)

- Vendor prefixes for feiyang and techstar

- Convert ARM GIC, GICv3, and L2x0 to DT schema

- Add r8a7778/9 HSCIF serial bindings

----------------------------------------------------------------
Akinobu Mita (1):
      dt-bindings: display: add missing semicolon in example

Brendan Higgins (1):
      of: unittest: unflatten device tree on UML when testing

Christoph Hellwig (1):
      of: mark early_init_dt_alloc_reserved_memory_arch static

Frank Rowand (3):
      of: unittest: remove report of expected error
      of: unittest: add caution to function header comment
      of: add dtc annotations functionality to dtx_diff

Jagan Teki (2):
      dt-bindings: Add vendor prefix for techstar
      dt-bindings: Add vendor prefix for feiyang

Rob Herring (3):
      dt-bindings: arm: l2x0: Convert L2 cache to json-schema
      dt-bindings: interrupt-controller: Convert ARM GIC to json-schema
      dt-bindings: interrupt-controller: Convert ARM GICv3 to json-schema

Robin Murphy (1):
      media: s5p-mfc: Fix memdev DMA configuration

Ulrich Hecht (1):
      dt-bindings: serial: sh-sci: Document r8a7778/9 HSCIF bindings

 Documentation/devicetree/bindings/arm/l2c2x0.txt   | 114 ---------
 Documentation/devicetree/bindings/arm/l2c2x0.yaml  | 248 ++++++++++++++++++
 .../bindings/display/sitronix,st7735r.txt          |   2 +-
 .../bindings/interrupt-controller/arm,gic-v3.txt   | 175 -------------
 .../bindings/interrupt-controller/arm,gic-v3.yaml  | 279 +++++++++++++++++++++
 .../bindings/interrupt-controller/arm,gic.txt      | 171 -------------
 .../bindings/interrupt-controller/arm,gic.yaml     | 223 ++++++++++++++++
 .../bindings/serial/renesas,sci-serial.txt         |   2 +
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 drivers/media/platform/s5p-mfc/s5p_mfc.c           |   7 +
 drivers/of/of_reserved_mem.c                       |   6 +-
 drivers/of/unittest.c                              |  15 +-
 include/linux/of_reserved_mem.h                    |   7 -
 scripts/dtc/dtx_diff                               |  13 +-
 14 files changed, 788 insertions(+), 476 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/l2c2x0.txt
 create mode 100644 Documentation/devicetree/bindings/arm/l2c2x0.yaml
 delete mode 100644
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
 delete mode 100644
Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
