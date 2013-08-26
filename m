From: yuhang wang <wangyuhang2014@gmail.com>
Subject: Re: [PATCH 1/2] spi: dual and quad support(device tree)
Date: Mon, 26 Aug 2013 21:23:47 +0800
Message-ID: <CAHSAbzNg-pZi0dV70zjYiXonhv-G8H0RgaQXXCdzQRQY_cACGw@mail.gmail.com>
References: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FA914@DBDE04.ent.ti.com>
 <CAHSAbzPBTAs=A4SMMojNFG969hukaf=+iAv0xLoQ13Mo0W=J+g@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FAA82@DBDE04.ent.ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FAACE@DBDE04.ent.ti.com>
 <CAHSAbzNAbq_FxK886zfFLtYpshgdHsTiKWGESMpKH2T3boBEmg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FABB9@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9FABB9@DBDE04.ent.ti.com>
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
>>
>> Hi, Pekon
>>
>> 2013/8/26 Gupta, Pekon <pekon@ti.com>:
>> >>
>> >> > Hi, Pekon
>> >> >
>> >> > 2013/8/26 Gupta, Pekon <pekon@ti.com>:
>> >> > >>
>> >> > >> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
>> >> > >> ---
>> >> > >>  Documentation/devicetree/bindings/spi/spi-bus.txt |   14
>> >> > ++++++++++++++
>> >> > >>  1 file changed, 14 insertions(+)
>> >> > >>
>> >> > >> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> > >> b/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> > >> index 296015e..145ba96 100644
>> >> > >> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> > >> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
>> >> > >> @@ -55,6 +55,20 @@ contain the following properties.
>> >> > >>               chip select active high
>> >> > >>  - spi-3wire       - (optional) Empty property indicating device requires
>> >> > >>                   3-wire mode.
>> >> > >> +- spi-tx-nbits    - (optional) Number of bits used for MOSI(writting)
>> >> > >> +- spi-rx-nbits    - (optional) Number of bits used for MISO(reading)
>> >> > >> +
>> >> > >> +So if for example the slave has 4 wires for writting and 2 wires for
>> >> > reading,
>> >> > >> +and the spi-tx/rx-nbits property should be set as follows:
>> >> > >> +
>> >> > >> +spi-tx-nbits = <4>;
>> >> > >> +spi-rx-nbits = <2>;
>> >> > >
>> > [Pekon]: Oh.. Sorry.. I mis-understood your patch here..
>> > So here 'spi-tx-nbits' and 'spi-rx-nbits' specify how many data-channels
>> > are actually connected on board to a spi_device.. correct ?
>> >
>> > And, m25p30 driver will determine what to put in spi_transfer->tx_nbits
>> > based on different flash commands .. Correct ?
>> >
>> Yes, that's it.
>>
>> > In that sense.. its your approach is correct..
>> > But then please use different binding names, something like below..
>> >         s/spi-tx-nbits/spi-tx-max-width
>> >         s/spi-rx-nbits/spi-rx-max-width
>> >
>> > -----------------------------------------------
>> Sorry, what do you mean by using spi-tx/rx-max-width, I did not get it clearly.
>>
> [Pekon]: Just a change in name of binding..
> Like using spi-max-rx-nbits and spi-max-tx-nbits instead.
>
So do you mean that the name in DT should look different from
spi_transfer->tx_nbits/rx_nbits. OK, I will correct it. Thanks.

>> >> > > [Pekon]: there is a problem here...
>> >> > > spi-tx-nbit = <4> suggests that SPI device support QUAD writes, but it
>> >> does
>> >> > > not indicate whether DUAL writes are supported by device or not.
>> >> > > So, In my view having either of the following implementation could
>> help
>> >> > > in specifying capabilities independently and clearly.
>> >> > > *Implementation-1 Boolean*
>> >> > > spi-tx-quad = <true | false>
>> >> > > spi-tx-dual = <true | false>
>> >> > > spi-tx-single = <true | false>
>> >> > > Same way for Rx..
>> >> > > spi-rx-quad = <true | false>
>> >> > > spi-rx-dual = <true | false>
>> >> > > spi-rx-single = <true | false>
>> >> > >
>> >> > > *Implementation-2 Multi-option*
>> >> > > spi-quad = <tx-only | rx-only | duplex>
>> >> > > spi-dual = <tx-only | rx-only | duplex>
>> >> > > spi-single = <tx-only | rx-only | full-duplex | half-duplex>
>> >> > >
>> >> > Not exactly,  spi-tx-nbit = <4> suggests that SPI device will use QUAD
>> >> > writes, not support QUAD writes. There is no need to set what mode
>> >> > slave supports, user just set the certain mode slave will work in.
>> >> >
>> > -----------------------------------------------
>> > My above comment is more for DT binding for spi_master (master DT
>> node)
>> > probed by controller driver, which can have multiple capabilities.
>> >
>> > I think you havn't added anything for that .. neither checks for that..
>> > Do you plan to have a patch for that too ?
>> >
>> >
>> Well, I am still not sure whether to add DT binding for spi_master.
>> Now the multiple capabilities are set directly in probe of spi
>> controller. But I think there is no need to check the capabilities
>> from DT. Because no matter it is in probe or DT, it's all controller
>> driver designers' job.
>> Take a example:
>> 1. I set the property in master node as follows:
>>     spi-tx-support = <single | dual | quad>;
>>     spi-rx-support = <single | dual>;
>> 2. I set the master mode in probe of spi controller driver
>>     master->mode_bits = SPI_TX_DUAL | SPI_TX_QUAD | SPI_RX_DUAL;
>>
>> So do you think that there's any need to check the supported mode in 1
>> and 2? However, using 1 to set 2 seems OK.
>> What do you think of that?
>
> [Pekon]: Yes, (1) should be used to set (2).
> Ok fine.. if some spi_master needs DT, they can add it later..
> But by checking I meant following (same comments as on you V1 patch set)
> -------------------------


