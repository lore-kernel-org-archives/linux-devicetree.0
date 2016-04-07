From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v5 0/2] auxdisplay: Introduce driver for ht16k33 LED controller
Date: Thu,  7 Apr 2016 10:53:59 +0200
Message-ID: <cover.1460019147.git.robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

This patch series adds a driver for the ht16k33 LED controller and a
new vendor prefix for Holtek Semiconductor Inc.

Robin van der Gracht (2):
  of: add vendor prefix for Holtek Semiconductor
  auxdisplay: ht16k33: Driver for LED controller

 .../devicetree/bindings/display/ht16k33.txt        |  42 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/auxdisplay/Kconfig                         |   9 +
 drivers/auxdisplay/Makefile                        |   1 +
 drivers/auxdisplay/ht16k33.c                       | 563 +++++++++++++++++++++
 5 files changed, 616 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
 create mode 100644 drivers/auxdisplay/ht16k33.c

-- 
2.5.0
