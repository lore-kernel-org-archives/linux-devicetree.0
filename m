From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv3] mtd: gpio-nand: add device tree bindings
Date: Mon, 1 Aug 2011 21:25:36 +0100
Message-ID: <20110801202536.GB2648@pulham.picochip.com>
References: <1312207374-14760-1-git-send-email-jamie@jamieiles.com>
	<20110801133825.0b4fff24@schlenkerla.am.freescale.net>
	<20110801193316.GA2648@pulham.picochip.com>
	<20110801151209.7b904320@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110801151209.7b904320-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 01, 2011 at 03:12:09PM -0500, Scott Wood wrote:
> On Mon, 1 Aug 2011 20:33:16 +0100
> Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> 
> > OK, fair points.  I'm not sure what to say about endianness though.  
> > Host byte order accesses are used in the driver so can I just specify 
> > this?  We could add a property later to support endianess swapping, but 
> > I don't want to add too much that I can't test.
> 
> If the assumption is host endian, that's fine, just document it.
> 
> It looks like the code uses a little-endian accessor (readw) in a couple
> places.  The instance in gpio_nand_readbuf16() should never be reached
> since the NAND layer should never do an unaligned buffer read, but the one
> in gpio_nand_verifybuf16() could cause problems.
> 
> The implementation in nand_base.c uses readw(), but at least it uses it
> consistently between read_buf16(), write_buf16(), and verify_buf16().
> readsw()/writesw() do not appear to do byte swapping, at least on powerpc,
> while readw() does.
> 
> Even so, the generic implementation could read data that is byte-reversed
> from what another implementation wrote, or vice versa.  I wonder if there
> are any big-endian platforms with 16-bit NAND that use the generic buffer
> functions -- doesn't look like it from a quick glance.

OK, so for this should I just document that all accesses are 
little-endian?  We can then add properties later if we need something 
different.

> > > What if some other binding wants to add additional reg resources, while
> > > still being backwards compatible with this binding?  Might be better to
> > > move the sync into its own property -- something like "gpio-nand-io-sync =
> > > <1>" indicating that it's in reg resource #1.  And maybe it should require
> > > some PXA-specific compatible if io-sync is needed.  Even if another chip
> > > requires some sort of sync hack, would it necessarily work the same?
> > 
> > Hmm, I'm not convinced there - the sync is to protect against bus 
> > ordering, and a read from the right region does that.  I'm working on 
> > another ARM platform (not PXA) that needs this sync so sure it's not PXA 
> > specific.
> 
> OK, though if you think this will be common enough to include in the
> generic binding, is it only going to appear on ARM chips?

Well there's only one in-tree user then the platform I'm working on 
which are both ARM platforms but it's conceivable that this could appear 
in an MFD or any other platform.  I don't think it makes sense to 
restrict it to ARM as it's a generic problem and _could_ happen on any 
other platform with bus reordering.

> What about using a "gpio-nand-io-sync" property instead of assuming that if
> there's a second reg resource, it must be this?
> 
> > The alternative is to not have this specified in the binding and have 
> > the platform attach the resource.
> 
> That doesn't sound ideal.
> 
> > On my platform for example I need to 
> > read from the GPIO controller registers and I can't find a way to 
> > express this when using ranges...
> 
> I think on that platform you should not specify gpio-control-nand in the
> compatible.  Have the driver or platform code match on a specific
> compatible, and then do whatever is appropriate internally to Linux to make
> it work.
> 
> Or perhaps the io sync address should just be a physical address, not a reg
> that gets translated.

OK, I like the sound of that.  I'm a bit new to the world of device tree 
so I'm not sure of the best way to do this.  Would reading the 
#address-cells property then use of_read_number() be the right way?

Thanks for your help with this Scott, it's much appreciated!

Jamie
