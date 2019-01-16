From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 0/2] iio: adc: npcm: add NPCM ADC driver
Date: Wed, 16 Jan 2019 18:48:53 +0200
Message-ID: <20190116164855.200357-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set adds Analog-to-Digital Converter (ADC) support 
for the Nuvoton NPCM Baseboard Management Controller (BMC).

The NPCM ADC is a 10-bit converter for eight channel inputs.

The NPCM ADC driver tested on NPCM750 evaluation board.

Addressed comments from:.
 - Jonathan Cameron: https://lore.kernel.org/patchwork/patch/1030483/

Changes since version 2:
 - Return error if clock have not found in the device tree ADC node.
 - Modify regulator order for avoid mixing devm and non-devm path.
 - Modify probe and remove function to have relative ordering.
 				  
Changes since version 1:
 - Add NPCM prefix.
 - Remove unnecessary parameter initialization.
 - Modify read function to avoid racy condition.
 - Reading the reference voltage when needed.
 - Modify dt-binding documentation according Jonathan comments.

Tomer Maimon (2):
  dt-binding: iio: add NPCM ADC documentation
  iio: adc: add NPCM ADC driver

 .../bindings/iio/adc/nuvoton,npcm-adc.txt          |  35 +++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/npcm_adc.c                         | 335 +++++++++++++++++++++
 4 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
 create mode 100644 drivers/iio/adc/npcm_adc.c

-- 
2.14.1
