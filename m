From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 0/3] spi-nor: Add Octal SPI support
Date: Wed, 3 Oct 2018 21:20:17 +0200
Message-ID: <20181003212017.653e739f@bbrezillon>
References: <20181003165603.2579-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003165603.2579-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
List-Id: devicetree@vger.kernel.org

On Wed, 3 Oct 2018 22:26:00 +0530
Vignesh R <vigneshr@ti.com> wrote:

> This series adds support for octal mode of mt35x flash. Also, adds
> support for OSPI version of Cadence QSPI controller.
> 
> Based on top of patches adding basic support for mt35xu512aba here:
> https://patchwork.ozlabs.org/cover/971437/
> 
> Vignesh R (3):
>   mtd: spi-nor: Add Octal mode support for mt35xu512aba
>   dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
>   mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

The patchset looks good to me, I'll just wait the next release cycle
before applying it, since I'd prefer to have it stay a bit longer in
-next. This should leave enough time to let other people review this
stuff.

> 
>  .../devicetree/bindings/mtd/cadence-quadspi.txt       |  1 +
>  drivers/mtd/spi-nor/cadence-quadspi.c                 |  9 +++++++++

On a slightly different topic, do you plan to convert the Cadence
driver to spi-mem? And if you don't, is it because you don't have time
or because some features are missing in spi-mem (I remember you
mentioned a few things back when you were reviewing the spi-mem series)?

>  drivers/mtd/spi-nor/spi-nor.c                         | 11 ++++++++++-
>  include/linux/mtd/spi-nor.h                           |  2 ++
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 
