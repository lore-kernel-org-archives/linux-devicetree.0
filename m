From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH] basic-mmio-gpio: add support for device tree
Date: Wed, 27 Jul 2011 17:09:42 -0500
Message-ID: <20110727170942.787405a1@schlenkerla.am.freescale.net>
References: <1311776656-6755-1-git-send-email-jamie@jamieiles.com>
	<20110727150502.2dca210f@schlenkerla.am.freescale.net>
	<20110727201654.GD3001@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110727201654.GD3001@gallagher>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Jul 2011 21:16:54 +0100
Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> On Wed, Jul 27, 2011 at 03:05:02PM -0500, Scott Wood wrote:
> > On Wed, 27 Jul 2011 15:24:16 +0100
> > Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> > 
> > > This patch adds support for basic-mmio-gpio controllers to be
> > > instantiated from the device tree.  It's RFC at the moment because I'm
> > > really not happy with the way that the registers are described (zero
> > > size meaning the register is not present).  In a previous discussion
> > > (https://lkml.org/lkml/2011/5/4/117) Grant suggested using a reg
> > > property to describe the whole controller then arrays of reg-offset
> > > values for multiple banks e.g:
> > > 
> > > 	gpio@fedc0000 {
> > > 		compatible = "acme,super-soc-gpio", "mmio-gpio";
> > > 		reg = <0xfedc0000 0x100>;
> > > 		gpio-controller;
> > > 		#gpio-cells = <1>;
> > > 
> > > 		mmgpio-regoffset-data = <0x00 0x04 0x08 0x0c>;
> > > 		mmgpio-regoffset-dir  = <0x20 0x24 0x28 0x2c>;
> > > 		mmgpio-regoffset-set  = <0x10 0x14 0x18 0x1c>;
> > > 		mmgpio-regoffset-clr  = <0x30 0x34 0x38 0x3c>;
> > > 	};
> > > 
> > > but this loses the hierarchy as Anton pointed out, so I've tried this
> > > approach instead.
> > 
> > How does it lose hierarchy versus an unnamed, ordered list?
> 
> This doesn't allow you to represent the banks as child nodes.

Ah, I missed the multiple-bank aspect -- was thinking more of named versus
unnamed.

> > Consider the likelihood of new types of reg being added to try to jam new
> > controllers into this "generic" model.
> 
> Yes, that's what I don't like about the way I've done it.  We could have 
> something like:
> 
> 	gpio@1000 {
> 		compatible = "acme,super-soc-gpio", "mmio-gpio";
> 		reg = <0x1000 0x0100>;
> 
> 		banka: gpio@1000 {
> 			compatible = "mmio-gpio-bank";
> 			regoffset-data = <0x00>;
> 			regoffset-dir = <0x04>;
> 			...
> 		};
> 
> 		bankb: gpio@1020 {
> 			compatible = "mmio-gpio-bank";
> 			regoffset-data = <0x20>;
> 			regoffset-dir = <0x24>;
> 			...
> 		};
> 	};
> 
> instead perhaps?

Looks reasonable.

-Scott
