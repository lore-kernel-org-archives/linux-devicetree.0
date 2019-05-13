Return-Path: <SRS0=gR28=TN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from secvs01.rockwellcollins.com ([205.175.225.240]:20744 "EHLO
        secvs01.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730696AbfEMOwr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 May 2019 10:52:47 -0400
Received: by mail-io1-f72.google.com with SMTP id s24so10095389iot.0
        for <devicetree@vger.kernel.org>; Mon, 13 May 2019 07:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
 <1556813672-49861-3-git-send-email-adam.michaelis@rockwellcollins.com>
 <20190505154227.1735b1b2@archlinux> <CALMrGWV6rtYQShtm7uBQygtdOpPW30mLnKMxb2Jk8pY68B6yyw@mail.gmail.com>
 <20190511113112.2da6385d@archlinux> <1557741886.29142.3.camel@analog.com>
In-Reply-To: <1557741886.29142.3.camel@analog.com>
From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Date: Mon, 13 May 2019 09:52:33 -0500
Message-ID: <CALMrGWWiNq03DidPQQ38gG81jyYuLDLx_ye_LUz-viHVt1c=+w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 3/6] iio: ad7949: Support configuration read-back
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>
Cc: "jic23@kernel.org" <jic23@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "charles-antoine.couret@essensium.com" <charles-antoine.couret@essensium.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "clayton.shotwell@rockwellcollins.com" <clayton.shotwell@rockwellcollins.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "brandon.maier@rockwellcollins.com" <brandon.maier@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 13, 2019 at 5:04 AM Popa, Stefan Serban
<StefanSerban.Popa@analog.com> wrote:
>
> On Sb, 2019-05-11 at 11:31 +0100, Jonathan Cameron wrote:
> > [External]
> >
> >
> > On Tue, 7 May 2019 14:53:32 -0500
> > Adam Michaelis <adam.michaelis@collins.com> wrote:
> >
> > >
> > > On Sun, May 5, 2019 at 9:42 AM Jonathan Cameron <jic23@kernel.org>
> > > wrote:
> > > >
> > > >
> > > > On Thu,  2 May 2019 11:14:29 -0500
> > > > Adam Michaelis <adam.michaelis@rockwellcollins.com> wrote:
> > > >
> > > > >
> > > > > Adds device tree parameter to set the configuration read-back bit
> > > > > in the configuration register to tell the AD7949 to include the
> > > > > value of
> > > > > the configuration register at the time the current sample was
> > > > > acquired
> > > > > when reading from the part.
> > > > >
> > > > > Further work must be done to make read-back information available
> > > > > to
> > > > > consumer.
> > > > This needs some explanation of why it is useful at all. I'm certainly
> > > > unclear
> > > > on why it would be useful to configure this at boot time.
> > > >
> > > > Code looks fine.
> > > >
> > > > Jonathan
> > > >
> > > The configuration read-back feature is being maintained from the
> > > original version of this driver. Before adding the device tree entry,
> > > there was no way to change this setting other than debugfs raw access
> > > to the SPI interface, and there is still no access to the returned
> > > configuration data should the feature be enabled. I would be willing
> > > to remove the feature altogether, but wanted to tread softly on
> > > existing features.
> > Ah. Makes sense.  My gut feeling is to drop it.
> >
> > Anyone at Analog have a view on this?
> >
> > Thanks,
> >
> > Jonathan
> >
>
> Hi,
>
> It is not obvious to me why this feature would be useful. I would not add
> it.
>
> Regards,
> -Stefan
>

I have removed this feature in V3 of the patch series.

Thank you for the feedback,
Adam

> > >
> > >
> > > Adam
> > > >
> > > > >
> > > > >
> > > > > Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
> > > > > ---
> > > > >       V2: Add some defines to reduce use of magic numbers.
> > > > > ---
> > > > >  drivers/iio/adc/ad7949.c | 12 +++++++++++-
> > > > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> > > > > index afc1361af5fb..7820e1097787 100644
> > > > > --- a/drivers/iio/adc/ad7949.c
> > > > > +++ b/drivers/iio/adc/ad7949.c
> > > > > @@ -69,6 +69,7 @@ struct ad7949_adc_spec {
> > > > >   * @iio_dev: reference to iio structure
> > > > >   * @spi: reference to spi structure
> > > > >   * @ref_sel: selected reference voltage source
> > > > > + * @cfg_readback: whether reads will include configuration data
> > > > >   * @resolution: resolution of the chip
> > > > >   * @cfg: copy of the configuration register
> > > > >   * @current_channel: current channel in use
> > > > > @@ -80,6 +81,7 @@ struct ad7949_adc_chip {
> > > > >       struct iio_dev *indio_dev;
> > > > >       struct spi_device *spi;
> > > > >       enum ad7949_ref_sel ref_sel;
> > > > > +     bool cfg_readback;
> > > > >       u8 resolution;
> > > > >       u16 cfg;
> > > > >       unsigned int current_channel;
> > > > > @@ -283,7 +285,11 @@ static int ad7949_spi_init(struct
> > > > > ad7949_adc_chip *ad7949_adc)
> > > > >                       AD7949_CFG_REF_SEL_MASK;
> > > > >       adc_config |= (AD7949_CFG_SEQ_DISABLED <<
> > > > > AD7949_CFG_SEQ_SHIFT) &
> > > > >                       AD7949_CFG_SEQ_MASK;
> > > > > -     adc_config |= AD7949_CFG_READBACK_DIS;
> > > > > +
> > > > > +     if (ad7949_adc->cfg_readback)
> > > > > +             adc_config |= AD7949_CFG_READBACK_EN;
> > > > > +     else
> > > > > +             adc_config |= AD7949_CFG_READBACK_DIS;
> > > > >
> > > > >       ret = ad7949_spi_write_cfg(ad7949_adc,
> > > > >                       adc_config,
> > > > > @@ -331,6 +337,10 @@ static int ad7949_spi_probe(struct spi_device
> > > > > *spi)
> > > > >       indio_dev->num_channels = spec->num_channels;
> > > > >       ad7949_adc->resolution = spec->resolution;
> > > > >
> > > > > +     ad7949_adc->cfg_readback = of_property_read_bool(
> > > > > +                     ad7949_adc->indio_dev->dev.of_node,
> > > > > +                     "adi,cfg-readback");
> > > > > +
> > > > >       ret = of_property_read_u32(ad7949_adc->indio_dev-
> > > > > >dev.of_node,
> > > > >                       "adi,reference-select",
> > > > >                       &temp);
> > > --
