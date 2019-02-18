From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 08/10] mtd: rawnand: denali: decouple controller and
 NAND chips
Date: Mon, 18 Feb 2019 14:01:19 -0600
Message-ID: <20190218200119.GA27213@bogus>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-9-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549955582-30346-9-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 04:13:00PM +0900, Masahiro Yamada wrote:
> Currently, this driver sticks to the legacy NAND model because it was
> upstreamed before commit 2d472aba15ff ("mtd: nand: document the NAND
> controller/NAND chip DT representation"). However, relying on the
> dummy_controller is already deprecated.
> 
> Switch over to the new controller/chip representation.
> 
> The struct denali_nand_info has been split into denali_controller
> and denali_chip, to contain the controller data, per-chip data,
> respectively.
> 
> One problem is, this commit changes the DT binding. So, as always,
> the backward compatibility must be taken into consideration.
> 
> In the new binding, the controller node expects
> 
>   #address-cells = <1>;
>   #size-cells = <0>;
> 
> ... since the child nodes represent NAND chips.
> 
> In the old binding, the controller node may have subnodes, but they
> are MTD partitions.
> 
> The denali_dt_is_legacy_binding() exploits it to distinguish old/new
> platforms.
> 
> Going forward, the old binding is only allowed for existing DT files.
> I updated the binding document.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  39 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/denali.c                      | 453 ++++++++++++---------
>  drivers/mtd/nand/raw/denali.h                      | 117 +++++-
>  drivers/mtd/nand/raw/denali_dt.c                   |  98 ++++-
>  drivers/mtd/nand/raw/denali_pci.c                  |  30 +-
>  5 files changed, 500 insertions(+), 237 deletions(-)
