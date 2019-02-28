From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC][PATCH] dt-bindings: usb: add non-removable device property
Date: Thu, 28 Feb 2019 19:06:19 +0100
Message-ID: <20190228180619.GB30532@kroah.com>
References: <20190228143344.16312-1-mans@mansr.com>
 <20190228151330.GA1360@kroah.com>
 <yw1x8sy0uedr.fsf@mansr.com>
 <20190228155241.GC12050@kroah.com>
 <yw1x4l8nvmu6.fsf@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <yw1x4l8nvmu6.fsf@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 05:34:25PM +0000, Måns Rullgård wrote:
> >> --- a/drivers/usb/core/hub.c
> >> +++ b/drivers/usb/core/hub.c
> >> @@ -2392,6 +2392,14 @@ static void set_usb_port_removable(struct usb_device *udev)
> >>                 break;
> >>         }
> >>  
> >> +       /*
> >> +        * Otherwise, check whether DT indicates this device is non-removable.
> >> +        */
> >> +       if (of_property_read_bool(udev->dev.of_node, "non-removable")) {
> >> +               udev->removable = USB_DEVICE_FIXED;
> >> +               return;
> >> +       }
> >
> > Shouldn't this be an attribute of the USB hub's port, not the device
> > itself?  That's the way it works with ACPI, and odds are any description
> > of USB devices in DT is also going to look much like how ACPI describes
> > the devices, let's not try to diverge when it is not necessary.
> 
> Fine with me.  That's why I asked.
> 
> How about a non-removable-ports property in the hub node listing the
> hardwired ports?

Sounds reasonable to me as that should mirror what happens in ACPI, so
you should be able to just mirror what drivers/usb/core/usb-acpi.c does
for dt.

thanks,

greg k-h
