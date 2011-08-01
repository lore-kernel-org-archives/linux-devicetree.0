From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCHv3] mtd: gpio-nand: add device tree bindings
Date: Mon, 1 Aug 2011 15:39:50 -0500
Message-ID: <20110801153950.634eb432@schlenkerla.am.freescale.net>
References: <1312207374-14760-1-git-send-email-jamie@jamieiles.com>
	<20110801133825.0b4fff24@schlenkerla.am.freescale.net>
	<20110801193316.GA2648@pulham.picochip.com>
	<20110801151209.7b904320@schlenkerla.am.freescale.net>
	<20110801202536.GB2648@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110801202536.GB2648-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 1 Aug 2011 21:25:36 +0100
Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> On Mon, Aug 01, 2011 at 03:12:09PM -0500, Scott Wood wrote:
> > It looks like the code uses a little-endian accessor (readw) in a couple
> > places.  The instance in gpio_nand_readbuf16() should never be reached
> > since the NAND layer should never do an unaligned buffer read, but the one
> > in gpio_nand_verifybuf16() could cause problems.
[snip]
> 
> OK, so for this should I just document that all accesses are 
> little-endian?  We can then add properties later if we need something 
> different.

Right now, the driver is using a mix of native and little endian accesses.
That's not something the binding can fix. :-)

Native endian is what it should be.

> > Or perhaps the io sync address should just be a physical address, not a reg
> > that gets translated.
> 
> OK, I like the sound of that.  I'm a bit new to the world of device tree 
> so I'm not sure of the best way to do this.  Would reading the 
> #address-cells property then use of_read_number() be the right way?

I'd just unconditionally define it as a 64-bit physical address.

-Scott
