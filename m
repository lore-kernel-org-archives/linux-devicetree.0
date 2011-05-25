From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: i2c child devices: binding to uio device driver
Date: Wed, 25 May 2011 13:28:39 +0200
Message-ID: <201105251328.39337.arnd@arndb.de>
References: <BANLkTimSBReyncTANTyy4jhah=-QvPigwQ@mail.gmail.com>
	<20110519155808.GC3085@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110519155808.GC3085-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 19 May 2011, Grant Likely wrote:
> On Thu, May 19, 2011 at 05:32:32PM +0200, Thomas De Schampheleire wrote:
> > Hi,
> > 
> > I am using the uio framework (userspace i/o) to handle devices in
> > userspace. This includes memory access and interrupt handling.
> > For i2c devices, I'm using the i2c-dev interface, to talk to these
> > devices from userspace. This already works fine.

Ok.

> > One of my i2c devices also has an interrupt line connected to the
> > processor. To be able to handle this interrupt with uio, I need to
> > have a kernel driver matched against the i2c device. However, the i2c
> > device described in the device tree does not bind with the driver. Is
> > this behavior supported, and if so, what am I doing wrong? Do I have
> > to create a dummy bus (non-i2c) and add a shadow node for the
> > interrupt?
> 
> You're wandering into new territory here.  It is definitely the right
> thing to do to describe your i2c device in the device tree with the
> interrupt fully specified.

Agreed.

> What you probably need to do is create a uio helper driver for your
> device that takes care of finding the device node, mapping the
> interrupt, and proving the interrupt handling UIO hook to userspace.
> The easiest way to work this out would be to make your uio helper
> actually bind to the i2c device created by the device node (this is
> probably the best way too), but you don't have to.  As long as you
> arrange for you uio helper to get called at some point, you can get it
> to find the appropriate node in the DT, map the interrupt, and export
> it to userspace.

My feeling is that you should not be using a UIO device for this
case, but rather extend the i2c-dev interface to provide an interrupt
passthrough for devices that have an interrupt line. In that case,
you will not need any UIO bindings, and the same i2c-dev user space
driver will simply work without much extra work on any such device.

The best way to hook up the interrupt into i2c-dev is probably
to provide a poll() callback for waiting for an interrupt, which
signals POLLMSG, plus a new i2c-dev ioctl that is used to clear the
interrupt state.

	Arnd
