From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: iio: frequency: Use dt-schema for
 clock-names
Date: Wed, 26 Jun 2019 20:42:11 +0100
Message-ID: <20190626204211.4d05ab38@archlinux>
References: <1561389097-26075-1-git-send-email-stefan.popa@analog.com>
        <20190625083036.jrr7kz7f6ks6nqps@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625083036.jrr7kz7f6ks6nqps@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Stefan Popa <stefan.popa@analog.com>, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jun 2019 10:30:36 +0200
Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> Hi,
> 
> On Mon, Jun 24, 2019 at 06:11:37PM +0300, Stefan Popa wrote:
> > Dt-schema can be used for clock-names property.
> >
> > Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> > ---
> >  Documentation/devicetree/bindings/iio/frequency/adf4371.yaml | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> > index d7adf074..8a2a8f6 100644
> > --- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> > +++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> > @@ -27,9 +27,8 @@ properties:
> >      maxItems: 1
> >
> >    clock-names:
> > -    description:
> > -      Must be "clkin"
> > -    maxItems: 1
> > +    items:
> > +      - clkin  
> 
> You can even just have const: clkin here
> 
Given this is fairly independent from the rest of the series, I'll plough
on with the others and expect a v2 of this one to address Maxime's
suggestion.

Thanks,

Jonathan

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
