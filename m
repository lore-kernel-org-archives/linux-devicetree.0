Return-Path: <jic23@kernel.org>
Date: Sat, 18 May 2019 10:07:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: iio: ad7949: Add
 adi,reference-select
Message-ID: <20190518100753.39b438cb@archlinux>
In-Reply-To: <20190514182311.GA31516@bogus>
References: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
	<1557759185-167857-3-git-send-email-adam.michaelis@rockwellcollins.com>
	<20190514182311.GA31516@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Adam Michaelis <adam.michaelis@rockwellcollins.com>, linux-iio@vger.kernel.org, lars@metafoo.de, michael.hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com
List-ID: <devicetree@vger.kernel.org>

On Tue, 14 May 2019 13:23:11 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, 13 May 2019 09:53:03 -0500, Adam Michaelis wrote:
> > Adding optional parameter to AD7949 to specify the source for the
> > reference voltage signal. Default value is maintained with option '3' to
> > match previous version of driver.
> > 
> > Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
> > ---
> > 	V2:
> > 	- Add some defines to reduce use of magic numbers.
> > 	V3:
> > 	- Re-think usage of device tree parameter to focus on the
> > 	actual reference sources instead of the raw hardware
> > 	configuration.
> > ---
> >  .../devicetree/bindings/iio/adc/ad7949.txt          | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Looks fine to me as well. Analog review awaited before applying.
For reference
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
