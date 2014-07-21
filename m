From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH RFC v3 0/4] Add arm pl353 smc nand driver for xilinx zynq
 soc
Date: Mon, 21 Jul 2014 19:44:41 +0530
Message-ID: <CAGnW=BY5Ox5Y5FeqaSYb-fwcHyBwH=wGL+W8JRtMVqs9w_hogQ@mail.gmail.com>
References: <e15ea1f7-ac67-49b3-aff4-7c388a5616cf@BL2FFO11FD021.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <e15ea1f7-ac67-49b3-aff4-7c388a5616cf@BL2FFO11FD021.protection.gbl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, svemula@xilinx.com, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, anirudh@xilinx.com, "joern@logfs.org" <joern@logfs.org>, Punnaiah Choudary <kpc528@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, acourbot@nvidia.c
List-Id: devicetree@vger.kernel.org

Hi Brian and Pekon,

  Do you have any further comments for this nand driver?


Regards,
Punnaiah

On Fri, Jun 27, 2014 at 8:33 AM, Punnaiah Choudary Kalluri
<punnaiah.choudary.kalluri@xilinx.com> wrote:
> The following patches add arm pl353 static memory controller driver for
> xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and
> nor/sram memory interfaces. The current implementation supports only a
> single SMC instance and nand specific configuration.
>
> xilinx zynq TRM link:
> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
>
> ARM pl353 smc TRM link:
> http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/
> DDI0380G_smc_pl350_series_r2p1_trm.pdf
>
> Punnaiah Choudary Kalluri (4):
>   nand: pl353: Add basic driver for arm pl353 smc nand interface
>   nand: pl353: Add software ecc support
>   nand: pl353: Add ONDIE ECC support
>   Documentation: nand: pl353: Add documentation for controller and
>     driver
>
>  Documentation/mtd/nand/pl353-nand.txt |   92 +++
>  drivers/mtd/nand/Kconfig              |    7 +
>  drivers/mtd/nand/Makefile             |    1 +
>  drivers/mtd/nand/pl353_nand.c         | 1141 +++++++++++++++++++++++++++++++++
>  4 files changed, 1241 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/mtd/nand/pl353-nand.txt
>  create mode 100644 drivers/mtd/nand/pl353_nand.c
>
> --
> 1.7.4
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
