From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Sat, 9 Jan 2016 09:42:49 -0600
Message-ID: <20160109154249.GA28102@rob-hp-laptop>
References: <1452216405-10826-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452216405-10826-1-git-send-email-xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 09:26:45AM +0800, Jiancheng Xue wrote:
> add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---

Next time, please include changes in v2 here.

>  .../devicetree/bindings/spi/spi-hisi-sfc.txt       |  24 +
>  drivers/mtd/spi-nor/Kconfig                        |   6 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 498 +++++++++++++++++++++
>  4 files changed, 529 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> new file mode 100644
> index 0000000..a0d1e04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> @@ -0,0 +1,24 @@
> +HiSilicon SPI-NOR Flash Controller
> +
> +Required properties:
> +- compatible : Should be "hisilicon,hisi-sfc".

I missed this last time, but you also need a more specific compatible 
string with the SOC name in it.

> +- address-cells : number of cells required to define a chip select
> +        address on the SPI bus. Should be set to 1. See spi-bus.txt.
> +- size-cells : Should be 0.
> +- reg : Offset and length of the register set for the controller device.
> +- reg-names : Must include the following two entries: "control", "memory".
> +- clocks : handle to spi-nor flash controller clock.
> +
> +Example:
> +spi-nor-controller@10000000 {
> +	compatible = "hisilicon,hisi-sfc";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clock HI3519_FMC_CLK>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
