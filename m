From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V2 4/4] dt-bindings: iio: adc: Convert ad7124
 documentation to YAML
Date: Sat, 22 Jun 2019 09:33:25 +0100
Message-ID: <20190622093325.77539301@archlinux>
References: <20190621121344.24917-1-mircea.caprioru@analog.com>
        <20190621121344.24917-4-mircea.caprioru@analog.com>
        <CAL_JsqLOMKQExp1Vu0Xo32Wx-ETdQk=AWSnex-GQ3QbzdZ7zQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLOMKQExp1Vu0Xo32Wx-ETdQk=AWSnex-GQ3QbzdZ7zQA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mircea Caprioru <mircea.caprioru@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Jun 2019 08:31:14 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Fri, Jun 21, 2019 at 6:15 AM Mircea Caprioru
> <mircea.caprioru@analog.com> wrote:
> >
> > Convert AD7124 bindings documentation to YAML format.
> >
> > Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> > ---
> >
> > Changelog v2:
> > - modified SPDX license to GPL-2.0 OR BSD-2-Clause
> > - added regex for a range from 0 to 15
> > - added minimum and maximum constraints for reg property
> > - set type and range of values for adi,reference-select property
> > - used items for diff-channels property
> > - set bipolar, adi,buffered-positive and negative to type: boolean
> >
> >  .../bindings/iio/adc/adi,ad7124.yaml          | 155 ++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
The result is presumably good but the structure of the patch is not
as straight forward as it should be.  As the changelog makes clear we
aren't just doing a conversion here.  It is a mixture of conversion
and new properties.  Please break the patch in two to reflect that.
First convert the existing binding, then add the new properties.

That will make it easier for people to see what is new.

Thanks,

Jonathan
