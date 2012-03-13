From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] gpio: Add Altera GPIO driver
Date: Tue, 13 Mar 2012 12:13:24 -0600
Message-ID: <20120313181324.EBBA83E053B@localhost>
References: <1328551142-8439-1-git-send-email-tklauser@distanz.ch>
	<20120312160418.816A83E07B0@localhost>
	<20120313113126.GL21503@distanz.ch>
Reply-To: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
In-Reply-To: <20120313113126.GL21503-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
List-Unsubscribe: <http://sopc.et.ntust.edu.tw/cgi-bin/mailman/options/nios2-dev>,
	<mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sopc.et.ntust.edu.tw/pipermail/nios2-dev>
List-Post: <mailto:nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
List-Help: <mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=help>
List-Subscribe: <http://sopc.et.ntust.edu.tw/cgi-bin/mailman/listinfo/nios2-dev>,
	<mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=subscribe>
Sender: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Errors-To: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Mar 2012 12:31:26 +0100, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org> wrote:
> On 2012-03-12 at 17:04:18 +0100, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > On Mon,  6 Feb 2012 18:59:02 +0100, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org> wrote:
> > > This driver supports the Altera PIO core.
> > > 
> > > Signed-off-by: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
> > > Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
> > > ---
> > > This driver was submitted already about a year ago by Thomas, was
> > > adjusted by him according to some remarks made by Grant and was then
> > > included in the -mm tree [1] for some time but dropped again
> > > (couldn't find out when and why exactly).
> > > 
> > > [0] http://article.gmane.org/gmane.linux.drivers.devicetree/4231
> > > [1] http://article.gmane.org/gmane.linux.kernel.commits.mm/65119
> > > 
> > > So this is a new attempt towards getting this driver into mainline
> > > from the nios2 tree. The following changes have been made atop the
> > > version submitted by Thomas:
> > > 
> > > - Changed driver name to new naming convention
> > > - Usage of of_property_read_u32 in the probe function
> > 
> > This looks like a pretty generic memory-mapped gpio chip.  It should use the
> > gpio-generic infrastructure instead of open-coding all of the accessor hooks.
> 
> Thanks a lot for the hint.
> 
> I'm trying to figure out how this could work together with
> of_mm_gpio_chip which we use in the driver. Both bgpio_chip and
> of_mm_gpio_chip contain a struct gpio_chip, so I suppose we can only
> "be" either one of them in our driver? What would be the prefered way to
> do this?

Hmmm, you are correct.  However, of_mm_gpio_chip() is the only part of
drivers/of/gpio.c that isn't usable by gpio-generic.c.  Focus on gpio-generic.

> Also as we need to register the driver from platform specific setup code
> (in the out-of-mainline nios2 port only atm) very early on, we don't
> have a struct platform_device or struct device available which we would
> need to pass to bgpio_init. What's the best way to solve this?

There are 2 halves to gpio-generic.  The library of helper functions (get/set/etc.)
and the basic-mmio-gpio device driver.  It /should/ be safe to call bgpio_init without
a struct platform_device, but right now the code doesn't protect against it.  That is
a bug that you can easily fix.

However, why are you initializing it very early in platform specific code?  That is
very strongly discouraged.  GPIO controllers are just another device.

> And another issue I came across: gpio-generic only seems to support
> 8/16/32/64 bit wide GPIO registers. The Altera GPIO controller can have
> from 1 to 32 bits per register depending on the configuration in the
> FPGA (though it will still always be a 32bit register). In bgpio_init
> the size passed is checked for being a number of 2 and the number then
> written to the bits member. What would be the best way to still
> determine the "real" number of GPIOs available in the driver then?

The gpio-generic code is a work in progress; feel free to submit patches to get
it to behave the way you need it to.  Ultimately, I want all simple mm gpio drivers
to use gpio-generic.

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
