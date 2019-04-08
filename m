MIME-Version: 1.0
Date: Mon, 8 Apr 2019 13:36:07 -0500
References: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
	<1554181578-13362-2-git-send-email-shubhrajyoti.datta@gmail.com>
	<5ca841e5.1c69fb81.87c5.289f@mx.google.com>
	<CAKfKVtH8Y9fdNTBYbTJ8dTvbk9kmNf_Fd=GeAXCrSeE46jBgHQ@mail.gmail.com>
In-Reply-To: <CAKfKVtH8Y9fdNTBYbTJ8dTvbk9kmNf_Fd=GeAXCrSeE46jBgHQ@mail.gmail.com>
Message-ID: <CAL_JsqJ8+akzB7EuUVBsqZ-aqZ9bNGjEtQf+2PwTdZk2TAMz7w@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] dt-bindings: xilinx-uartps: Add support for noctsrts
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 7, 2019 at 10:26 PM Shubhrajyoti Datta
<shubhrajyoti.datta@gmail.com> wrote:
>
> Hi Rob,
> Thanks for  the review.
>
> On Sat, Apr 6, 2019 at 11:36 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Apr 02, 2019 at 10:36:17AM +0530, shubhrajyoti.datta@gmail.com wrote:
> > > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > >
> > > Vivado has a configurationo for selecting the flow control.
> >
> > Vivado is ?
> >
> > > Add a dt binding to check for the same.
> > >
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > > ---
> > >  Documentation/devicetree/bindings/serial/cdns,uart.txt | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> > > index 227bb77..5161a05 100644
> > > --- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
> > > +++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> > > @@ -12,6 +12,10 @@ Required properties:
> > >    See ../clocks/clock-bindings.txt for details.
> > >
> > >
> > > +Optional properties:
> > > +- xlnx,nortscts: The presence of this property indicates that the
> > > +    UART does not support modem lines for RTS/CTS hardware flow control.
> >
> > We already have 'uart-has-rtscts'. Please use that. Maybe you need a new
> > compatible as I'd guess current users assume RTS/CTS is present.
>
> the setting in vivado (tool helps configure the board) which says no
> flowcontrol.
> this just keeps the lines in a unknown state.
>
> this issue  with 'uart-has-rtscts'  is  backward compatibility
> current code assumes rts / cts is
> present. If not preset then it  will return false. So I  thought of
> having a property with the inverse.

Searching more, we also have 'cts-override' (in snps-dw-apb-uart.txt).
How about using that? You don't really need to care about RTS as
setting it will just have no effect.

Rob
