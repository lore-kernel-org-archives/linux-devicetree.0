From: Alban <albeu@free.fr>
Subject: [PATCH 0/3] mtd: Add support for reading MTD devices via the nvmem API
Date: Thu,  2 Mar 2017 20:50:20 +0100
Message-ID: <1488484223-844-1-git-send-email-albeu@free.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Alban <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi all,

this is the followup to my "device data" patch[1] that add nvmem support
to the MTD subsystem. I took a look at the work done by Moritz[2] but we
had different goals. Moritz needed access to the MTD protection
registers where I need access to the normal data. For my use-case we can
just use the normal nvmem bindings and define the nvmem cells as
children nodes of the MTD partitions. The only thing I added is the
requirement for a `nvmem-provider` property in the partition to allow
the driver to only register the required partitions.

Note that nvmem cells currently can't be defined on the raw MTD devices
as that would clash with the old partitions binding. I think it would
be better to change the nvmem binding to require putting the cells in a
dedicated subnode, like in the new partitions binding.

Otherwise I just skipped Moritz's use-case as I don't know anything
about the MTD protection registers.

Finally I included a bug fix for the case where several nvmem devices
without name are registered. Currently all devices get registered as
`nvmem0` and the second registration fails.

[1] http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1341549.html
[2] https://patchwork.ozlabs.org/patch/626460/

Alban (3):
  doc: bindings: Add bindings documentation for mtd nvmem
  mtd: Add support for reading MTD devices via the nvmem API
  nvmem: core: Allow allocating several anonymous nvmem devices

 .../devicetree/bindings/nvmem/mtd-nvmem.txt        |  29 +++++
 drivers/mtd/Kconfig                                |   9 ++
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/mtdnvmem.c                             | 121 +++++++++++++++++++++
 drivers/nvmem/core.c                               |   3 +-
 5 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
 create mode 100644 drivers/mtd/mtdnvmem.c

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
