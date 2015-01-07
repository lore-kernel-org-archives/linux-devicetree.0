From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Wed, 07 Jan 2015 10:17:44 -0300
Message-ID: <54AD31F8.4050100@vanguardiasur.com.ar>
References: <1420564094-1086-1-git-send-email-grmoore@opensource.altera.com> <1420564094-1086-2-git-send-email-grmoore@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420564094-1086-2-git-send-email-grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(CCing DT mailing list and DT binding maintainers)

On 01/06/2015 02:08 PM, Graham Moore wrote:
> Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/cadence_quadspi.txt    |   50 ++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> new file mode 100644
> index 0000000..3a8ea1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> @@ -0,0 +1,50 @@
> +* Cadence Quad SPI controller
> +
> +Required properties:
> +- compatible : Should be "cdns,qspi-nor".
> +- reg : Contains two entries, each of which is a tuple consisting of a
> +	physical address and length.  The first entry is the address and
> +	length of the controller register set.  The second entry is the
> +	address and length of the QSPI Controller data area.
> +- interrupts : Unit interrupt specifier for the controller interrupt.
> +- clocks : phandle to the Quad SPI clock.
> +- ext-decoder : Value of 0 means no external chipselect decoder is
> +	connected, 1 means there is an external chipselect decoder connected.

As I already said in the driver patch, I think this property should be
boolean and have a vendor prefix.

> +- fifo-depth : Size of the data FIFO in words.

This one looks generic enough to leave it as it is, without any vendor
prefix.

> +- bus-num : Number of the SPI bus to which the controller is connected.
> +

I think you forgot to remove bus-num here.

> +Optional subnodes:
> +Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
> +custom properties:
> +- cdns,page-size : Size, in bytes, of the device's write page
> +- cdns,block-size : Size of the device's erase block
> +- cdns,read-delay : Selay for read capture logic, in clock cycles
> +- cdns,tshsl-ns : Delay in master reference clocks for the length that the master mode chip select outputs are de-asserted between transactions.
> +- cdns,tsd2d-ns : Delay in master reference clocks between one chip select being de-activated and the activation of another.
> +- cdns,tchsh-ns : Delay in master reference clocks between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
> +- cdns,tslch-ns : Delay in master reference clocks between setting qspi_n_ss_out low and first bit transfer.
> +
> +Example:
> +
> +	qspi: spi@ff705000 {
> +		compatible = "cdns,qspi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0xff705000 0x1000>,
> +			<0xffa00000 0x1000>;
> +		interrupts = <0 151 4>;
> +		clocks = <&qspi_clk>;
> +		ext-decoder = <0>;
> +		fifo-depth = <128>;
> +
> +		flash0: n25q00@0 {
> +			...
> +			cdns,page-size = <256>;
> +			cdns,block-size = <16>;
> +			cdns,read-delay = <4>;
> +			cdns,tshsl-ns = <50>;
> +			cdns,tsd2d-ns = <50>;
> +			cdns,tchsh-ns = <4>;
> +			cdns,tslch-ns = <4>;
> +		}
> +	}
> 

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
