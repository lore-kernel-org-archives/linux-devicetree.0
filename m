From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC v2 1/5] UDC: Split the driver into amd (pci) and Synopsys
 core driver
Date: Wed, 18 Jan 2017 21:18:50 +0100
Message-ID: <20170118201850.GA20879@kroah.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
 <1484640308-25976-2-git-send-email-raviteja.garimella@broadcom.com>
 <e1453122-164a-e1a8-6aa6-fb25eb33101f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e1453122-164a-e1a8-6aa6-fb25eb33101f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Raviteja Garimella <raviteja.garimella@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 10:45:39AM -0800, Florian Fainelli wrote:
> On 01/17/2017 12:05 AM, Raviteja Garimella wrote:
> > This patch splits the amd5536udc driver into two -- one that does
> > pci device registration and the other file that does the rest of
> > the driver tasks like the gadget/ep ops etc for Synopsys UDC.
> > 
> > This way of splitting helps in exporting core driver symbols which
> > can be used by any other platform/pci driver that is written for
> > the same Synopsys USB device controller.
> > 
> > The current patch also includes a change in the Kconfig and Makefile.
> > A new config option USB_SNP_CORE will be selected automatically when
> > any one of the platform or pci driver for the same UDC is selected.
> > 
> > Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
> 
> Although the changes you have done make sense and it is most certainly a
> good idea to split udc core from bus specific glue logic, it is really
> hard to review the changes per-se because of the file rename, could that
> happen at a later time?
> 
> Also, keep in mind that anytime a driver file is renamed, this poses a
> backport/maintenance issue where backporting fixes from latest upstream
> to a kernel version that has a different file/directory structure is a
> major pain.

Don't ever let stable tree work prevent you from doing the right thing.
If this needs to be split, wonderful, stable kernel work will just have
to deal with it.  Hint, we handle it all the time just fine :)

thanks,

greg k-h
