From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fixes for 5.3-rc, take 3
Date: Wed, 14 Aug 2019 20:34:37 -0600
Message-ID: <CAL_JsqJRJp8a_sytr2C_18muxt4ehGQRdfu8n8J70HdRz-gFHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT fixes for 5.3.

Rob

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.3-3

for you to fetch changes up to 83f82d7a42583e93d0f0dde3d61ed10f75c0f4d8:

  of: irq: fix a trivial typo in a doc comment (2019-08-14 20:12:16 -0600)

----------------------------------------------------------------
Devicetree fixes for 5.3:

- Fix building DT binding examples for in tree builds

- Correct some refcounting in adjust_local_phandle_references()

- Update FSL FEC binding with deprecated properties

- Schema fix in stm32 pinctrl

- Fix typo in of_irq_parse_one docbook comment

----------------------------------------------------------------
Lubomir Rintel (1):
      of: irq: fix a trivial typo in a doc comment

Nishka Dasgupta (1):
      of: resolver: Add of_node_put() before return and break

Rob Herring (2):
      dt-bindings: Fix generated example files getting added to schemas
      dt-bindings: pinctrl: stm32: Fix 'st,syscfg' schema

Sven Van Asbroeck (1):
      dt-bindings: fec: explicitly mark deprecated properties

 Documentation/devicetree/bindings/Makefile         |  4 ++-
 Documentation/devicetree/bindings/net/fsl-fec.txt  | 30 ++++++++++++----------
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |  3 ++-
 drivers/of/irq.c                                   |  2 +-
 drivers/of/resolver.c                              | 12 ++++++---
 5 files changed, 32 insertions(+), 19 deletions(-)
