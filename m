From: Laurentiu Palcu <laurentiu.palcu@intel.com>
Subject: [PATCH v2 0/2] Add support for BQ25890 charger chip
Date: Tue, 19 May 2015 16:24:38 +0300
Message-ID: <1432041880-7373-1-git-send-email-laurentiu.palcu@intel.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sebastian Reichel <sre@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Laurentiu Palcu <laurentiu.palcu@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes since v1:
 * add comment in DT bindings regarding default driver behavior when
   "ti,thermal-regulation-threshold" property is missing;
 * addressed all Krzysztof's comments, including addition of a reset
   check counter. Better to be safe than sorry :)

Hi,

This series adds support for BQ25890 USB charger chip. Information about
the chip can be found here:

http://www.ti.com/product/bq25890

Thanks,
laurentiu

Laurentiu Palcu (2):
  Documentation: devicetree: Add TI BQ25890 bindings
  power_supply: Add support for TI BQ25890 charger chip

 .../devicetree/bindings/power/bq25890.txt          |  46 +
 drivers/power/Kconfig                              |   7 +
 drivers/power/Makefile                             |   1 +
 drivers/power/bq25890_charger.c                    | 999 +++++++++++++++++++++
 4 files changed, 1053 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/bq25890.txt
 create mode 100644 drivers/power/bq25890_charger.c

-- 
1.9.1

