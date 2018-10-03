From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v5 7/8] dt-binding: mtd: Document gpio-addr-flash
Date: Thu, 4 Oct 2018 00:19:24 +0200
Message-ID: <20181004001924.3644185d@bbrezillon>
References: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
        <20181003193859.23928-7-ricardo.ribalda@gmail.com>
        <20181003232702.4c18e725@bbrezillon>
        <CAPybu_3M75E9c+JmR7MVKsyv3vYPOrZ6qBABtvEF317KA+roBg@mail.gmail.com>
        <20181004001415.224d53fe@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004001415.224d53fe@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 4 Oct 2018 00:14:15 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Wed, 3 Oct 2018 23:53:27 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> 
> > Hi Boris
> > On Wed, Oct 3, 2018 at 11:27 PM Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:  
> > >
> > > On Wed,  3 Oct 2018 21:38:58 +0200
> > > Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> > >    
> > > > Add documentation for gpio-addr-flash. This binding allow creating
> > > > flash devices that are paged using GPIOs.
> > > >
> > > > Cc: devicetree@vger.kernel.org
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > > > ---
> > > >  .../bindings/mtd/gpio-addr-flash.txt          | 54 +++++++++++++++++++
> > > >  1 file changed, 54 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > > > new file mode 100644
> > > > index 000000000000..5006a26e1753
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > > > @@ -0,0 +1,54 @@
> > > > +Memory Mapped flash with some address lines addressed using GPIOs
> > > > +
> > > > +Handle the case where a flash device is mostly addressed using physical
> > > > +line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
> > > > +to a 2MiB memory range and use the GPIOs to select a particular range.
> > > > +
> > > > + - compatible : "cfi-gpio-addr-flash"
> > > > + - reg : Address range of the mtd chip that is memory mapped, this is,
> > > > +   on the previous example 2MiB.
> > > > + - bank-width : Width (in bytes) of the bank.  Equal to the
> > > > +   device width times the number of interleaved chips.
> > > > + - gpios: List of GPIO specifiers that will be used to address the MSBs address
> > > > +   lines. The order goes from LSB to MSB.
> > > > + - probe-type : (optional) "cfi_probe", "jedec_probe". How the mtd chip
> > > > +   is going to be probed. If omitted, assumed to be equal to "cfi_probe".    
> > >
> > > Looks like other bindings are encoding the probe type in the
> > > compatible [1][2], and we should probably follow what's been done by
> > > others.    
> > 
> > If I understood it right, they are special cases of physmap_of_core.c
> > https://elixir.bootlin.com/linux/v4.18.11/source/drivers/mtd/maps/physmap_of_core.c#L242
> > 
> > The driver that handles the compatible is physmap_of_core.c, and afaik
> > multiple drivers with the same
> > compatible string is a very bad idea.  
> 
> Yes, I know.
> 
> > 
> > We can convert the driver to something like Versatile or gemini, but
> > then we will not support platform devices
> > 
> > btw, the binding that I am used is used by:
> > https://elixir.bootlin.com/linux/v4.18.11/source/drivers/mtd/maps/physmap_of_core.c#L91  
> 
> Actually, the more I think about it the more I realize this should
> somehow be integrated to the physmap core logic. I mean, there's nothing
> controller/platform specific in what the gpio-physmap driver does.
> 
> We could basically add the msb_addr_gpios related fields to map_info,
> let physmap.c and physmap_of_core.c call
> devm_gpiod_get_array_optional() and, based on the returned value,
> call simple_map_init() (when the pointer is NULL) or
> gpio_addr_map_init() (when the pointer is valid).

Or even better, let simple_map_init() call gpio_addr_map_init() when
map->addr_gpios != NULL, so that you don't even have to duplicate the
selection logic in physmap.c and physmap_of_core.c.

> 
> gpio_addr_map_init() would still be implemented in gpio-addr-flash.c so
> that we can still enable/disable support for this feature (providing
> dummy wrappers when it's disabled). By doing that, we also keep a single
> driver which matches a generic compatible string. We also stay
> compatible with .c based board files.
