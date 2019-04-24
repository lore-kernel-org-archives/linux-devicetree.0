From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: tsl2772: convert bindings to YAML
 format
Date: Wed, 24 Apr 2019 04:34:53 -0400
Message-ID: <20190424083453.GA13924@basecamp>
References: <20190416084552.1538-1-masneyb@onstation.org>
 <20190422135238.27b9892d@archlinux>
 <CAL_JsqJo4jA=_dLJ7QJ-LOhSYrXDAcVN01119do0a+y4odpFng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJo4jA=_dLJ7QJ-LOhSYrXDAcVN01119do0a+y4odpFng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2019 at 08:34:13PM -0500, Rob Herring wrote:
> On Mon, Apr 22, 2019 at 7:52 AM Jonathan Cameron <jic23@kernel.org> wrote:
> > > diff --git a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
> > > new file mode 100644
> > > index 000000000000..b3ac182288d2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
> > > @@ -0,0 +1,85 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> 
> Do you have the rights on the original file to add BSD license?

Yes, I'm the only contributor to the original file.

> > > +    maxItems: 1
> > > +
> > > +  led-max-microamp:
> > > +    description: Current for the proximity LED
> 
> This device only has proximity LEDs, right?

Yes

The other feedback makes sense. Thanks for the review!

Brian
