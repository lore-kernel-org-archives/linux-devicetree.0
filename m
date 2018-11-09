From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fixes for 4.20-rc, round 2
Date: Fri, 9 Nov 2018 15:39:43 -0600
Message-ID: <CAL_JsqLOqQ3p7mScZVfusQkrEvNCKzCWL+u1Jfe_d91Eh_krwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull.

Rob

The following changes since commit c961cb3be9064d1097ccc019390f8b5739daafc6:

  of: Fix cpu node iterator to not ignore disabled cpu nodes
(2018-11-01 16:16:54 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.20-2

for you to fetch changes up to 89c38422e072bb453e3045b8f1b962a344c3edea:

  of, numa: Validate some distance map rules (2018-11-08 12:44:34 -0600)

----------------------------------------------------------------
Devicetree fixes for 4.20-rc:

- Add validation of NUMA distance map to prevent crashes with bad map

- Fix setting of dma_mask

----------------------------------------------------------------
John Garry (1):
      of, numa: Validate some distance map rules

Robin Murphy (1):
      of/device: Really only set bus DMA mask when appropriate

 drivers/of/device.c  | 4 +++-
 drivers/of/of_numa.c | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)