>> [Pekon]: Yes, for controller the controller_driver should parse or fill in
>> this info in the spi_master->mode.
>> But, still you need to add check while probing spi_device DT that
>> only common supported compatibilities get into spi_device.
>> Example: if spi_master->mode == SPI_TX_DUAL only
>> and of_spi_device() returns SPI_TX_QUAD, then you should return
>> back with error showing mis-match in controller and device capabilities.
>> So, spi_device capabilites should always be sub-set of spi_master capabilities.
>>
> -------------------------
>
Yes, I have got your comment and added that check in my previous
applied V3 patch. just as below

+ if ((xfer->tx_nbits == SPI_NBITS_DUAL) &&
+ !(spi->mode & (SPI_TX_DUAL | SPI_TX_QUAD)))
+ return -EINVAL;
+ if ((xfer->tx_nbits == SPI_NBITS_QUAD) &&
+ !(spi->mode & SPI_TX_QUAD))
+ return -EINVAL;


>> >> > >> +
>> >> > >> +Now the value that spi-tx-nbits and spi-rx-nbits can receive is only
>> >> > >> +1(single), 2(dual) and 4(quad). If you don't set spi-tx-nbits or spi-rx-
>> >> nbits,
>> >> > >> +spi_device mode will be set in single(1 wire) as default. Another
>> point,
>> >> if
>> >> > >> +property:spi-3wire is set, spi-tx/rx-nbits is forbidden to set to <2 or
>> 4>,
>> >> > >> +otherwise, an errro will return.
>> >> > >>
>> >> > > [Pekon]: Also, instead of having separate binding for 'spi-3wire', it can
>> be
>> >> > > moved under as spi-single = <half-duplex>.
>> >> > > Full-duplex = Tx and Rx operate on independent channels and
>> >> > concurrently.
>> >> > > Half-duplex = Tx and Rx use same bi-directional channel for
>> transmission
>> >> > >         one by one
>> >> > >
>> >> > Actually, spi-3wire can be regarded as a part of spi-single, but
>> >> > corrected as what you said, there will be some inconvenient.
>> >> > 1,the driver that has already used spi-3wire need a big change.
>> >> > 2,there have to be a complexed check in spi framework if set like:
>> >> >  spi-quad = <tx-only | rx-only | duplex>
>> >> >  spi-dual = <tx-only | rx-only | duplex>
>> >> >  spi-single = <tx-only | rx-only | full-duplex | half-duplex>
>> >> >
>> >> [Pekon]: No, I'm not asking you to update logic in all drivers,
>> >> just the DT bindings. Something like this..
>> >> @@ -872,46 +872,42 @@ static void of_register_spi_devices(struct
>> >> spi_master *master)
>> >>               /* Device DUAL/QUAD mode */
>> >>               prop = of_get_property(nc, "spi-single", &len);
>> >>               if (prop == HALF_DUPLEX)
>> >>                       spi->mode |= SPI_3WIRE;
>> >>
>> >> So, you set the same spi->mode[SPI_3WIRE] bit, thus other drivers are
>> not
>> >> impacted. And you can deprecate the older "spi-3wire" binding.
>> >>
>> >> with regards, pekon
>> >>
>> >> > >>  If a gpio chipselect is used for the SPI slave the gpio number will be
>> >> > passed
>> >> > >>  via the cs_gpio
>> >> > >> --
>> >> > >> 1.7.9.5
>> >> > >
>
> with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
