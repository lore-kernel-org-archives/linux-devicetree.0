From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 3.9] Driver for 7-segment displays connected over GPIOs
Date: Mon, 7 Jan 2013 13:02:45 -0500
Message-ID: <20130107180245.GP5075@titan.lakedaemon.net>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130107164845.GA2911@kroah.com> <20130107180708.2ffc1540@skate>
 <20130107172340.GA32401@kroah.com> <20130107184022.72b23aa9@skate>
 <20130107184352.2e90abfb@skate>
 <ADE657CA350FB648AAC2C43247A983F00206D6C98E38@AUSP01VMBX24.collaborationhost.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F00206D6C98E38-gaq956PjLg32KbjnnMDalRurcAul1UnsRrxOEX5GOmysTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: H Hartley Sweeten <hartleys-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2013 at 11:56:19AM -0600, H Hartley Sweeten wrote:
> On Monday, January 07, 2013 10:44 AM, Thomas Petazzoni wrote:
> > On Mon, 7 Jan 2013 18:40:22 +0100, Thomas Petazzoni wrote:
> >
> >>>> Not having a kernel driver means that gazillions of applications
> >>>> re-invent the same piece of code over and over again, have to hardcode
> >>>> the GPIO numbers for a given piece of hardware, while the kernel
> >>>> abstract all of this very nicely.
> >>> 
> >>> That sounds like a wonderful use of a userspace library to do this
> >>> properly.  Much like libusb does, right?
> >>> 
> >>> I still think as this can be done in userspace, it probably should be.
> >> 
> >> Understood. Patches discarded.
> >
> > Thinking more about this. How would your userspace library know on which
> > GPIOs your 7-seg segment device is connected? Should it parse the
> > Device Tree from userspace? Given by the user-space application who
> > would have to hardcode the GPIO numbers, completely defeating the
> > hardware abstraction layer that the kernel intends to be?
> 
> Maybe an 'init' of 'config' function in the library should allow the user to
> define the GPIOs that are connected to the 7-seg display? Or store the
> GPIOs in some config file that the library parses when it's loaded.
> 
> This does require the user to know what GPIOs are connected and
> forces then to do a bit of setup to use the display. But the actual use of
> the display is still abstracted.
> 
> The library should also allow for multiple 7-seg displays. The old PC "post"
> diagnostic boards usually had two displays on them.

However, Thomas has a valid point.  The DT is supposed to describe the
hardware.  The seven segment display is wired to three gpios on the
board.  Hence, it should be described in the DT for inferior OS's that
would handle this device in kernelspace.

Perhaps the library should be parsing /proc/devicetree ?

thx,

Jason.
