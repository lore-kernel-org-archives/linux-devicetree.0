From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb-xhci: Add usb-phy-port-reset property
Date: Tue, 26 Feb 2019 10:27:13 +0530
Message-ID: <CABe79T4j7batxZ7BDhEpwRK8x5UMZLkxLJOt-FD0SCr9JOFizw@mail.gmail.com>
References: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
 <1549347534-11320-2-git-send-email-srinath.mannam@broadcom.com> <20190225213807.GA18852@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225213807.GA18852@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,
Thanks for the review, Please see my comments below in line.

Regards,
Srinath.
On Tue, Feb 26, 2019 at 3:08 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Feb 05, 2019 at 11:48:53AM +0530, Srinath Mannam wrote:
> > Add usb-phy-port-reset optional property to set quirk in xhci platform
> > driver which forces USB port PHY reset on port disconnect event.
> >
> > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > index fea8b15..ecbdb15 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > @@ -40,6 +40,7 @@ Optional properties:
> >    - usb3-lpm-capable: determines if platform is USB3 LPM capable
> >    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
> >    - imod-interval-ns: default interrupt moderation interval is 5000ns
> > +  - usb-phy-port-reset: set this to do USB PORT PHY reset while disconnect
> >    - phys : see usb-hcd.txt in the current directory
>
> This should be implied by the HCI or phy compatible string (depending
> on who exactly needs the quirky behavior).
Stingray USB HS PHY connected to xHCI port has an issue, if full speed
devices connected to this port then
after all High Speed devices connected to this port are detected at
full speed instead of high speed.
So that we need to do PHY (which is connected to port) reset on xHCI
port disconnect event.
That is the reason we required to add quirk in xHCI.
>
> Rob
