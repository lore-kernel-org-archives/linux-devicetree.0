Return-Path: <SRS0=YTt1=SE=gmail.com=shubhrajyoti.datta@kernel.org>
MIME-Version: 1.0
References: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1554136640-25194-2-git-send-email-shubhrajyoti.datta@gmail.com> <20190401170954.GA19314@kroah.com>
In-Reply-To: <20190401170954.GA19314@kroah.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Tue, 2 Apr 2019 12:41:17 +0530
Message-ID: <CAKfKVtEhmPxEPK1z1UM3o_4rvGj7TvrfXUuJBOee6SiLCcRSAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: xilinx-uartps: Add support for nomodem
Content-Type: text/plain; charset="UTF-8"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, jslaby@suse.com, Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Hi Greg ,

Thanks for the review.

On Mon, Apr 1, 2019 at 11:09 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 01, 2019 at 10:07:19PM +0530, shubhrajyoti.datta@gmail.com wrote:
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >
> > Vivado has a configurationo for selecting the modem control.
> > Add a dt binding to check for the same.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  Documentation/devicetree/bindings/serial/cdns,uart.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> > index 227bb77..3e96619 100644
> > --- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
> > +++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
> > @@ -12,6 +12,10 @@ Required properties:
> >    See ../clocks/clock-bindings.txt for details.
> >
> >
> > +Optional properties:
> > +- xlnx,nomodem: The presence of this property indicates that the
> > +    UART does not support modem lines for RTS/CTS hardware flow control.
>
> Shouldn't that be something like "noflowcontrol" or "nortscts"?  "modem"
> has nothing to do with rts/cts flow control, right?

Updated in the v2.

Thanks
>
> thanks,
>
> greg k-h
