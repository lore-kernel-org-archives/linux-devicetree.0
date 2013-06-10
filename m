From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] i2c: designware: add two optional property
 tx/rx-fifo-size
Date: Mon, 10 Jun 2013 21:49:55 +0300
Message-ID: <20130610184954.GK4312@tarshish>
References: <1370840576-15651-1-git-send-email-zhangfei.gao@linaro.org>
 <1370840576-15651-3-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370840576-15651-3-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Zhangfei Gao,

On Mon, Jun 10, 2013 at 01:02:55PM +0800, Zhangfei Gao wrote:
> rx-fifo-size and tx-fifo-size will be updated if provided from dts
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  .../devicetree/bindings/i2c/i2c-designware.txt     |    7 +++++++
>  drivers/i2c/busses/i2c-designware-platdrv.c        |    3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> index e42a2ee..61fdb44 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> @@ -6,6 +6,11 @@ Required properties :
>   - reg : Offset and length of the register set for the device
>   - interrupts : <IRQ> where IRQ is the interrupt number.
>  
> +Optional properties:
> +
> + - rx-fifo-size : 1 cell, Rx fifo threshold

I'd use the word 'size' instead of 'threshold' here. The term 'threshold' is 
used for something else in the datasheet.

baruch

> + - tx-fifo-size : 1 cell, Tx fifo threshold
> +
>  Recommended properties :
>  
>   - clock-frequency : desired I2C bus clock frequency in Hz.
> @@ -18,5 +23,7 @@ Example :
>  		compatible = "snps,designware-i2c";
>  		reg = <0xf0000 0x1000>;
>  		interrupts = <11>;
> +		rx-fifo-size = <16>;
> +		tx-fifo-size = <16>;
>  		clock-frequency = <400000>;
>  	};
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 41659c0..6760cea 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -85,6 +85,7 @@ static int dw_i2c_probe(struct platform_device *pdev)
>  	struct dw_i2c_dev *dev;
>  	struct i2c_adapter *adap;
>  	struct resource *mem;
> +	struct device_node *np = pdev->dev.of_node;
>  	int irq, r;
>  
>  	/* NOTE: driver uses the static register mapping */
> @@ -140,6 +141,8 @@ static int dw_i2c_probe(struct platform_device *pdev)
>  		dev->rx_fifo_depth = ((param1 >> 8)  & 0xff) + 1;
>  		dev->adapter.nr = pdev->id;
>  	}
> +	of_property_read_u32(np, "rx-fifo-size", &dev->rx_fifo_depth);
> +	of_property_read_u32(np, "tx-fifo-size", &dev->tx_fifo_depth);
>  	r = i2c_dw_init(dev);
>  	if (r)
>  		return r;
> -- 
> 1.7.9.5
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
