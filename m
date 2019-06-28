From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v8 0/5] MTD: Add Initial Hyperbus support
Date: Fri, 28 Jun 2019 20:05:43 +0530
Message-ID: <89b4b00a-0564-2b69-4324-d2554f69e9bf@ti.com>
References: <20190625075746.10439-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625075746.10439-1-vigneshr@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tokunori Ikegami <ikegami.t@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 25-Jun-19 1:27 PM, Vignesh Raghavendra wrote:
[...]
> Vignesh Raghavendra (5):
>   mtd: cfi_cmdset_0002: Add support for polling status register
>   dt-bindings: mtd: Add binding documentation for HyperFlash
>   mtd: Add support for HyperBus memory devices
>   dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>     controller
>   mtd: hyperbus: Add driver for TI's HyperBus memory controller
> 


Fixed comments on patch 3/5 locally and series applied to
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
branch mtd/next.

Regards
Vignesh

>  .../bindings/mtd/cypress,hyperflash.txt       |  13 ++
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt |  51 ++++++
>  MAINTAINERS                                   |   8 +
>  drivers/mtd/Kconfig                           |   2 +
>  drivers/mtd/Makefile                          |   1 +
>  drivers/mtd/chips/cfi_cmdset_0002.c           | 130 +++++++++++++--
>  drivers/mtd/hyperbus/Kconfig                  |  23 +++
>  drivers/mtd/hyperbus/Makefile                 |   4 +
>  drivers/mtd/hyperbus/hbmc-am654.c             | 141 ++++++++++++++++
>  drivers/mtd/hyperbus/hyperbus-core.c          | 154 ++++++++++++++++++
>  include/linux/mtd/cfi.h                       |   7 +
>  include/linux/mtd/hyperbus.h                  |  86 ++++++++++
>  12 files changed, 603 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  create mode 100644 drivers/mtd/hyperbus/Kconfig
>  create mode 100644 drivers/mtd/hyperbus/Makefile
>  create mode 100644 drivers/mtd/hyperbus/hbmc-am654.c
>  create mode 100644 drivers/mtd/hyperbus/hyperbus-core.c
>  create mode 100644 include/linux/mtd/hyperbus.h
> 
