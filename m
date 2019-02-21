From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [EXT] [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support
 for Octal SPI controller
Date: Thu, 21 Feb 2019 11:50:01 +0100
Message-ID: <20190221115001.09008681@kernel.org>
References: <20190212083809.6534-1-vigneshr@ti.com>
        <20190212083809.6534-3-vigneshr@ti.com>
        <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Vignesh R <vigneshr@ti.com>, "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Feb 2019 10:41:33 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Vignesh
> 
> >
> >Cadence OSPI controller IP supports Octal IO (x8 IO lines), It also has an
> >integrated PHY. IP register layout is very similar to existing QSPI IP except for
> >additional bits to support Octal and Octal DDR mode. Therefore, extend
> >current driver to support Octal mode. Only Octal SDR read (1-1-8)mode is
> >supported for now.  
> 
> Does this your Cadence OSPI controller support 8-8-8 IO mode, if yes,
> Why not directly enable 8-8-8 mode? 
> 

Mode 8-8-8 is anyway not supported by the core (see [1] if you need
more details).

[1]https://patchwork.kernel.org/cover/10638055/
