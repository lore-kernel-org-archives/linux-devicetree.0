From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH v10] MTD: LPC32xx MLC NAND driver
Date: Sat, 30 Jun 2012 14:32:16 +0200
Message-ID: <4FEEF1D0.5060404@antcom.de>
References: <1340834129-15545-1-git-send-email-stigge@antcom.de> <1340973434.3070.168.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340973434.3070.168.camel@sauron.fi.intel.com>
Sender: linux-doc-owner@vger.kernel.org
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk, Alexandre Pereira da Silva <aletes.xgr@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Artem!

Thanks for the notes!

On 29/06/12 14:37, Artem Bityutskiy wrote:
> Successfully built configuration
> "arm-lpc32xx_defconfig,arm,arm-unknown-linux-gnueabi-", results:
> 
> --- before_patching.log +++ after_patching.log @@ @@ 
> +drivers/mtd/nand/lpc32xx_mlc.c: In function 'lpc32xx_nand_probe': 
> +drivers/mtd/nand/lpc32xx_mlc.c:679:10: warning: variable 'sr' set
> but not used [-Wunused-but-set-variable] 
> +drivers/mtd/nand/lpc32xx_mlc.c:561:24: error: bad constant
> expression [sparse]

This is because sparse doesn't understand this local variable:

uint8_t buf[mtd->writesize];

(but gcc does).

Are you sure we need to support sparse?

The above construction is quite convenient for this case and I'd
prefer this to allocating another buffer dynamically.

Thanks in advance,

Roland
