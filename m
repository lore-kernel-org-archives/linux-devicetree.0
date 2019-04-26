From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/5] mtd: onenand/samsung: Add device tree support
Date: Fri, 26 Apr 2019 18:42:19 +0200
Message-ID: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kyungmin.park@samsung.com
Cc: bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds device tree support to Samsung OneNAND driver.
It was tested on Samsung Galaxy S and Samsung Galaxy S Fascinate 4G,
an Samsung S5PV210 based mobile phones.

Tomasz Figa (5):
  mtd: onenand/samsung: Unify resource order for controller variants
  mtd: onenand/samsung: Make sure that bus clock is enabled
  mtd: onenand/samsung: Add device tree support
  dt-binding: mtd: onenand/samsung: Add device tree support
  mtd: onenand/samsung: Set name field of mtd_info struct

 .../bindings/mtd/samsung-onenand.txt          | 46 +++++++++
 drivers/mtd/nand/onenand/samsung.c            | 94 +++++++++++++------
 2 files changed, 113 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt

-- 
2.20.1
