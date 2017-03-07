From: Alban <albeu@free.fr>
Subject: [PATCH v2 0/2] mtd: Add support for reading MTD devices via the nvmem
 API
Date: Tue,  7 Mar 2017 09:26:02 +0100
Message-ID: <1488875164-30440-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Alban <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi all,

First thanks to everybody for the feedback on the first series, I implemented
most of the suggestions in this new version. The biggest change is to
directly integrate in the MTD core instead of using notifiers which allow us
to simplify the code quiet a bit.

During the discussion 2 points showed up, reworking the NVMEM binding and
improving the MTD notifiers. Both are good points but not relevant for
this series, so I left that out for another time.

The NVMEM device ID bug fix found in the first series has already been
applied so I didn't include it again.

Alban (2):
  doc: bindings: Add bindings documentation for mtd nvmem
  mtd: Add support for reading MTD devices via the nvmem API

 .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++
 drivers/mtd/Kconfig                                |  9 +++
 drivers/mtd/Makefile                               |  1 +
 drivers/mtd/mtdcore.c                              | 13 ++++
 drivers/mtd/mtdnvmem.c                             | 72 ++++++++++++++++++++++
 drivers/mtd/mtdnvmem.h                             | 25 ++++++++
 include/linux/mtd/mtd.h                            |  4 ++
 7 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
 create mode 100644 drivers/mtd/mtdnvmem.c
 create mode 100644 drivers/mtd/mtdnvmem.h

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
