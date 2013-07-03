From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Wed, 3 Jul 2013 15:03:49 +0200
Message-ID: <201307031503.50033.arnd@arndb.de>
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1372764757-29511-1-git-send-email-pekon@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Pekon Gupta <pekon@ti.com>
Cc: tony@atomide.com, artem.bityutskiy@linux.intel.com, benoit.cousson@linaro.org, olof@lixom.net, avinashphilipk@gmail.com, balbi@ti.com, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org, jp.francois@cynove.com, devicetree-discuss@lists.ozlabs.org, sfr@canb.auug.org.au
List-Id: devicetree@vger.kernel.org

On Tuesday 02 July 2013, Pekon Gupta wrote:
> (+ CC: devicetree-discuss@lists.ozlabs.org)
> 
> Changes v3 -> v4
> - [Patch 1/3] removed MTD_NAND_OMAP_BCH8 & MTD_NAND_OMAP_BCH4 from nand/Kconfig
> 	ECC scheme selectable via nand DT (nand-ecc-opt).
> - [*] rebased for l2-mtd.git

Do you also fix these build error?

/git/arm-soc/drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
/git/arm-soc/drivers/mtd/nand/omap2.c:1964:7: error: 'OMAP_ECC_BCH8_CODE_HW_DETECTION_SW' undeclared (first use in this function)
  case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
       ^
/git/arm-soc/drivers/mtd/nand/omap2.c:1964:7: note: each undeclared identifier is reported only once for each function it appears in
/git/arm-soc/drivers/mtd/nand/omap2.c:1991:7: error: 'OMAP_ECC_BCH4_CODE_HW_DETECTION_SW' undeclared (first use in this function)
  case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
       ^


	Arnd
