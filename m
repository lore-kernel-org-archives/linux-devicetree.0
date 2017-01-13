From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 0/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Fri, 13 Jan 2017 15:16:51 +0300
Message-ID: <1484309813-25008-1-git-send-email-fancer.lancer@gmail.com>
References: <1481638971-6247-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481638971-6247-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org, andrew@lunn.ch, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Changelog v3:
- Get rid of dev_*_idt() macros
- Replace to_pdev_kobj() macro with naked dev_get_drvdata() call
- Return naked 0 instead of SUCCESS macro
- IDT CSR debug file is moved to debugfs
- BIN_ATTR_RW is used to declare sysfs binary attribute
- Moved bindings file to a separate patch
- Need to create a specific bin_attribute structure for each device
- Perform a few read retries with delays if EEPROM is busy

Changelog v4:
- Make 89HPESx device bindings to have one EEPROM subnode
- Alter 89HPESx device bindings text

Changelog v5:
- Replace atomic_t CSR field with of u16 type
- Get rid of dev_dbg() print outs of initialization methods
- Simplify DebugFS initialization method

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Serge Semin (2):
  eeprom: Add IDT 89HPESx EEPROM/CSR driver
  eeprom: Add IDT 89HPESx driver bindings file

 .../devicetree/bindings/misc/idt_89hpesx.txt       |   44 +
 drivers/misc/eeprom/Kconfig                        |   10 +
 drivers/misc/eeprom/Makefile                       |    1 +
 drivers/misc/eeprom/idt_89hpesx.c                  | 1587 ++++++++++++++++++++
 4 files changed, 1642 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/idt_89hpesx.txt
 create mode 100644 drivers/misc/eeprom/idt_89hpesx.c

-- 
2.6.6
