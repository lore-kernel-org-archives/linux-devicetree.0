From: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH 1/4] mtd: nand: gpio: Determine bus width automatically
Date: Wed, 24 Jul 2013 17:28:04 +0400
Message-ID: <20130724172804.373309617f46b6e66a1085c0@mail.ru>
References: <1374582499-31823-1-git-send-email-shc_work@mail.ru>
 <CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 23 Jul 2013 23:42:08 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Jul 23, 2013 at 5:28 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> > This patch provide automatically determine of bus width. If resource size,
> > supplied to the driver more than 1 byte, the NAND_BUSWIDTH_AUTO option
> > will be used in the MTD core.
> 
> I presume this depends on the bugfix I sent for NAND_BUSWIDTH_AUTO /
> nand_set_defaults()? That's worth noting (as I am right now), for
> whenever someone gets around to merging this.

OK.

[...]
> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > index 36ef07d..287b8b8 100644
> > --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > @@ -8,15 +8,14 @@ Required properties:
> >  - compatible : "gpio-control-nand"
> >  - reg : should specify localbus chip select and size used for the chip.  The
> >    resource describes the data bus connected to the NAND flash and all accesses
> > -  are made in native endianness.
> > +  are made in native endianness. Bus width of the device is determined
> > +  automatically if size > 1. If size = 1, 8 bit bus width will be used.
> >  - #address-cells, #size-cells : Must be present if the device has sub-nodes
> >    representing partitions.
> >  - gpios : specifies the gpio pins to control the NAND device.  nwp is an
> >    optional gpio and may be set to 0 if not present.
> >
> >  Optional properties:
> > -- bank-width : Width (in bytes) of the device.  If not present, the width
> > -  defaults to 1 byte.
> 
> Do you really want to remove this property entirely? I'm not sure what
> the policy is on this. And it may still be useful to leave in the
> documentation, since older drivers (and potentially non-Linux OS?) may
> still need the property. Maybe you can mark it as optional, and that
> it may be ignored entirely.

I redid it, I'll do option "bank-width" optional.

[...]
> > +       if (of_find_property(dev->of_node, "bank-width", NULL))
> > +               dev_notice(dev, "Property \"bank-width\" is deprecated");
> 
> If you don't totally kill this property (per my comments above), then
> you probably don't want this message either. It's probably safe to
> just ignore the property, if we can reliably auto-detect it instead.

What do you say about such changes in the patch 4/4?
Thanks.

[...]

-- 
Alexander Shiyan <shc_work@mail.ru>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
