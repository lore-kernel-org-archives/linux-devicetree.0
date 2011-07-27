From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
Date: Wed, 27 Jul 2011 16:01:37 -0500
Message-ID: <20110727160137.4cb98970@schlenkerla.am.freescale.net>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
	<20110727144501.7e0420cd@schlenkerla.am.freescale.net>
	<20110727195512.GC3001@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110727195512.GC3001@gallagher>
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

On Wed, 27 Jul 2011 20:55:12 +0100
Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> Hmm, get_maintainer.pl got Artem's address wrong (old Nokia address) for 
> gpio-nand.c so correct one on CC now!
> 
> On Wed, Jul 27, 2011 at 02:45:01PM -0500, Scott Wood wrote:
> > On Wed, 27 Jul 2011 15:03:30 +0100
> > Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/gpio-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> > > new file mode 100644
> > > index 0000000..98cb152
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> > > @@ -0,0 +1,43 @@
> > > +GPIO assisted NAND flash
> > > +
> > > +Required properties:
> > > +- compatible : "gpio-nand"
> > > +- reg : should specify localbus chip select and size used for the chip.  For
> > > +  ARM platforms where a dummy read is needed to provide synchronisation with
> > > +  regards to bus reordering, an optional second resource describes the
> > > +  location to read from.
> > 
> > I don't see how a pure "gpio nand" device would have any memory mapped
> > I/O.  I think you need a more specific compatible for this.
> 
> OK, fair point.  I'm not sure what a better name would be though, maybe 
> gpio-assisted-nand?

Not sure, but if the name is generic at all the binding should thorougly
describe what is expected of the hardware.

-Scott
