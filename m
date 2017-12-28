From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] Add efuse driver for Ingenic JZ4780 SoC
Date: Thu, 28 Dec 2017 22:29:51 +0100
Message-ID: <20171228212954.2922-1-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Nowakowski <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Zubair.Kakakhel-8NJIiSa5LzA@public.gmane.org, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset bring support for read-only access to the JZ4780 efuse as found
on MIPS Creator CI20.

To keep the driver as simple as possible, it was not possible to re-use most of
the nvmem core functionalities. This driver is not compatible with the original
efuse driver as found in the custom linux kernel from upstream (1), in
particular it does not expose to the users neither:
`/sys/devices/platform/*/chip_id` nor `/sys/devices/platform/*/user_id`.

The goal of this driver is to provide access to the MAC address to the dm9000
driver.

(1) https://github.com/ZubairLK/CI20_linux/commit/6efd4ffca7dcfaff0794ab60cd6922ce96c60419

Changes in v2:
Properly handle offset and byte value from the main entry point.
Also add a commit message in patch #2.

Mathieu Malaterre (1):
  dts: Probe efuse for CI20

PrasannaKumar Muralidharan (1):
  nvmem: add driver for JZ4780 efuse

 .../ABI/testing/sysfs-driver-jz4780-efuse          |  16 ++
 .../bindings/nvmem/ingenic,jz4780-efuse.txt        |  17 ++
 MAINTAINERS                                        |   5 +
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  40 ++-
 arch/mips/configs/ci20_defconfig                   |   2 +
 drivers/nvmem/Kconfig                              |  10 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/jz4780-efuse.c                       | 305 +++++++++++++++++++++
 8 files changed, 385 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
 create mode 100644 drivers/nvmem/jz4780-efuse.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
