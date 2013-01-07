From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3.9 1/3] misc: new driver for GPIO-connected 7-segment
 displays
Date: Mon, 7 Jan 2013 21:41:48 +0000
Message-ID: <201301072141.48487.arnd@arndb.de>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201301071943.40074.arnd@arndb.de> <20130107205854.1f019816@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130107205854.1f019816@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 07 January 2013, Thomas Petazzoni wrote:
> Dear Arnd Bergmann,
> 
> On Mon, 7 Jan 2013 19:43:39 +0000, Arnd Bergmann wrote:
> 
> > >  .../devicetree/bindings/misc/gpio-7seg.txt         |   18 +++
> > >  drivers/misc/Kconfig                               |   13 ++
> > >  drivers/misc/Makefile                              |    1 +
> > >  drivers/misc/gpio-7seg.c                           |  168 ++++++++++++++++++++
> > 
> > I wonder if it would make sense to merge this into the LED subsystem
> > rather than having it as a standalone driver.
> 
> Hum, maybe. How do you see it fitting inside the LED subsystem? The
> purpose of the device is quite different in its userspace to kernel
> interface, no?

The LED subsystem can be used by both in-kernel and by user space
front-ends. It currently supports on/off, blinking and variable
brightness LEDs. Adding 7-segment LEDs may be a stretch but also
would fit into the same basic interface I think.

In addition, it would not have to be GPIO based, although that may
be the only implementation we need for the foreseeable future.
Well, unless you make a driver for PC-style "port-0x80" PCI
cards.


> > > +	sdev->dev_attr.attr.name = "value";
> > > +	sdev->dev_attr.attr.mode = S_IRUGO | S_IWUGO;
> > > +	sdev->dev_attr.show = gpio_7seg_show;
> > > +	sdev->dev_attr.store = gpio_7seg_store;
> > 
> > Any reason why you are not using the DEVICE_ATTR macro?
> 
> DEVICE_ATTR declares the structure, and I wanted one per gpio_7seg
> device, which is dynamically allocated, so I thought that using
> DEVICE_ATTR was not possible. But now that you point this, I realize
> that I was stupid. I can perfectly live with one single global 'struct
> device_attribute' that I register to several devices using
> device_create_file(), no?

Correct.

> That said, is it worth the effort to continue polishing this driver,
> after seeing the feedback from Greg about it? I don't mind working on
> it more and fix the problems of course, but if the general answer is
> that we don't want such a driver in the kernel, then I'd better not
> spend more time on this.

I only saw the discussion after I had sent my reply. I think that
this driver in the form of a drivers/misc sysfs driver is not worth
pursuing, but it may still be possible to integrate it nicely into
the LED framework.

	Arnd
