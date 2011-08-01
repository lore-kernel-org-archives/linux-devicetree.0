From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCHv3] mtd: gpio-nand: add device tree bindings
Date: Mon, 1 Aug 2011 15:12:09 -0500
Message-ID: <20110801151209.7b904320@schlenkerla.am.freescale.net>
References: <1312207374-14760-1-git-send-email-jamie@jamieiles.com>
	<20110801133825.0b4fff24@schlenkerla.am.freescale.net>
	<20110801193316.GA2648@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20110801193316.GA2648@pulham.picochip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 1 Aug 2011 20:33:16 +0100
Jamie Iles <jamie@jamieiles.com> wrote:

> OK, fair points.  I'm not sure what to say about endianness though.  
> Host byte order accesses are used in the driver so can I just specify 
> this?  We could add a property later to support endianess swapping, but 
> I don't want to add too much that I can't test.

If the assumption is host endian, that's fine, just document it.

It looks like the code uses a little-endian accessor (readw) in a couple
places.  The instance in gpio_nand_readbuf16() should never be reached
since the NAND layer should never do an unaligned buffer read, but the one
in gpio_nand_verifybuf16() could cause problems.

The implementation in nand_base.c uses readw(), but at least it uses it
consistently between read_buf16(), write_buf16(), and verify_buf16().
readsw()/writesw() do not appear to do byte swapping, at least on powerpc,
while readw() does.

Even so, the generic implementation could read data that is byte-reversed
from what another implementation wrote, or vice versa.  I wonder if there
are any big-endian platforms with 16-bit NAND that use the generic buffer
functions -- doesn't look like it from a quick glance.

> > What if some other binding wants to add additional reg resources, while
> > still being backwards compatible with this binding?  Might be better to
> > move the sync into its own property -- something like "gpio-nand-io-sync =
> > <1>" indicating that it's in reg resource #1.  And maybe it should require
> > some PXA-specific compatible if io-sync is needed.  Even if another chip
> > requires some sort of sync hack, would it necessarily work the same?
> 
> Hmm, I'm not convinced there - the sync is to protect against bus 
> ordering, and a read from the right region does that.  I'm working on 
> another ARM platform (not PXA) that needs this sync so sure it's not PXA 
> specific.

OK, though if you think this will be common enough to include in the
generic binding, is it only going to appear on ARM chips?

What about using a "gpio-nand-io-sync" property instead of assuming that if
there's a second reg resource, it must be this?

> The alternative is to not have this specified in the binding and have 
> the platform attach the resource.

That doesn't sound ideal.

> On my platform for example I need to 
> read from the GPIO controller registers and I can't find a way to 
> express this when using ranges...

I think on that platform you should not specify gpio-control-nand in the
compatible.  Have the driver or platform code match on a specific
compatible, and then do whatever is appropriate internally to Linux to make
it work.

Or perhaps the io sync address should just be a physical address, not a reg
that gets translated.

-Scott


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
