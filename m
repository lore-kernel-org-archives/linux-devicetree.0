From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fix for 5.0-rc5
Date: Sat, 2 Feb 2019 11:10:06 -0600
Message-ID: <CAL_JsqLPN1ko5nPSTh80EQa2Zz_LHvFFCw42XYBcv8VSa_cYvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull.

Rob

The following changes since commit 75a080cde08d2dcba19ee864f9732094d93fab41:

  powerpc: chrp: Use of_node_is_type to access device_type (2019-01-19
10:35:42 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.0-3

for you to fetch changes up to 5fa98c2eda35fcd1a1d91a9785c390f54688240c:

  dt-bindings: Fix dt_binding_check target for in tree builds
(2019-01-23 09:15:57 -0600)

----------------------------------------------------------------
A single fix for building DT bindings in-tree.

----------------------------------------------------------------
Rob Herring (1):
      dt-bindings: Fix dt_binding_check target for in tree builds

 Documentation/devicetree/bindings/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
