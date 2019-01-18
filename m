From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 6/8] mtd: rawnand: jz4780-bch: Don't set clock rate in
 driver
Date: Fri, 18 Jan 2019 09:31:16 +0100
Message-ID: <20190118093116.5f62efa5@bbrezillon>
References: <20190118010634.27399-1-paul@crapouillou.net>
        <20190118010634.27399-6-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118010634.27399-6-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 17 Jan 2019 22:06:32 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> This should be done in devicetree. Besides, it prevents us from
> supporting other SoCs which don't use the same clock frequency for the
> BCH hardware.

As I said earlier, I disagree with this statement, plus, you're
breaking backward compat with existing DTs when doing that.

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/mtd/nand/raw/jz4780_bch.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
> index 7e4e5e627603..161d3821e1c4 100644
> --- a/drivers/mtd/nand/raw/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/jz4780_bch.c
> @@ -57,8 +57,6 @@
>  #define BCH_BHINT_UNCOR			BIT(1)
>  #define BCH_BHINT_ERR			BIT(0)
>  
> -#define BCH_CLK_RATE			(200 * 1000 * 1000)
> -
>  /* Timeout for BCH calculation/correction. */
>  #define BCH_TIMEOUT_US			100000
>  
> @@ -348,8 +346,6 @@ static int jz4780_bch_probe(struct platform_device *pdev)
>  		return PTR_ERR(bch->clk);
>  	}
>  
> -	clk_set_rate(bch->clk, BCH_CLK_RATE);
> -
>  	mutex_init(&bch->lock);
>  
>  	bch->dev = dev;
