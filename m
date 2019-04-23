From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 0/5] MTD: Add Initial Hyperbus support
Date: Tue, 23 Apr 2019 11:42:56 +0530
Message-ID: <7e5515f8-340c-bd63-2897-90e0d42cf264@ti.com>
References: <20190423060638.18197-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423060638.18197-1-vigneshr@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23/04/19 11:36 AM, Vignesh Raghavendra wrote:
> 
> 
> Vignesh Raghavendra (5):
>   mtd: cfi_cmdset_0002: Add support for polling status register
>   dt-bindings: mtd: Add binding documentation for HyperFlash
>   mtd: Add support for HyperBus memory devices
>   dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>     controller
>   mtd: hyperbus: Add driver for TI's HyperBus memory controller

Please ignore this series. Ended up sending from stale patch output
directory. Sorry for the noise.

> 
>  .../bindings/mtd/cypress,hyperflash.txt       |   6 +
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt |  31 +++
>  MAINTAINERS                                   |   8 +
>  drivers/mtd/Kconfig                           |   2 +
>  drivers/mtd/Makefile                          |   1 +
>  drivers/mtd/chips/cfi_cmdset_0002.c           |  90 ++++++++
>  drivers/mtd/hyperbus/Kconfig                  |  23 +++
>  drivers/mtd/hyperbus/Makefile                 |   4 +
>  drivers/mtd/hyperbus/hbmc-am654.c             | 115 +++++++++++
>  drivers/mtd/hyperbus/hyperbus-core.c          | 192 ++++++++++++++++++
>  include/linux/mtd/cfi.h                       |   5 +
>  include/linux/mtd/hyperbus.h                  |  91 +++++++++
>  12 files changed, 568 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  create mode 100644 drivers/mtd/hyperbus/Kconfig
>  create mode 100644 drivers/mtd/hyperbus/Makefile
>  create mode 100644 drivers/mtd/hyperbus/hbmc-am654.c
>  create mode 100644 drivers/mtd/hyperbus/hyperbus-core.c
>  create mode 100644 include/linux/mtd/hyperbus.h
> 

-- 
Regards
Vignesh
