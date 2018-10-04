From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Add Octal mode support for
 mt35xu512aba
Date: Thu, 4 Oct 2018 09:39:25 +0200
Message-ID: <20181004093925.2961d881@bbrezillon>
References: <20181003165603.2579-1-vigneshr@ti.com>
        <20181003165603.2579-2-vigneshr@ti.com>
        <VI1PR04MB1038C20CA97E453FC4C9CEAE99EA0@VI1PR04MB1038.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB1038C20CA97E453FC4C9CEAE99EA0@VI1PR04MB1038.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Vignesh R <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "juliensu@mxic.com.tw" <juliensu@mxic.com.tw>, "zhengxunli@mxic.com.tw" <zhengxunli@mxic.com.tw>, "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>
List-Id: devicetree@vger.kernel.org

+Julien, Zhengxunli and Mason from Macronix

Hi Yogesh,

On Thu, 4 Oct 2018 06:51:41 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Vignesh,
> 
> > -----Original Message-----
> > From: Vignesh R [mailto:vigneshr@ti.com]
> > Sent: Wednesday, October 3, 2018 10:26 PM
> > To: Boris Brezillon <boris.brezillon@bootlin.com>; Marek Vasut
> > <marek.vasut@gmail.com>; Rob Herring <robh+dt@kernel.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>; Yogesh Narayan Gaur
> > <yogeshnarayan.gaur@nxp.com>; Linux ARM Mailing List <linux-arm-  
> > kernel@lists.infradead.org>; linux-mtd@lists.infradead.org;  
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Vignesh R
> > <vigneshr@ti.com>
> > Subject: [PATCH 1/3] mtd: spi-nor: Add Octal mode support for mt35xu512aba
> > 
> > Micron's mt35xu512aba flash is an Octal flash that has x8 IO lines. It supports
> > read/write over 8 IO lines simulatenously. Add support for Octal read mode for
> > Micron mt35xu512aba.
> > Unfortunately, this flash is only complaint to SFDP JESD216B and does not seem
> > to support newer JESD216C standard that provides auto detection of Octal
> > mode capabilities and opcodes. Therefore, this capability is manually added
> > using new SPI_NOR_OCTAL_READ flag.
> >   
> 
> Thanks for sending the patch-set of adding octal support.
> If possible, can you share the MT35x datasheet?
> 
> I also have the patch ready in which I have added support for Read (1-1-8 and 1-8-8) protocol and Write (1-1-8 and 1-8-8).
> Also have added support of Octal in driver/spi/spi.c framework.
> 
> IMO, we would collaborate our patches.

Looks like we are of stepping on each others toes here (see this branch
[1]). I guess it's not a problem if we agree on who is working on what.

Yogesh, you already sent "spi: add flags for octal I/O data
transfer" [3] which is only adding the new OCTAL flags but is not
patching spi.c and spi-mem.c to take those new flags into account. Here
is my version of this patch [2] (it's still missing an update of
SPI_MEM_MAX_BUSWIDTH). Let me know what you want to do (rework your
version to address the problem or take mine).

Regarding other patches in [2], they're mainly here to add support for
X-X-X and DTR modes and get the m25p80 logic integrated in spi-nor.c so
that we can really check which NOR operations are supported by the SPI
controller.

Regards,

Boris

[1]https://github.com/bbrezillon/linux/commits/spi-nor/octo
[2]https://github.com/bbrezillon/linux/commit/9854a8fdd23f64e79859fd07a71d4a1c57b812f2
[3]https://patchwork.ozlabs.org/patch/894916/
