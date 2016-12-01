From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 37/39] mtd: nand: denali: support "nand-ecc-strength" DT
 property
Date: Thu, 1 Dec 2016 09:59:27 -0600
Message-ID: <20161201155927.izgkiuniv5h6mu7h@rob-hp-laptop>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-38-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1480183585-592-38-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 27, 2016 at 03:06:23AM +0900, Masahiro Yamada wrote:
> Historically, this driver tried to choose as big ECC strength as
> possible, but it would be reasonable to allow DT to set a particular
> ECC strength with "nand-ecc-strength" property.
> 
> Going forward, DT platforms should specify "nand-ecc-strength" or
> "nand-ecc-maximize" to show the ECC strength strategy explicitly.
> 
> If nothing is specified in DT, "nand-ecc-maximize" is implied since
> this was the original behavior.  It applies to PCI platforms too.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++++

I'd prefer all the DT changes be in 1 patch, but

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/denali.c                          | 27 +++++++++++++++++++++-
>  drivers/mtd/nand/denali_pci.c                      |  2 ++
>  3 files changed, 33 insertions(+), 1 deletion(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
