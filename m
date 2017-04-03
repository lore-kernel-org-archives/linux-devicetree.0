From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 16/37] mtd: nand: denali_dt: add compatible strings
 for UniPhier SoC variants
Date: Mon, 3 Apr 2017 10:46:52 -0500
Message-ID: <20170403154652.tzfgy4l2m33pqvzd@rob-hp-laptop>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-17-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1490856383-31560-17-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 03:46:02PM +0900, Masahiro Yamada wrote:
> Add two compatible strings for UniPhier SoCs.
> 
> "socionext,uniphier-denali-nand-v5a" is used on UniPhier sLD3, LD4,
> Pro4, sLD8 SoCs.
> 
> "socionext,uniphier-denali-nand-v5b" is used on UniPhier Pro5, PXs2,
> LD6b, LD11, LD20 SoCs.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
>   - Change the compatible strings
>   - Fix the ecc_strength_capability
>   - Override revision number for the newer one
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  6 ++++++
>  drivers/mtd/nand/denali_dt.c                       | 23 ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)

Acked-by: Rob Herring <robh@kernel.org> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
