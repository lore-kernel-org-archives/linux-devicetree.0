From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] of: Add missing of_address.h to xilinx ehci driver
Date: Mon, 14 Feb 2011 07:23:12 -0800
Message-ID: <20110214152312.GA15003@kroah.com>
References: <1297680009-4054-1-git-send-email-monstr@monstr.eu>
 <AANLkTi=GZdX62bbMQhE81rbXO0MBdTK-pPbF61qEX3C+@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=GZdX62bbMQhE81rbXO0MBdTK-pPbF61qEX3C+@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, John Williams <john.williams@petalogix.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 14, 2011 at 06:54:08AM -0700, Grant Likely wrote:
> On Mon, Feb 14, 2011 at 3:40 AM, Michal Simek <monstr@monstr.eu> wrote:
> > Build log:
> > In file included from drivers/usb/host/ehci-hcd.c:1208:
> > drivers/usb/host/ehci-xilinx-of.c: In function 'ehci_hcd_xilinx_of_probe':
> > drivers/usb/host/ehci-xilinx-of.c:168: error: implicit declaration of function 'of_address_to_resource'
> >
> > Signed-off-by: John Williams <john.williams@petalogix.com>
> > Signed-off-by: Michal Simek <monstr@monstr.eu>
> 
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> 
> Greg, let me know if you want me to pick this one up for my next pull req.

Sure, please do that, it makes a bit more sense for you to take it if
you need to.

  Acked-by: Greg Kroah-Hartman <gregkh@suse.de>

thanks,

greg k-h
