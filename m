From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: iio: add Intersil isl76683 light
 sensor bindings
Date: Tue, 14 Nov 2017 15:20:20 +0100
Message-ID: <1510669220.1892.4.camel@googlemail.com>
References: <1510068983-25769-1-git-send-email-chf.fritz@googlemail.com>
         <1510068983-25769-3-git-send-email-chf.fritz@googlemail.com>
         <20171110212604.bpbsgtw7zbk5qp2d@rob-hp-laptop>
Reply-To: chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171110212604.bpbsgtw7zbk5qp2d@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob

On Fri, 2017-11-10 at 15:26 -0600, Rob Herring wrote:
> On Tue, Nov 07, 2017 at 04:36:22PM +0100, Christoph Fritz wrote:

> > +Optional properties:
> > +
> > +  - isil,external-resistor: integer in kOhm of external resistor R_ext.
> > +                            Valid values are from 1 to 1000.
> > +                            If not supplied, 100 kOhm will be assumed.
> 
> Add an unit suffix as defined in property-units.txt.

Thanks, I'll use "isil,external-resistor-ohms" as defined in
property-units.txt.

What bothers me a bit is that there is no "-kilo-ohms" suffix but a
"-micro-ohms" which is pretty uncommon. Even the only use of suffix
"-micro-ohms" could have been expressed easily as "-ohms" while being
more readable:

qcom,external-resistor-micro-ohms = <10000>;

Due to stable dt-api I suppose this cannot be changed and/or extended
with "-kilo-ohms", right?

Thanks
 -- Christoph
