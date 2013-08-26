From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [PATCH 1/2] spi: dual and quad support(device tree)
Date: Mon, 26 Aug 2013 06:59:12 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9FA914@DBDE04.ent.ti.com>
References: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: wangyuhang <wangyuhang2014@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> 
> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-bus.txt |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt
> b/Documentation/devicetree/bindings/spi/spi-bus.txt
> index 296015e..145ba96 100644
> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
> @@ -55,6 +55,20 @@ contain the following properties.
>      		chip select active high
>  - spi-3wire       - (optional) Empty property indicating device requires
>      		    3-wire mode.
> +- spi-tx-nbits    - (optional) Number of bits used for MOSI(writting)
> +- spi-rx-nbits    - (optional) Number of bits used for MISO(reading)
> +
> +So if for example the slave has 4 wires for writting and 2 wires for reading,
> +and the spi-tx/rx-nbits property should be set as follows:
> +
> +spi-tx-nbits = <4>;
> +spi-rx-nbits = <2>;

[Pekon]: there is a problem here...
spi-tx-nbit = <4> suggests that SPI device support QUAD writes, but it does
not indicate whether DUAL writes are supported by device or not.
So, In my view having either of the following implementation could help
in specifying capabilities independently and clearly.
*Implementation-1 Boolean*
spi-tx-quad = <true | false>
spi-tx-dual = <true | false>
spi-tx-single = <true | false>
Same way for Rx..
spi-rx-quad = <true | false>
spi-rx-dual = <true | false>
spi-rx-single = <true | false>

*Implementation-2 Multi-option*
spi-quad = <tx-only | rx-only | duplex>
spi-dual = <tx-only | rx-only | duplex>
spi-single = <tx-only | rx-only | full-duplex | half-duplex>

> +
> +Now the value that spi-tx-nbits and spi-rx-nbits can receive is only
> +1(single), 2(dual) and 4(quad). If you don't set spi-tx-nbits or spi-rx-nbits,
> +spi_device mode will be set in single(1 wire) as default. Another point, if
> +property:spi-3wire is set, spi-tx/rx-nbits is forbidden to set to <2 or 4>,
> +otherwise, an errro will return.
> 
[Pekon]: Also, instead of having separate binding for 'spi-3wire', it can be
moved under as spi-single = <half-duplex>.
Full-duplex = Tx and Rx operate on independent channels and concurrently.
Half-duplex = Tx and Rx use same bi-directional channel for transmission
	one by one

>  If a gpio chipselect is used for the SPI slave the gpio number will be passed
>  via the cs_gpio
> --
> 1.7.9.5

with regards, pekon
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
