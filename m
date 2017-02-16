From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Thu, 16 Feb 2017 05:55:18 -0800
Message-ID: <20170216135518.GA19423@kroah.com>
References: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
 <20170216023004.25dwzy7ppxdoasfz@rob-hp-laptop>
 <31fd459f-aed3-9d4a-2a63-651131216542@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31fd459f-aed3-9d4a-2a63-651131216542@g0hl1n.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <me@g0hl1n.net>
Cc: Rob Herring <robh@kernel.org>, Richard Leitner <richard.leitner@skidata.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, andriy.shevchenko@linux.intel.com, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 07:36:48AM +0100, Richard Leitner wrote:
> On 02/16/2017 03:30 AM, Rob Herring wrote:
> > On Fri, Feb 10, 2017 at 09:19:27AM +0100, Richard Leitner wrote:
> > > This patch adds a driver for configuration of the Microchip USB251xB/xBi
> > > USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
> > > configuration interface and two to four USB 2.0 downstream ports.
> > > 
> > > Furthermore add myself as a maintainer for this driver.
> > > 
> > > The datasheet can be found at the manufacturers website, see [1]. All
> > > device-tree exposed configuration features have been tested on a i.MX6
> > > platform with a USB2512B hub.
> > > 
> > > [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > > ---
> > > CHANGES v5:
> > 
> > V5 and the first I see it?
> 
> Just double-checked it, you (robh+dt@kernel.org) were on CC since v1.
> 
> @greg-kh: I got the notification that v5 was already applied to your usb
> tree. So how should I proceed here? Send a v6 or send a separate patch
> fixing the dt issues mentioned by robh?

A separate patch fixing the issues is fine, I don't think it's worth
reverting your original patch and then adding an updated one to the
tree.

thanks,

greg k-h
