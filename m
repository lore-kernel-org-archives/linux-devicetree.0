From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC][PATCH] dt-bindings: usb: add non-removable device property
Date: Thu, 28 Feb 2019 16:13:30 +0100
Message-ID: <20190228151330.GA1360@kroah.com>
References: <20190228143344.16312-1-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190228143344.16312-1-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 02:33:44PM +0000, Mans Rullgard wrote:
> Add a boolean property indicating that a device is hardwired to the
> upstream port.  Although hubs can provide this information, they are not
> always configured correctly.  An alternate means of indicating this for
> built-in USB devices is thus useful.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> I have a situation where userspace would like to know which USB devices
> are built-in, but the on-board hub doesn't have the right setting.
> Also, the hub itself can't be indicated as fixed in any other way that
> I'm aware of.

Then that's a firmware bug, right?  We have a way for firmware to export
this to the USB core, why not use that?  Your on-board hub should get a
firmware update with this information, let's not try to create
yet-another-way to define this type of information please.

> In a way, adding this property seems a bit silly since dt can only
> sensibly be used for hardwired devices in the first place.  Thus the
> mere presence of a dt node could be taken to indicate the same thing.
> On the other hand, it's conceivable that someone might dynamically
> generate a devicetree based on what happens to be connected on boot or
> something.  For that reason, and explicit property seems safer.
> ---
>  Documentation/devicetree/bindings/usb/usb-device.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Can you show some code actually using this?  Again, this should "just
work" for USB today unless your platform is really broken (and if it is,
go complain to the vendor...)

thanks,

greg k-h
