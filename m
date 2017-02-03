From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Fri, 3 Feb 2017 10:57:30 +0100
Message-ID: <20170203095730.GA29502@kroah.com>
References: <1486043069-1575-1-git-send-email-richard.leitner@skidata.com>
 <20170203090327.GA27160@kroah.com>
 <c523e5c0-8138-52f6-827a-348c31513402@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c523e5c0-8138-52f6-827a-348c31513402@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 10:44:05AM +0100, Richard Leitner wrote:
> Hi Greg,
> 
> On 02/03/2017 10:03 AM, Greg KH wrote:
> > On Thu, Feb 02, 2017 at 02:44:29PM +0100, Richard Leitner wrote:
> >> This patch adds a driver for configuration of the Microchip USB251xB/xBi
> >> USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
> >> configuration interface and two to four USB 2.0 downstream ports.
> >>
> >> Furthermore add myself as a maintainer for this driver.
> >>
> >> The datasheet can be found at the manufacturers website, see [1]. All
> >> device-tree exposed configuration features have been tested on a i.MX6
> >> platform with a USB2512B hub.
> >>
> >> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
> >>
> >> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > 
> > What is "RFC" about this?  If you don't think it's ready to be merged,
> > I'll agree with that and so I've deleted it from my review queue :)
> 
> As it's my first patch which adds a new driver I thought (after reading
> [1]) a "RFC" would be appropriate. Isn't it?
> 
> As stated in the commit message we tested it internally on an i.MX6
> platform. Therefore, from my/our point of view, it works as expected and
> should be ready to be merged (otherwise I wouldn't have submitted it to
> the ML ;-) ).
> 
> So how should I proceed here? Re-send it without "RFC"? Wait for some
> feedback? Something completely different?

resend it without the RFC and I'll be glad to review it for inclusion.

thanks,

greg k-h
