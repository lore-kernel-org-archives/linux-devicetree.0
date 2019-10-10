From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v6 0/2] Amazon's Annapurna Labs POS Driver
Date: Thu, 10 Oct 2019 14:41:19 +0300
Message-ID: <1570707681-865-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, maz@kernel.org, mark.rutland@arm.com, arnd@arndb.de, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, talel@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

The Amazon's Annapurna Labs SoCs includes Point Of Serialization error
logging unit that reports an error in case of write error (e.g. attempt to
write to a read only register).

This patch series introduces the support for this unit.

Changes since v5:
=================
- added missing include to dt binding

Changes since v4:
================
- fixed dt binding according to new dt scheme
- added back the use of _relaxed accessors

Changes since v3:
=================
- ported to be edac device
- converted dt-bindings to new scheme
- added unit address to dt example

Changes since v2:
=================
- squashed left shifting fix to the driver

Changes since v1:
=================
- move MODULE_ to the end of the file
- simplified resource remapping devm_platform_ioremap_resource()
- use platform_get_irq() instead of irq_of_parse_and_map()
- removed the use of _relaxed accessor in favor to the regular ones
- removed driver selected based on arch
- added casting to u64 before left shifting (reported by kbuild test robot)


Talel Shenhar (2):
  dt-bindings: soc: al-pos: Amazon's Annapurna Labs POS
  soc: amazon: al-pos-edac: Introduce Amazon's Annapurna Labs POS EDAC
    driver

 .../bindings/edac/amazon,al-pos-edac.yaml          |  41 +++++
 MAINTAINERS                                        |   7 +
 drivers/edac/Kconfig                               |   6 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/al_pos_edac.c                         | 173 +++++++++++++++++++++
 5 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
 create mode 100644 drivers/edac/al_pos_edac.c

-- 
2.7.4
