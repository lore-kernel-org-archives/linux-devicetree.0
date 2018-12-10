From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 0/3] spi-nor: Add Octal SPI support
Date: Mon, 10 Dec 2018 09:45:44 +0100
Message-ID: <20181210094544.3843e782@bbrezillon>
References: <20181003165603.2579-1-vigneshr@ti.com>
        <0e4286ea-85d1-a909-17c0-47f9506b3e5a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e4286ea-85d1-a909-17c0-47f9506b3e5a@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>
List-Id: devicetree@vger.kernel.org

On Sun, 9 Dec 2018 14:17:18 +0530
Vignesh R <vigneshr@ti.com> wrote:

> Hi Boris,
> 
> On 03/10/18 10:26 PM, Vignesh R wrote:
> > This series adds support for octal mode of mt35x flash. Also, adds
> > support for OSPI version of Cadence QSPI controller.
> > 
> > Based on top of patches adding basic support for mt35xu512aba here:
> > https://patchwork.ozlabs.org/cover/971437/
> > 
> > Vignesh R (3):
> >   mtd: spi-nor: Add Octal mode support for mt35xu512aba  
> 
> 
> >   dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
> >   mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller  
> 
> Could you consider above two patches for v4.21 once [1][2] are merged?
> 
> [1] https://patchwork.ozlabs.org/patch/1006717/
> [2] https://patchwork.ozlabs.org/patch/1006715/

I asked Tudor to have a look at those patches. I'll apply them once I
have his R-b.

> 
> Let me know if this needs to be re-posted.
> 
> > 
> >  .../devicetree/bindings/mtd/cadence-quadspi.txt       |  1 +
> >  drivers/mtd/spi-nor/cadence-quadspi.c                 |  9 +++++++++
> >  drivers/mtd/spi-nor/spi-nor.c                         | 11 ++++++++++-
> >  include/linux/mtd/spi-nor.h                           |  2 ++
> >  4 files changed, 22 insertions(+), 1 deletion(-)
> >   
> 
