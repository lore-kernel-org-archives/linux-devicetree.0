From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx: replace magic number with pin
 function name
Date: Thu, 21 Feb 2013 22:43:03 +0100
Message-ID: <20130221214303.GB1906@pengutronix.de>
References: <1361344089-16804-1-git-send-email-shawn.guo@linaro.org>
 <1361344089-16804-3-git-send-email-shawn.guo@linaro.org>
 <51251A11.2030300@wwwdotorg.org>
 <CAKGA1bkHH1XC38_VM=QhDrr33uqqSbwe0n+GfXEPs43K_Do=CQ@mail.gmail.com>
 <20130221050247.GD17738@S2101-09.ap.freescale.net>
 <CAKGA1bn22xctSj_33HQsWwnVB=RO2OJ=eYvgRD-kF+PiQcnC4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bn22xctSj_33HQsWwnVB=RO2OJ=eYvgRD-kF+PiQcnC4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux ARM Kernel ML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2013 at 11:36:36AM -0600, Matt Sealey wrote:
> On Wed, Feb 20, 2013 at 11:02 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Feb 20, 2013 at 06:03:39PM -0600, Matt Sealey wrote:
> >> I am not sure I am getting this point across, but.. damn it.. nack nack nack :D
> >>
> > Do you see any downgrade side that the series introduces over the
> > existing implementation?
> 
> Because it replaces the horribly stupid existing implementation with
> something that doesn't solve the fundamental logical problems caused
> by the existing implementation. There are three completely obvious
> logical inconsistencies with the existing implementation of a pair of
> <arbitrary_pin_index pad_mode>;
> 
> 1) the pin index is completely arbitrary and in any binding every
> published for any of these SoC, either broken by design (MX5 and MX6
> have duplicated pin data soaking up arbitrary pin ids in the current
> binding, or are not defined in SoC register order (i.e. arbitrary
> renumbering).

The pin index is indeed completely arbitrary, mostly because the iomuxv3
does not make it possible to number pins. More sane SoCs offered that,
there a Pin number could be easily translated into a register offset. I
don't know what drugs the FSL engineers have taken to come up with a
register layout in which each pin is configured via three register sets
which do not stand in any relationship to each other.

Unfortunately the pinctrl framework forces us to use a pin index as it
needs something to detect resource conflicts. BUT, I think I agree here
with you: This pin number should not be exposed to the devicetree, it
only adds a level of indirection.

> 
> 2) the pin index is not internally consistent within the device tree
> binding - it is a reference to an array inside source code. Your patch
> hopes to solve this, but also hopes to solve other things too. It
> fails on the second part.
> 
> 3) the pad setting value has been hijacked to include bits that
> otherwise would not be set in the same register (SION bit and a
> special flag to mean, set up everything except the pad settings)
> 
> What you've fixed it to do, as I read this patch, is this;
> 
> <arbitrary_pin_name pad_mode>
> 
> which the preprocessor expands to;
> 
> <reg_mux mux_mode reg_insel insel_mode reg_pad pad_mode>
> 
> The real problem here is as follows;
> 
> 1) the pin name and function name are still completely arbitrary (in
> so far as the old iomux.h macros way, the newer iomux-v3.h way, the
> current bindings and the new binding you're pushing do not match the
> CPU documentation at all)
> 
> 2) copy pasting a line of 5 values from an example document and adding
> your pad mode bits to the end is no more time consuming or
> space-consuming than copying a 38-character macro name. New board
> designs will use data from the FSL IOMUX tool or other sources and not
> bother using macro definitions to define pads.
> 
> 3) macros can be wrong and they will inherit into every device tree,
> breaking every board that uses them. That said, so can the examples,
> but at least reading the device tree for a board you can cross-check
> all the values against, say, the output of many tools provided by
> Freescale or existing code or platform support without doing a back
> reference or preprocessing the device tree and removing comments).
>

Yes, macros can be wrong, but they tend to get fixed. Duplicated
information almost never gets fixed in all instances they occur.

> 
> MX51_PIN_EIM_23__GPIO1_2 0x6528
> 
> <
> MUX_REG(0x174) ALT(0x5|SION) INS_REG(0x3d8) INS(0x7) PAD_REG(0x654)
> PAD(0x7633|PU_100K), /* MX51_EIM_23 GPIO1_2 */
> >;

This is basically what the current iomux header do, only that we added
the mux/padctrl/selinput register triplet to a single macro. This in my
eyes still makes sense, because digging through the datasheet guessing
that for a single pin I have to configure registers 0x174, 0x3d8 and
0x654 is cumbersome.

Where it became ugly is the predefined values for pullup/dse.

Yes, I would really like to have something like you describe above in
the devicetree together with the register triplets as handy macros.
Also I still like the <pinname>__<function> naming since that's another
thing I don't have to look up in the datasheet everytime.
If your data comes from the iomux tool then you simply wouldn't use the
register triplet macros.

This would leave the question how we make up a pin number for the
pinctrl framework, but as said, this should be solved inside the kernel
and not pushed into the devicetree.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
