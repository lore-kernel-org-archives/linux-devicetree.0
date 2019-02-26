From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb-xhci: Add usb-phy-port-reset property
Date: Tue, 26 Feb 2019 12:02:55 -0600
Message-ID: <CAL_Jsq+ZOWyY7p=ZjRnB85RY=fcNXu7xiH5j-1-OkuAmXqCFxw@mail.gmail.com>
References: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
 <1549347534-11320-2-git-send-email-srinath.mannam@broadcom.com>
 <20190225213807.GA18852@bogus> <CABe79T4j7batxZ7BDhEpwRK8x5UMZLkxLJOt-FD0SCr9JOFizw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABe79T4j7batxZ7BDhEpwRK8x5UMZLkxLJOt-FD0SCr9JOFizw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Mark Rutland <mark.rutland@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2019 at 10:57 PM Srinath Mannam
<srinath.mannam@broadcom.com> wrote:
>
> Hi Rob,
> Thanks for the review, Please see my comments below in line.
>
> Regards,
> Srinath.
> On Tue, Feb 26, 2019 at 3:08 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Feb 05, 2019 at 11:48:53AM +0530, Srinath Mannam wrote:
> > > Add usb-phy-port-reset optional property to set quirk in xhci platform
> > > driver which forces USB port PHY reset on port disconnect event.
> > >
> > > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > > Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > index fea8b15..ecbdb15 100644
> > > --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > @@ -40,6 +40,7 @@ Optional properties:
> > >    - usb3-lpm-capable: determines if platform is USB3 LPM capable
> > >    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
> > >    - imod-interval-ns: default interrupt moderation interval is 5000ns
> > > +  - usb-phy-port-reset: set this to do USB PORT PHY reset while disconnect
> > >    - phys : see usb-hcd.txt in the current directory
> >
> > This should be implied by the HCI or phy compatible string (depending
> > on who exactly needs the quirky behavior).
> Stingray USB HS PHY connected to xHCI port has an issue, if full speed
> devices connected to this port then
> after all High Speed devices connected to this port are detected at
> full speed instead of high speed.
> So that we need to do PHY (which is connected to port) reset on xHCI
> port disconnect event.
> That is the reason we required to add quirk in xHCI.

So, by looking at the xhci host and phy compatible strings (or maybe
just the phy) you can determine whether you need to reset the port or
not. All the information you need is in DT already.

Rob
