Return-Path: <SRS0=TXGq=PL=pengutronix.de=mfe@kernel.org>
Date: Thu, 3 Jan 2019 14:58:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 data lane swapping
Message-ID: <20190103135833.sisj55ibyxuh53sj@pengutronix.de>
References: <20181219145941.5173-1-m.felsch@pengutronix.de>
 <20181228234525.GA30428@bogus>
 <20181231110514.e3lrninzybg5vhvw@pengutronix.de>
 <dfcbf6ae-be39-ec8c-9018-05221372098c@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfcbf6ae-be39-ec8c-9018-05221372098c@skidata.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Rob Herring <robh@kernel.org>, fancer.lancer@gmail.com, kernel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On 19-01-02 06:44, Richard Leitner wrote:
> Hi,
> 
> On 31/12/2018 12:05, Marco Felsch wrote:
> > Hi,
> > 
> > On 18-12-28 17:45, Rob Herring wrote:
> > > On Wed, Dec 19, 2018 at 03:59:40PM +0100, Marco Felsch wrote:
> > > > Add optional binding to allow USB differential-pair (D+/D-) data lane
> > > > swapping. The swapping can be specified for each port separately,
> > > > default is no swapping.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >   Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
> > > >   1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> > > > index 168ff819e827..aec93a92870d 100644
> > > > --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> > > > +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> > > > @@ -64,6 +64,8 @@ Optional properties :
> > > >    - power-on-time-ms : Specifies the time it takes from the time the host
> > > >   	initiates the power-on sequence to a port until the port has adequate
> > > >   	power. The value is given in ms in a 0 - 510 range (default is 100ms).
> > > > + - sw-dx-lanes-ports : Specifies the ports which will swap the differential-pair
> > > > +	(D+/D-), default is not-swapped.
> > > 
> > > Perhaps 'swap-dx-ports' would be a more obvious name.
> > 
> > What you think about 'swap-dx-lanes' since it has nothing to do with
> > port swapping, it's rather swapping port properties internally.
> 
> I'd also prefer 'swap-dx-lanes'. For me it's short and clear.
> 
> The only downside is that the feature is called "PORT SWAP" in the
> datasheet. Therefore you should maybe mention it in a comment somewhere
> in the code so people know what to look for in the datasheet?

Okay, I can do this. Should I place the comment into the driver code or
into the bindings description? Both places seems to be correct for me.

Regards,
Marco

> 
> regards;Richard.L
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
