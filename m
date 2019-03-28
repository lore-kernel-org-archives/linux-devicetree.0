From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] mtd: physmap: Using gpio-addrs
Date: Thu, 28 Mar 2019 17:02:14 +1300
Message-ID: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

I have a system with ADDR24 of the flash chip connected to a gpio pin. Th=
is
series fixes a bug in physmap-core.c and adds an example for using gpio-a=
ddrs
to the dt-binding based on the system I'm using.

Chris Packham (2):
  mtd: maps: physmap: Store gpio_values correctly
  dt-binding: mtd: physmap: Add example using addr-gpios property

 .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
 drivers/mtd/maps/physmap-core.c                  |  2 ++
 2 files changed, 18 insertions(+)

--=20
2.21.0
