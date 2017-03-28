From: Thierry Escande <thierry.escande@collabora.com>
Subject: [PATCH v2 0/5] firmware: google memconsole
Date: Tue, 28 Mar 2017 18:11:24 +0200
Message-ID: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset = "utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Transfert-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series extends the Google memory console driver to work on x86 and
ARM platforms running coreboot.

The Google memory console driver provides access to an in-memory log of
the firmware's output.

The legacy x86 memconsole driver is now named memconsole-x86-legacy and
a new driver named memconsole-coreboot is added.

On coreboot devices and depending on the device architecture, the driver
coreboot_table-acpi on x86 platforms or coreboot_table-of on ARM/ARM64
platforms is responsible to get the coreboot table header memory address
and then obtain the memory console address.

Thus, this series adds device tree binding for coreboot entries under
the '/firmware' node. The place where this should be/have been declared
has been discussed years ago when first submitted. Please see previous
discussions [1] and [2]. In the meantime a lot of chromebook devices
have been shipped with this binding in their firmware making it hard to
change/update.

[1] https://patchwork.ozlabs.org/patch/359672/
[2] https://patchwork.kernel.org/patch/4362661/

Regards,
 Thierry

This v2 adds a dependency on X86 for the GOOGLE_SMI symbol and few more
comments in this cover letter.

Julius Werner (1):
  firmware: Add coreboot device tree binding documentation

Thierry Escande (4):
  firmware: google memconsole: Remove useless submenu in Kconfig
  firmware: google memconsole: Move specific EBDA parts
  firmware: google memconsole: Add coreboot support
  firmware: google memconsole: Add ARM/ARM64 support

 .../devicetree/bindings/firmware/coreboot.txt      |  33 +++++
 drivers/firmware/google/Kconfig                    |  50 ++++++-
 drivers/firmware/google/Makefile                   |   7 +-
 drivers/firmware/google/coreboot_table-acpi.c      |  88 ++++++++++++
 drivers/firmware/google/coreboot_table-of.c        |  82 +++++++++++
 drivers/firmware/google/coreboot_table.c           |  94 +++++++++++++
 drivers/firmware/google/coreboot_table.h           |  50 +++++++
 drivers/firmware/google/memconsole-coreboot.c      | 109 +++++++++++++++
 drivers/firmware/google/memconsole-x86-legacy.c    | 154 ++++++++++++++++++++
 drivers/firmware/google/memconsole.c               | 155 +++------------------
 drivers/firmware/google/memconsole.h               |  43 ++++++
 11 files changed, 725 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
 create mode 100644 drivers/firmware/google/coreboot_table-acpi.c
 create mode 100644 drivers/firmware/google/coreboot_table-of.c
 create mode 100644 drivers/firmware/google/coreboot_table.c
 create mode 100644 drivers/firmware/google/coreboot_table.h
 create mode 100644 drivers/firmware/google/memconsole-coreboot.c
 create mode 100644 drivers/firmware/google/memconsole-x86-legacy.c
 create mode 100644 drivers/firmware/google/memconsole.h

-- 
2.7.4
