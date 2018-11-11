From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v6 8/9] EDAC: Add driver for the Marvell Armada XP SDRAM
 and L2 cache ECC
Date: Sun, 11 Nov 2018 20:40:24 +0100
Message-ID: <20181111194024.GC31937@zn.tnic>
References: <20181109070349.20464-1-chris.packham@alliedtelesis.co.nz>
 <20181109070349.20464-9-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181109070349.20464-9-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux@armlinux.org.uk, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 09, 2018 at 08:03:48PM +1300, Chris Packham wrote:
> From: Jan Luebbe <jlu@pengutronix.de>
> 
> Add support for the ECC functionality as found in the DDR RAM and L2
> cache controllers on the MV78230/MV78x60 SoCs. This driver has been
> tested on the MV78460 (on a custom board with a DDR3 ECC DIMM).
> 
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> [cp use SPDX license]
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  MAINTAINERS                   |   6 +
>  drivers/edac/Kconfig          |   7 +
>  drivers/edac/Makefile         |   1 +
>  drivers/edac/armada_xp_edac.c | 630 ++++++++++++++++++++++++++++++++++
>  4 files changed, 644 insertions(+)
>  create mode 100644 drivers/edac/armada_xp_edac.c

Looks ok at a glance. Those overly long lines could use some macros or
breaking but it is not a big deal:

Reviewed-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
