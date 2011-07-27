From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH] basic-mmio-gpio: add support for device tree
Date: Wed, 27 Jul 2011 15:05:02 -0500
Message-ID: <20110727150502.2dca210f@schlenkerla.am.freescale.net>
References: <1311776656-6755-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311776656-6755-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
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

On Wed, 27 Jul 2011 15:24:16 +0100
Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> This patch adds support for basic-mmio-gpio controllers to be
> instantiated from the device tree.  It's RFC at the moment because I'm
> really not happy with the way that the registers are described (zero
> size meaning the register is not present).  In a previous discussion
> (https://lkml.org/lkml/2011/5/4/117) Grant suggested using a reg
> property to describe the whole controller then arrays of reg-offset
> values for multiple banks e.g:
> 
> 	gpio@fedc0000 {
> 		compatible = "acme,super-soc-gpio", "mmio-gpio";
> 		reg = <0xfedc0000 0x100>;
> 		gpio-controller;
> 		#gpio-cells = <1>;
> 
> 		mmgpio-regoffset-data = <0x00 0x04 0x08 0x0c>;
> 		mmgpio-regoffset-dir  = <0x20 0x24 0x28 0x2c>;
> 		mmgpio-regoffset-set  = <0x10 0x14 0x18 0x1c>;
> 		mmgpio-regoffset-clr  = <0x30 0x34 0x38 0x3c>;
> 	};
> 
> but this loses the hierarchy as Anton pointed out, so I've tried this
> approach instead.

How does it lose hierarchy versus an unnamed, ordered list?

Consider the likelihood of new types of reg being added to try to jam new
controllers into this "generic" model.

> +Required properties:
> +- compatible : "basic-mmio-gpio"
> +- #gpio-cells : Should be two. The first cell is the pin number and the
> +  second cell is used to specify optional parameters (currently unused).
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- regs : The register addresses for the registers in the controller.  The
> +  registers should be listed in the following order:
> +	- dat
> +	- set
> +	- clr
> +	- dirout
> +	- dirin
> +  registers that are not present in the controller should have a zero size.

If you're defining something so generic, you should provide as much detail
as a hardware manual would -- ordering of GPIO bits within a word,
polarity, word size (can there be multiple words for each reg type?), what
does it mean when certain registers are present/absent, etc.  Don't make
people refer to the Linux driver source.

> +Optional properties:
> +- basic-mmio-gpio,big-endian : big-endian register accesses should be used.
> +- basic-mmio-gpio,nr-gpio : the number of GPIO pins in the controller.

What is the driver supposed to do with a node that doesn't have nr-gpio?

-Scott
