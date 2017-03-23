From: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 0/5] firmware: google memconsole
Date: Thu, 23 Mar 2017 22:04:24 +0100
Message-ID: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset = "utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Transfert-Encoding: 8bit
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series extends the Google memory console driver to work on x86 and
ARM platforms running coreboot.

The legacy x86 memconsole driver is now named memconsole-x86-legacy and
a new driver named memconsole-coreboot is added.

On coreboot devices and depending on the device architecture, the driver
coreboot_table-acpi on x86 platforms or coreboot_table-of on ARM/ARM64
platforms is responsible to get the coreboot table header memory address
and then obtain the memory console address.

Regards,
 Thierry

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
