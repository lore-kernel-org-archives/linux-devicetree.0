From: Rob Herring <robherring2@gmail.com>
Subject: [PULL] DT fixes for 3.3
Date: Mon, 27 Feb 2012 14:02:24 -0600
Message-ID: <4F4BE150.3000903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Grant,

Please pull these few fixes and doc updates for 3.3.

Rob

The following changes since commit 6b21d18ed50c7d145220b0724ea7f2613abf0f95:

  Linux 3.3-rc5 (2012-02-25 12:18:16 -0800)

are available in the git repository at:
  git://sources.calxeda.com/kernel/linux.git fixes-for-grant

Baruch Siach (1):
      of/mdio: fix fixed link bus name

Danny Kukawka (1):
      of/fdt.c: asm/setup.h included twice

Jamie Iles (1):
      of: add picochip vendor prefix

Tobias Klauser (1):
      doc: dt: Fix broken reference in gpio-leds documentation

 Documentation/devicetree/bindings/gpio/led.txt     |    6 +++---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/of/fdt.c                                   |    1 -
 drivers/of/of_mdio.c                               |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
