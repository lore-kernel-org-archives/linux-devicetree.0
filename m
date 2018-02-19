Return-Path: <SRS0=PLME=FN=opensource.cirrus.com=ckeepax@kernel.org>
Date: Mon, 19 Feb 2018 10:28:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] mfd: arizona: Update DT doc to support more standard
 reset binding
Message-ID: <20180219102838.mcu3wkrvfkaf2ty4@localhost.localdomain>
References: <20180214155512.17218-1-ckeepax@opensource.cirrus.com>
 <20180214155512.17218-2-ckeepax@opensource.cirrus.com>
 <20180219031335.75rw2bdlyrxjt4ff@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180219031335.75rw2bdlyrxjt4ff@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Sun, Feb 18, 2018 at 09:13:35PM -0600, Rob Herring wrote:
> On Wed, Feb 14, 2018 at 03:55:12PM +0000, Charles Keepax wrote:
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> > index bdd017686ea5..a1557220825e 100644
> > --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> > +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> > @@ -50,7 +50,7 @@ Required properties:
> >  
> >  Optional properties:
> >  
> > -  - wlf,reset : GPIO specifier for the GPIO controlling /RESET
> > +  - wlf,reset-gpios : GPIO specifier for the GPIO controlling /RESET
> 
> Just reset-gpios is widely used, so you can use that and drop the 
> vendor.
> 

Yes sorry should have realised that will drop the prefix and
resend.

Thanks,
Charles
