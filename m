From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fixes for 4.20-rc1
Date: Thu, 1 Nov 2018 16:23:34 -0500
Message-ID: <CAL_JsqJ8tAUbbHp9Ymu3gsfSGSK=qgPDofxA9yH8T9k67QjPNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull a couple of fixes for rc1.

Rob

The following changes since commit d061864b89c3234b53d8884027b0cd6f06bd3149:

  ARM: dt: relicense two DT binding IRQ headers (2018-10-26 07:46:32 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.20-1

for you to fetch changes up to c961cb3be9064d1097ccc019390f8b5739daafc6:

  of: Fix cpu node iterator to not ignore disabled cpu nodes
(2018-11-01 16:16:54 -0500)

----------------------------------------------------------------
Devicetree fixes for v4.20-rc1:

- Fix cpu node iterator for powerpc systems

- Clarify ARM CPU binding 'capacities-dmips-mhz' property calculations

----------------------------------------------------------------
Rob Herring (1):
      of: Fix cpu node iterator to not ignore disabled cpu nodes

Viresh Kumar (1):
      dt-bindings: arm: Explain capacities-dmips-mhz calculations in example

 Documentation/devicetree/bindings/arm/cpu-capacity.txt | 8 +++++---
 drivers/of/base.c                                      | 2 --
 2 files changed, 5 insertions(+), 5 deletions(-)
