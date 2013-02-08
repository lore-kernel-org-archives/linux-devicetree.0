From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3.9 1/3] misc: new driver for GPIO-connected 7-segment
 displays
Date: Fri, 08 Feb 2013 22:38:22 +0000
Message-ID: <20130208223822.4204A3E2C27@localhost>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201301071943.40074.arnd@arndb.de> <20130107205854.1f019816@skate>
 <201301072141.48487.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201301072141.48487.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 7 Jan 2013 21:41:48 +0000, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 07 January 2013, Thomas Petazzoni wrote:
> > Dear Arnd Bergmann,
> > 
> > On Mon, 7 Jan 2013 19:43:39 +0000, Arnd Bergmann wrote:
> > 
> > > >  .../devicetree/bindings/misc/gpio-7seg.txt         |   18 +++
> > > >  drivers/misc/Kconfig                               |   13 ++
> > > >  drivers/misc/Makefile                              |    1 +
> > > >  drivers/misc/gpio-7seg.c                           |  168 ++++++++++++++++++++
> > > 
> > > I wonder if it would make sense to merge this into the LED subsystem
> > > rather than having it as a standalone driver.
> > 
> > Hum, maybe. How do you see it fitting inside the LED subsystem? The
> > purpose of the device is quite different in its userspace to kernel
> > interface, no?
> 
> The LED subsystem can be used by both in-kernel and by user space
> front-ends. It currently supports on/off, blinking and variable
> brightness LEDs. Adding 7-segment LEDs may be a stretch but also
> would fit into the same basic interface I think.
> 
> In addition, it would not have to be GPIO based, although that may
> be the only implementation we need for the foreseeable future.
> Well, unless you make a driver for PC-style "port-0x80" PCI
> cards.
> 
> 
> > > > +	sdev->dev_attr.attr.name = "value";
> > > > +	sdev->dev_attr.attr.mode = S_IRUGO | S_IWUGO;
> > > > +	sdev->dev_attr.show = gpio_7seg_show;
> > > > +	sdev->dev_attr.store = gpio_7seg_store;
> > > 
> > > Any reason why you are not using the DEVICE_ATTR macro?
> > 
> > DEVICE_ATTR declares the structure, and I wanted one per gpio_7seg
> > device, which is dynamically allocated, so I thought that using
> > DEVICE_ATTR was not possible. But now that you point this, I realize
> > that I was stupid. I can perfectly live with one single global 'struct
> > device_attribute' that I register to several devices using
> > device_create_file(), no?
> 
> Correct.
> 
> > That said, is it worth the effort to continue polishing this driver,
> > after seeing the feedback from Greg about it? I don't mind working on
> > it more and fix the problems of course, but if the general answer is
> > that we don't want such a driver in the kernel, then I'd better not
> > spend more time on this.
> 
> I only saw the discussion after I had sent my reply. I think that
> this driver in the form of a drivers/misc sysfs driver is not worth
> pursuing, but it may still be possible to integrate it nicely into
> the LED framework.

I also definitely think it should be a kernel driver. This is the sort
of low level device useful for debugging that I want available to other
kernel modules.

g.
