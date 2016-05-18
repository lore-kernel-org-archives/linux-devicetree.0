From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v6 0/3] auxdisplay: Introduce ht16k33 driver
Date: Wed, 18 May 2016 14:23:16 +0200
Message-ID: <1463574199-21077-1-git-send-email-robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Matt Ranostay <mranostay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

This patchset adds a new driver to the auxdisplay subsystem. It also adds
devicetree bindings documentation and a new vendor prefix.

I added myself as maintainer to the MAINTAINERS file.

Robin van der Gracht (3):
  of: add vendor prefix for Holtek Semiconductor
  auxdisplay: ht16k33: Driver for LED controller
  MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver

 .../devicetree/bindings/display/ht16k33.txt        |  42 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   6 +
 drivers/auxdisplay/Kconfig                         |   9 +
 drivers/auxdisplay/Makefile                        |   1 +
 drivers/auxdisplay/ht16k33.c                       | 563 +++++++++++++++++++++
 6 files changed, 622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
 create mode 100644 drivers/auxdisplay/ht16k33.c

-- 
2.7.4
