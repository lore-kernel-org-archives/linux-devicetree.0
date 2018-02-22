From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 5/6] arm: dts: pxa: use reworked NAND controller driver
Date: Thu, 22 Feb 2018 10:46:18 +0100
Message-ID: <20180222104618.1ff78b52@bbrezillon>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-6-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180219223557.2458-6-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Richard Weinberger <richard@nod.at>, Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Nadav Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>, linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>, linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Gregory Clement <gregory.clement@bootlin.com>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

+Arnd and the LAKML

Hi Miquel,

Please try to Cc the LAKML and the arm-soc maintainers when you send DT
changes.

Arnd, Robert, I'd like to apply this patch through the MTD tree since
it depends on patch 1 of this series ("mtd: nand: use Marvell reworked
NAND controller driver with all platforms").
Otherwise, I can leave it to Robert for 4.18.

Let me know what you prefer.

Thanks,

Boris

On Mon, 19 Feb 2018 23:35:56 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Use the new bindings of the reworked Marvell NAND controller driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm/boot/dts/pxa3xx.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
> index 55c75b67351c..982d1a62661d 100644
> --- a/arch/arm/boot/dts/pxa3xx.dtsi
> +++ b/arch/arm/boot/dts/pxa3xx.dtsi
> @@ -117,15 +117,15 @@
>  			status = "disabled";
>  		};
>  
> -		nand0: nand@43100000 {
> -			compatible = "marvell,pxa3xx-nand";
> +		nand_controller: nand-controller@43100000 {
> +			compatible = "marvell,pxa3xx-nand-controller";
>  			reg = <0x43100000 90>;
>  			interrupts = <45>;
>  			clocks = <&clks CLK_NAND>;
>  			dmas = <&pdma 97 3>;
>  			dma-names = "data";
>  			#address-cells = <1>;
> -			#size-cells = <1>;	
> +			#size-cells = <0>;
>  			status = "disabled";
>  		};
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
