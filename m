From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree fix for 4.19-rc8
Date: Wed, 10 Oct 2018 06:59:13 -0500
Message-ID: <CAL_JsqL4xQXoQubUEb9p2r5AEV+n1OAW=ss-DVQm4dmWU=n2hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,

Please pull this one DT fix for 4.19.

Note I didn't tag this for stable as I cherry-picked it from my 4.20
branch and wanted to not touch the commit msg at all. Maybe that
doesn't matter.

Rob

The following changes since commit e54192b48da75f025ae4b277925eaf6aca1d13bd:

  of: fix phandle cache creation for DTs with no phandles (2018-09-11
11:28:40 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.19-3

for you to fetch changes up to 8894891446c9380709451b99ab45c5c53adfd2fc:

  of: unittest: Disable interrupt node tests for old world MAC systems
(2018-10-10 06:43:37 -0500)

----------------------------------------------------------------
Devicetree fixes for 4.19, part 3:

- Fix DT unittest on Oldworld MAC systems

----------------------------------------------------------------
Guenter Roeck (1):
      of: unittest: Disable interrupt node tests for old world MAC systems

 drivers/of/unittest.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)
