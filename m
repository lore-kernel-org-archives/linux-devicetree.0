From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [PATCH 2/2] spi: dual and quad support(device tree)
Date: Tue, 27 Aug 2013 06:31:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9FAF78@DBDE04.ent.ti.com>
References: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
 <1377496080-14356-2-git-send-email-wangyuhang2014@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FA932@DBDE04.ent.ti.com>
 <CAHSAbzN9GFX++gkZwxny4qpRPpEkPgjqAPJBNU+h+SNymNdGFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAHSAbzN9GFX++gkZwxny4qpRPpEkPgjqAPJBNU+h+SNymNdGFA@mail.gmail.com>
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
To: yuhang wang <wangyuhang2014@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> 
> Hi, Pekon
> 
> 2013/8/26 Gupta, Pekon <pekon@ti.com>:
> >>
> >> fix one thing in patch:
> >> commit id:f477b7fb13df2b843997559ff34e87d054ba6538
> >>
> >> change property spi-tx-nbits and spi-rx-nbits to optional.
> >> If User don't set spi-tx-nbits or spi-rx-nbits, spi device mode
> >> should be regarded as SINGLE, not return an error.
> >>
> >> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
> >> ---
> >>  drivers/spi/spi.c |   68 +++++++++++++++++++++++++----------------------
> ----
> >> --
> >>  1 file changed, 32 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> >> index 50f7fc3..46a55f0 100644
> >> --- a/drivers/spi/spi.c
> >> +++ b/drivers/spi/spi.c
> >> @@ -872,46 +872,42 @@ static void of_register_spi_devices(struct
> >> spi_master *master)
> >>               /* Device DUAL/QUAD mode */
> >>               prop = of_get_property(nc, "spi-tx-nbits", &len);
> >>               if (!prop || len < sizeof(*prop)) {
> >> -                     dev_err(&master->dev, "%s has no 'spi-tx-nbits'
> >> property\n",
> >> -                             nc->full_name);
> >> -                     spi_dev_put(spi);
> >> -                     continue;
> >> -             }
> >> -             switch (be32_to_cpup(prop)) {
> >> -             case SPI_NBITS_SINGLE:
> >> -                     break;
> >> -             case SPI_NBITS_DUAL:
> >> -                     spi->mode |= SPI_TX_DUAL;
> >> -                     break;
> >> -             case SPI_NBITS_QUAD:
> >> -                     spi->mode |= SPI_TX_QUAD;
> >> -                     break;
> >> -             default:
> >> -                     dev_err(&master->dev, "spi-tx-nbits value is not
> >> supported\n");
> >> -                     spi_dev_put(spi);
> >> -                     continue;
> >> +                     /* set tx mode in SINGLE as default */
> > [Pekon]: I think you should explicitly set, and not trust spi->mode defaults.
> >         spi->mode |= SPI_TX_SINGLE;
> >
> Now @spi_device->mode [bit8: SPI_TX_DUAL] [bit9: SPI_TX_QUAD] [bit10:
> SPI_RX_DUAL] [bit11: SPI_RX_QUAD]. Because to every spi controller,
> SPI SINGLE must be supported, so I did not add that as a mode. My
> initial thought is if user don't select SPI_TX_DUAL and SPI_TX_QUAD,
> then it is TX_SINGLE mode[bit8: 0 bit9: 0].
> Now 2 approaches as follows:
> 1) #define SPI_TX_SINGLE ~(SPI_TX_DUAL | SPI_TX_QUAD)
>     case SPI_NBITS_SINGLE:
>             spi->mode & SPI_TX_SINGLE;
>             break;
> 2)Adding a new bit in mode to specify SPI_SINGLE. But this bit also
> should be reflected to @master->mode_bits. To the probe of each spi
> controller driver, it is necessary to do "master->mode_bits |=
> SPI_TX_SINGLE | SPI_RX_SINGLE;", in such case, it's not like a
> selected mode, it's like a compulsary condition. Since all controller
> do support, there's no need to make it a mode.
> 
> So I prefer the previous correction, what's your idea.
> 
[Pekon]: Ok makes sense.. (1) is preferred, as it is compatible to existing layout

with regards, pekon
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
