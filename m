From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.14, round 2
Date: Fri, 13 Oct 2017 08:25:00 -0500
Message-ID: <CAL_JsqJNLUc+sHtxfQUaR9mZJGXL3=U4sG9fUVzx_dzQ293ETQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull a couple more DT fixes for 4.14.

Rob

The following changes since commit 8a5776a5f49812d29fe4b2d0a2d71675c3facf3f=
:

  Linux 4.14-rc4 (2017-10-08 20:53:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.14-2

for you to fetch changes up to 3314c6bdd26880e0dfbcb0cb85a1b36d185ce47c:

  device property: preserve usecount for node passed to
of_fwnode_graph_get_port_parent() (2017-10-12 12:26:14 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.14:

- Fix memory leak in error case of of_console_check

- Increase number of reserved memory regions to 32. 16 was not enough on
  some Power systems.

- Fix OF node refcounting for of_fwnode_graph_get_port_parent

----------------------------------------------------------------
Niklas S=C3=B6derlund (1):
      device property: preserve usecount for node passed to
of_fwnode_graph_get_port_parent()

Sergey Senozhatsky (1):
      of: do not leak console options

Stewart Smith (1):
      drivers: of: increase MAX_RESERVED_REGIONS to 32

 drivers/of/base.c            | 8 ++++++--
 drivers/of/of_reserved_mem.c | 2 +-
 drivers/of/property.c        | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)
