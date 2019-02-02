From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
Date: Sat,  2 Feb 2019 20:19:17 -0300
Message-ID: <20190202231926.2444-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

As requested by Boris, I added a patch to move all the Ingenic NAND
drivers to their own directory.

In this V2 I added support for the JZ4740 SoC. The combo of the
jz4780-nemc, jz4780-nand and jz4740-bch now obsolete the old and dusty
jz4740-nand driver.

To support the only upstream JZ4740-based board we have, the Ben
Nanonote, I added an option to specify the OOB layout of that device
from a device property string.

Finally, I dropped the last two patches that moved the platform NAND
code to devicetree; I will upstream them as part of a different
patchset.

Cheers,
-Paul
