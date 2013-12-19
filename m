From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH 0/3] ARM: at91/dt: add clock properties to sama5d3 crypto devs
Date: Thu, 19 Dec 2013 16:11:12 +0100
Message-ID: <1387465875-4548-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds missing clock properties in sama5d3 crypto devices nodes.

Best Regards,

Boris

Boris BREZILLON (3):
  ARM: at91/dt: add clk properties to sama5d3 SHA device node
  ARM: at91/dt: add clk properties to sama5d3 AES device node
  ARM: at91/dt: add clk properties to sama5d3 TDES device node

 arch/arm/boot/dts/sama5d3.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.7.9.5
