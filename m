Return-Path: <SRS0=DL3G=TX=gmail.com=ardeleanalex@kernel.org>
MIME-Version: 1.0
References: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
 <1557759185-167857-3-git-send-email-adam.michaelis@rockwellcollins.com>
 <20190514182311.GA31516@bogus> <20190518100753.39b438cb@archlinux>
In-Reply-To: <20190518100753.39b438cb@archlinux>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 23 May 2019 15:16:51 +0300
Message-ID: <CA+U=DspGJpVvo05HspwFVXvbdBiF1HUzYji0o3pWO4j_Wf7CHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: iio: ad7949: Add adi,reference-select
Content-Type: text/plain; charset="UTF-8"
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Adam Michaelis <adam.michaelis@rockwellcollins.com>, linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <michael.hennerich@analog.com>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com, Alexandru Ardelean <alexandru.ardelean@analog.com>, Stefan Popa <stefan.popa@analog.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, May 18, 2019 at 12:08 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Tue, 14 May 2019 13:23:11 -0500
> Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, 13 May 2019 09:53:03 -0500, Adam Michaelis wrote:
> > > Adding optional parameter to AD7949 to specify the source for the
> > > reference voltage signal. Default value is maintained with option '3' to
> > > match previous version of driver.
> > >
> > > Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
> > > ---
> > >     V2:
> > >     - Add some defines to reduce use of magic numbers.
> > >     V3:
> > >     - Re-think usage of device tree parameter to focus on the
> > >     actual reference sources instead of the raw hardware
> > >     configuration.
> > > ---
> > >  .../devicetree/bindings/iio/adc/ad7949.txt          | 21 +++++++++++++++++++--
> > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> Looks fine to me as well. Analog review awaited before applying.
> For reference
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

CC-ing my work email

Acked-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

>
