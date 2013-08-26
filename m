From: yuhang wang <wangyuhang2014@gmail.com>
Subject: Re: [PATCH 1/2] spi: dual and quad support(device tree)
Date: Mon, 26 Aug 2013 19:13:07 +0800
Message-ID: <CAHSAbzPh9H=Yz5J8UykLqx==k1RaHB7UVuZ23c7pQ0W9MUwXng@mail.gmail.com>
References: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FA914@DBDE04.ent.ti.com>
 <CAHSAbzPBTAs=A4SMMojNFG969hukaf=+iAv0xLoQ13Mo0W=J+g@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FAA82@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9FAA82@DBDE04.ent.ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "Gupta, Pekon" <pekon@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Pekon

2013/8/26 Gupta, Pekon <pekon@ti.com>:
>> Hi, Pekon
>>
>> 2013/8/26 Gupta, Pekon <pekon@ti.com>:
>> >>
>> >> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
>> >> ---
>> >>  Documentation/devicetree/bindings/spi/spi-bus.txt |   14
>> ++++++++++++++
>> >>  1 file changed, 14 insertions(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> b/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> index 296015e..145ba96 100644
>> >> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> @@ -55,6 +55,20 @@ contain the following properties.
>> >>               chip select active high
>> >>  - spi-3wire       - (optional) Empty property indicating device requires
>> >>                   3-wire mode.
>> >> +- spi-tx-nbits    - (optional) Number of bits used for MOSI(writting)
>> >> +- spi-rx-nbits    - (optional) Number of bits used for MISO(reading)
>> >> +
>> >> +So if for example the slave has 4 wires for writting and 2 wires for
>> reading,
>> >> +and the spi-tx/rx-nbits property should be set as follows:
>> >> +
>> >> +spi-tx-nbits = <4>;
>> >> +spi-rx-nbits = <2>;
>> >
>> > [Pekon]: there is a problem here...
>> > spi-tx-nbit = <4> suggests that SPI device support QUAD writes, but it does
>> > not indicate whether DUAL writes are supported by device or not.
>> > So, In my view having either of the following implementation could help
>> > in specifying capabilities independently and clearly.
>> > *Implementation-1 Boolean*
>> > spi-tx-quad = <true | false>
>> > spi-tx-dual = <true | false>
>> > spi-tx-single = <true | false>
>> > Same way for Rx..
>> > spi-rx-quad = <true | false>
>> > spi-rx-dual = <true | false>
>> > spi-rx-single = <true | false>
>> >
>> > *Implementation-2 Multi-option*
>> > spi-quad = <tx-only | rx-only | duplex>
>> > spi-dual = <tx-only | rx-only | duplex>
>> > spi-single = <tx-only | rx-only | full-duplex | half-duplex>
>> >
>> Not exactly,  spi-tx-nbit = <4> suggests that SPI device will use QUAD
>> writes, not support QUAD writes. There is no need to set what mode
>> slave supports, user just set the certain mode slave will work in.
>>
> [Pekon]: Wait.. I think there is some mis-match in our understandings..
> (a) struct spi_device->mode determines capabilities spi_device can support
> (b) And, when user (here m25p80 like flash driver) puts a spi_transfer, then
> it specifies whether to use spi_transfer->tx_nbits = 4 or not..
> And you are using DT binding to specify (a) correct ?
>
> Now, how would you specify following configuration, using DT ?
>         spi_device->mode = SPI_TX_SINGLE | SPI_TX_QUAD. (but not dual)
> so that driver
> - driver give error,
>         when m25p80 driver uses spi_transfer->tx-nbits = 2
> - But allow,
>         when m25p80 driver uses spi_transfer->tx-nbits = 1 or
>         when m25p80 driver uses spi_transfer->tx-nbits = 4
>
>> >> +
>> >> +Now the value that spi-tx-nbits and spi-rx-nbits can receive is only
>> >> +1(single), 2(dual) and 4(quad). If you don't set spi-tx-nbits or spi-rx-nbits,
>> >> +spi_device mode will be set in single(1 wire) as default. Another point, if
>> >> +property:spi-3wire is set, spi-tx/rx-nbits is forbidden to set to <2 or 4>,
>> >> +otherwise, an errro will return.
>> >>
>> > [Pekon]: Also, instead of having separate binding for 'spi-3wire', it can be
>> > moved under as spi-single = <half-duplex>.
>> > Full-duplex = Tx and Rx operate on independent channels and
>> concurrently.
>> > Half-duplex = Tx and Rx use same bi-directional channel for transmission
>> >         one by one
>> >
>> Actually, spi-3wire can be regarded as a part of spi-single, but
>> corrected as what you said, there will be some inconvenient.
>> 1,the driver that has already used spi-3wire need a big change.
>> 2,there have to be a complexed check in spi framework if set like:
>>  spi-quad = <tx-only | rx-only | duplex>
>>  spi-dual = <tx-only | rx-only | duplex>
>>  spi-single = <tx-only | rx-only | full-duplex | half-duplex>
>>
> [Pekon]: No, I'm not asking you to update logic in all drivers,
> just the DT bindings. Something like this..
> @@ -872,46 +872,42 @@ static void of_register_spi_devices(struct spi_master *master)
>                 /* Device DUAL/QUAD mode */
>                 prop = of_get_property(nc, "spi-single", &len);
>                 if (prop == HALF_DUPLEX)
>                         spi->mode |= SPI_3WIRE;
>
> So, you set the same spi->mode[SPI_3WIRE] bit, thus other drivers are not
> impacted. And you can deprecate the older "spi-3wire" binding.
>

OK, I got it. Logically it is better. But there are some difficulties
in Implementation.
1. The property (spi-quad spi-dual spi-single) should be optional,
user can don't set any of these three properties. Then spi-3wire can
not be specified. Or if you want to set these properties as required,
all the spi slave (at least DT) should be changed.
2. Add property like (spi-quad spi-dual spi-single) will make the
check in spi framework a little complicated.
  example:
  1)if one of these three is duplex, the other can not be set.
  2)there can not be the same value in either of the three.
  3)all three can not be set at the same time.
  .....
If in the future, more wires transfer is supported, you have to add
properties, then the check will be more complex.
So I still need some good aproaches to specify spi-3wire.

> with regards, pekon
>
>> >>  If a gpio chipselect is used for the SPI slave the gpio number will be
>> passed
>> >>  via the cs_gpio
>> >> --
>> >> 1.7.9.5
>> >
>> > with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
