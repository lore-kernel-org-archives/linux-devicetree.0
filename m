From: Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH 0/2] Add support for Amazon's Annapurna Labs EDAC for L1/L2
Date: Thu, 30 May 2019 13:15:27 +0300
Message-ID: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com
Cc: ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for error detection and correction for Amazon's Annapurna Labs SoCs
for L1/L2 caches.
Alpine SoCs support L1 and L2 error correction check based on ARM implementation.

Hanna Hawa (2):
  dt-bindings: EDAC: add Amazon Annapurna Labs EDAC binding
  edac: add support for Amazon's Annapurna Labs EDAC

 .../devicetree/bindings/edac/amazon-al-edac.txt    |  16 ++
 MAINTAINERS                                        |   7 +
 drivers/edac/Kconfig                               |   9 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/amazon_al_ca57_edac.c                 | 283 +++++++++++++++++++++
 5 files changed, 316 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon-al-edac.txt
 create mode 100644 drivers/edac/amazon_al_ca57_edac.c

-- 
2.7.4
