From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] mtd: onenand/samsung: Add device tree support
Date: Mon, 29 Apr 2019 10:19:28 +0200
Message-ID: <20190429101928.265998b5@xps13>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kyungmin.park@samsung.com, bbrezillon@kernel.org, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paweł,

Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote on Fri, 26 Apr 2019
18:42:19 +0200:

> This patchset adds device tree support to Samsung OneNAND driver.
> It was tested on Samsung Galaxy S and Samsung Galaxy S Fascinate 4G,
> an Samsung S5PV210 based mobile phones.
> 
> Tomasz Figa (5):
>   mtd: onenand/samsung: Unify resource order for controller variants
>   mtd: onenand/samsung: Make sure that bus clock is enabled
>   mtd: onenand/samsung: Add device tree support
>   dt-binding: mtd: onenand/samsung: Add device tree support
>   mtd: onenand/samsung: Set name field of mtd_info struct
> 
>  .../bindings/mtd/samsung-onenand.txt          | 46 +++++++++
>  drivers/mtd/nand/onenand/samsung.c            | 94 +++++++++++++------
>  2 files changed, 113 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt
> 

I think you should use "mtd: onenand: samsung:" as prefix.

Thanks,
Miquèl
