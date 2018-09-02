From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree update for 4.19-rc2
Date: Sun, 2 Sep 2018 09:04:58 -0400
Message-ID: <CAL_JsqLtOfYc9i-K+RGz9Aacq_YKEpbyjG_dv6sRX7wLLw5qVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please consider pulling this DT update for rc2. I'm sending these new
helpers now for rc2 in order to simplify the dependencies on
subsequent cleanups across the tree in 4.20.

Rob

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.19

for you to fetch changes up to 0413bedabc886c3a56804d1c80a58e99077b1d91:

  of: Add device_type access helper functions (2018-08-31 08:30:42 -0400)

----------------------------------------------------------------
Devicetree updates for 4.19-rc2:

A couple of new helper functions in preparation for some tree wide
clean-ups.

----------------------------------------------------------------
Johan Hovold (1):
      of: add helper to lookup compatible child node

Rob Herring (2):
      of: add node name compare helper functions
      of: Add device_type access helper functions

 drivers/of/base.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
