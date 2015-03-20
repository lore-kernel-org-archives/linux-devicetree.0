From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.0
Date: Fri, 20 Mar 2015 16:47:15 -0500
Message-ID: <CAL_JsqJhJ+vGDwYxXRHuAGeCX6Kt7YE=z2wiVNrB-EBwM98wVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull some more DT fixes for 4.0.

Rob

The following changes since commit 06e5801b8cb3fc057d88cb4dc03c0b64b2744cda:

  Linux 4.0-rc4 (2015-03-15 17:38:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.0-part2

for you to fetch changes up to f64255b5072d9c46cef8655d51cf7e10285abed7:

  Revert "of: Fix premature bootconsole disable with 'stdout-path'"
(2015-03-19 08:46:54 -0500)

----------------------------------------------------------------
More DeviceTree fixes for 4.0:

- Revert setting stdout-path as preferred console. This caused
regressions in PowerMACs and other systems.

- Yet another fix for stdout-path option parsing.

- Fix error path handling in of_irq_parse_one

----------------------------------------------------------------
Brian Norris (2):
      of: unittest: Add option string test case with longer path
      of: handle both '/' and ':' in path strings

Laurent Pinchart (1):
      of/irq: Fix of_irq_parse_one() returned error codes

Peter Hurley (1):
      Revert "of: Fix premature bootconsole disable with 'stdout-path'"

 drivers/of/base.c     | 11 ++---------
 drivers/of/irq.c      | 10 +++++++---
 drivers/of/unittest.c |  5 +++++
 3 files changed, 14 insertions(+), 12 deletions(-)
