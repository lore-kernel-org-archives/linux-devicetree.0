From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 3.9] Driver for 7-segment displays connected over GPIOs
Date: Mon, 7 Jan 2013 18:06:44 +0000
Message-ID: <20130107180644.GE3222@n2100.arm.linux.org.uk>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130107164845.GA2911@kroah.com> <20130107180708.2ffc1540@skate>
 <20130107172340.GA32401@kroah.com> <20130107184022.72b23aa9@skate>
 <20130107184352.2e90abfb@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130107184352.2e90abfb@skate>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2013 at 06:43:52PM +0100, Thomas Petazzoni wrote:
> On Mon, 7 Jan 2013 18:40:22 +0100, Thomas Petazzoni wrote:
> > > > Not having a kernel driver means that gazillions of applications
> > > > re-invent the same piece of code over and over again, have to hardcode
> > > > the GPIO numbers for a given piece of hardware, while the kernel
> > > > abstract all of this very nicely.
> > > 
> > > That sounds like a wonderful use of a userspace library to do this
> > > properly.  Much like libusb does, right?
> > > 
> > > I still think as this can be done in userspace, it probably should be.
> > 
> > Understood. Patches discarded.
> 
> Thinking more about this. How would your userspace library know on which
> GPIOs your 7-seg segment device is connected? Should it parse the
> Device Tree from userspace? Given by the user-space application who
> would have to hardcode the GPIO numbers, completely defeating the
> hardware abstraction layer that the kernel intends to be?

An application using the library gives it a list of GPIOs corresponding to
the segments.  If you think about it, the library could also know about a
group of 7-segs and output a multi-digit number in a sane manner.

There's also alphanumeric segmented displays too.  Do we want yet another
different kernel driver for that or should that also be handled in
userspace by the library?  What about a mixture of numeric and alphanumeric
displays?

Some radios I've seen have a mixture of these two types of display.  Others
have partial displays too - take for instance a clock display.  The hours
display only needs to display nothing or 1, or maybe nothing, 1, 2 (yes,
you can get displays with segments missing.)

The contary point to this is... what about 7-segment displays which are
scanned, where the cathodes of each display are commoned (so segment 'a'
is shared between each 7-seg display) and the anodes are sequenced?
Those are popular in certain consumer equipment (like radios) and I
suspect such a display wouldn't be possible from userspace.  _However_
again, there's nothing saying that it will always be a 7-seg display -
it could be again a mixture.

In the case of vacuum flourescent displays, these are very commonly
scanned affairs (gate scanning with commoned anodes for the segments)
in the manner I describe above, and included are segments for various
functions (eg, a separate segment for the weekday name.)  We've all
seen them on video recorders and such like over the years:
http://en.wikipedia.org/wiki/File:Vacuum_fluorescent_1.jpg

So really, there's a whole pile of display classes here that need to be
thought about before anyone goes creating a single interface for just
one specific display type.
