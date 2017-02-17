From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: Re: [PATCH 2/3] usb: add DT bindings for farady fotg2 host
 controller
Date: Fri, 17 Feb 2017 11:07:43 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1702171054320.9178@T420s>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <20170208200010.21522-3-ulli.kroll@googlemail.com> <20170215230042.4m3niqf5wizbrgb4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170215230042.4m3niqf5wizbrgb4@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, 15 Feb 2017, Rob Herring wrote:

> On Wed, Feb 08, 2017 at 09:00:09PM +0100, Hans Ulli Kroll wrote:
> > This adds DT bindings for the Faraday FOTG2 host controller.
> > 
> > Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/fotg2-host.txt | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/fotg2-host.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/fotg2-host.txt b/Documentation/devicetree/bindings/usb/fotg2-host.txt
> > new file mode 100644
> > index 000000000000..4c07566a4bf5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/fotg2-host.txt
> > @@ -0,0 +1,15 @@
> > +Faraday FOTG Host controller
> > +
> > +Required properties:
> > +
> > +- compatible: should be "faraday,fotg210-hcd"
> 
> hcd as in "host controller driver"? Bindings describe h/w not drivers.
> 
> It's an OTG controller or host controller?
> 

here only the host controller part used.

faraday fotg2 is a dual role hcd/otg device and here is only the 
host part used.

Greetings
ans Ulli Kroll
