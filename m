From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3.9] Driver for 7-segment displays connected over GPIOs
Date: Mon, 7 Jan 2013 10:36:42 -0800
Message-ID: <20130107183642.GA26612@kroah.com>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130107164845.GA2911@kroah.com> <20130107180708.2ffc1540@skate>
 <20130107172340.GA32401@kroah.com> <20130107185357.6da83d60@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130107185357.6da83d60@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2013 at 06:53:57PM +0100, Thomas Petazzoni wrote:
> Dear Greg Kroah-Hartman,
> 
> On Mon, 7 Jan 2013 09:23:40 -0800, Greg Kroah-Hartman wrote:
> 
> > > Not having a kernel driver means that gazillions of applications
> > > re-invent the same piece of code over and over again, have to hardcode
> > > the GPIO numbers for a given piece of hardware, while the kernel
> > > abstract all of this very nicely.
> > 
> > That sounds like a wonderful use of a userspace library to do this
> > properly.  Much like libusb does, right?
> > 
> > I still think as this can be done in userspace, it probably should be.
> 
> So that's why we have drivers/usb/misc/usbsevseg.c in the kernel, which
> uses sysfs files to output text or numbers on a 7-segment display,
> while it could all be done using libusb from userspace? Seems like back
> in 2008 you Signed-off-by on the patch adding this driver :-)

I don't remember what I committed a month ago, let alone 4 years ago.
So trying to use that as an excuse as to why I should take your patch
isn't a really good idea, sorry :)

As Russell points out, if you want this in the kernel, it needs to have
a good userspace api, and that needs a lot more work than just a single
sysfs file.

thanks,

greg k-h
