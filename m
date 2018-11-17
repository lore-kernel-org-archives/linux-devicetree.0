From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 4/4] dt-bindings: iio: adc: Add docs for ad7124
Date: Sat, 17 Nov 2018 16:42:50 +0000
Message-ID: <20181117164250.1fb5e80e@archlinux>
References: <1542108138-3711-1-git-send-email-stefan.popa@analog.com>
        <20181116225431.GA28284@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116225431.GA28284@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stefan Popa <stefan.popa@analog.com>, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 16 Nov 2018 16:54:31 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, 13 Nov 2018 13:22:18 +0200, Stefan Popa wrote:
> > Add support for Analog Devices AD7124 4-channels and 8-channels ADC.
> > 
> > Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> > ---
> > Changes in v2:
> > 	- Nothing changed.
> > Changes in v3:
> > 	- Removed the "adi,channels" property.
> > 	- Used the "reg" property to get the channel number and "adi,diff-channels"
> > 	  for the differential pins. The "adi,channel-number" property was removed.
> > 	- adi,bipolar is of boolean type.
> > Changes in v4:
> > 	- Used the bipolar and diff-channels properties defined in the new adc.txt doc.
> > Changes in v5:
> > 	- Removed the gain and odr properties from the example.
> > 
> >  .../devicetree/bindings/iio/adc/adi,ad7124.txt     | 75 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
