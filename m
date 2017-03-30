From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: Re: [PATCH 2/3] usb: add DT bindings for farady fotg2 host
 controller
Date: Thu, 30 Mar 2017 20:31:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1703302023250.17971@T420s>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <20170208200010.21522-3-ulli.kroll@googlemail.com> <20170215230042.4m3niqf5wizbrgb4@rob-hp-laptop> <alpine.LNX.2.00.1702171054320.9178@T420s> <CAL_JsqK7VDomXqMz3YJqL5QjnSb-anwXtG+exz4g_BjPLOaiXQ@mail.gmail.com>
 <CACRpkdbjNS+ADawDCub5OP1iguNk+4Ked+mh_T_-bJ=6-9-3Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbjNS+ADawDCub5OP1iguNk+4Ked+mh_T_-bJ=6-9-3Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Thu, 30 Mar 2017, Linus Walleij wrote:

> On Tue, Feb 21, 2017 at 3:43 PM, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Feb 17, 2017 at 4:07 AM, Hans Ulli Kroll
> > <ulli.kroll@googlemail.com> wrote:
> >> Hi Rob,
> >>
> >> On Wed, 15 Feb 2017, Rob Herring wrote:
> >>
> >>> On Wed, Feb 08, 2017 at 09:00:09PM +0100, Hans Ulli Kroll wrote:
> >>> > This adds DT bindings for the Faraday FOTG2 host controller.
> >>> >
> >>> > Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> >>> > ---
> >>> >  Documentation/devicetree/bindings/usb/fotg2-host.txt | 15 +++++++++++++++
> >>> >  1 file changed, 15 insertions(+)
> >>> >  create mode 100644 Documentation/devicetree/bindings/usb/fotg2-host.txt
> >>> >
> >>> > diff --git a/Documentation/devicetree/bindings/usb/fotg2-host.txt b/Documentation/devicetree/bindings/usb/fotg2-host.txt
> >>> > new file mode 100644
> >>> > index 000000000000..4c07566a4bf5
> >>> > --- /dev/null
> >>> > +++ b/Documentation/devicetree/bindings/usb/fotg2-host.txt
> >>> > @@ -0,0 +1,15 @@
> >>> > +Faraday FOTG Host controller
> >>> > +
> >>> > +Required properties:
> >>> > +
> >>> > +- compatible: should be "faraday,fotg210-hcd"
> >>>
> >>> hcd as in "host controller driver"? Bindings describe h/w not drivers.
> >>>
> >>> It's an OTG controller or host controller?
> >>>
> >>
> >> here only the host controller part used.
> >>
> >> faraday fotg2 is a dual role hcd/otg device and here is only the
> >> host part used.
> >
> > Because you don't care about device mode or restricted by the IP
> > configuration or SoC integration? The former is a user choice and
> > shouldn't be part of DT. The latter should be implied by an SoC
> > specific compatible string. Using only a compatible string for a
> > licensed IP is not specific enough as vendors use differing versions
> > and integrate them in different ways.
> 
> Hans can you add:
> 
> compatible = "cortina,gemini-fotg", "faraday,fotg210-hcd" or something
> as composite compatible for our controller?
> 

I prefer 
"faraday,fotg210-usb2"

I've got rejected by Rob due the fact this is an dual role controller, 
which supports both host and device mode. And DT must reflect this desgn 
pattern.

Currently I'm wrappingt my head around the design of the fsl-mph-dr-of.c 
driver to use this as a blueprint for the Faraday driver.

Greetings
Hans Ulli Kroll
