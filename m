From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] tty/serial: Relax the device_type restriction from
 of_serial
Date: Sat, 26 Feb 2011 08:40:50 +1100
Message-ID: <1298670050.8833.688.camel@pasglop>
References: <20110223021221.17638.42707.stgit@localhost6.localdomain6>
	 <AANLkTinx2YxOs3Y-XDHaWe44Bw8HqiMyanouV5Bo3KuX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinx2YxOs3Y-XDHaWe44Bw8HqiMyanouV5Bo3KuX@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Fri, 2011-02-25 at 12:22 -0700, Grant Likely wrote:
> Hi Arnd and Ben,
> 
> I forgot to cc you guys on this patch.  Greg has it in his tree, but I
> wanted to make sure you noticed it.  If you have any objections, let
> me know and I'll ask Greg to drop it.

No objection. Device-types are a thing of the past :-)

Cheers,
Ben.

> Thanks,
> g.
> 
> 
> On Tue, Feb 22, 2011 at 7:12 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
> > There is no need to test for a device_type property in ns8250
> > compatible serial ports.  device_type is an OpenFirmware property that
> > is not required when using the flattened tree representation.
> >
> > Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> > ---
> >  drivers/tty/serial/of_serial.c |   18 +++++++++---------
> >  1 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/tty/serial/of_serial.c b/drivers/tty/serial/of_serial.c
> > index 5c7abe4..6a18ca6 100644
> > --- a/drivers/tty/serial/of_serial.c
> > +++ b/drivers/tty/serial/of_serial.c
> > @@ -160,17 +160,17 @@ static int of_platform_serial_remove(struct platform_device *ofdev)
> >  * A few common types, add more as needed.
> >  */
> >  static struct of_device_id __devinitdata of_platform_serial_table[] = {
> > -       { .type = "serial", .compatible = "ns8250",   .data = (void *)PORT_8250, },
> > -       { .type = "serial", .compatible = "ns16450",  .data = (void *)PORT_16450, },
> > -       { .type = "serial", .compatible = "ns16550a", .data = (void *)PORT_16550A, },
> > -       { .type = "serial", .compatible = "ns16550",  .data = (void *)PORT_16550, },
> > -       { .type = "serial", .compatible = "ns16750",  .data = (void *)PORT_16750, },
> > -       { .type = "serial", .compatible = "ns16850",  .data = (void *)PORT_16850, },
> > +       { .compatible = "ns8250",   .data = (void *)PORT_8250, },
> > +       { .compatible = "ns16450",  .data = (void *)PORT_16450, },
> > +       { .compatible = "ns16550a", .data = (void *)PORT_16550A, },
> > +       { .compatible = "ns16550",  .data = (void *)PORT_16550, },
> > +       { .compatible = "ns16750",  .data = (void *)PORT_16750, },
> > +       { .compatible = "ns16850",  .data = (void *)PORT_16850, },
> >  #ifdef CONFIG_SERIAL_OF_PLATFORM_NWPSERIAL
> > -       { .type = "serial", .compatible = "ibm,qpace-nwp-serial",
> > -                                       .data = (void *)PORT_NWPSERIAL, },
> > +       { .compatible = "ibm,qpace-nwp-serial",
> > +               .data = (void *)PORT_NWPSERIAL, },
> >  #endif
> > -       { .type = "serial",                           .data = (void *)PORT_UNKNOWN, },
> > +       { .type = "serial",         .data = (void *)PORT_UNKNOWN, },
> >        { /* end of list */ },
> >  };
> >
> >
> >
> 
> 
> 
