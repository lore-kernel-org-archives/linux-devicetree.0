From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 09:46:13 +0100
Message-ID: <20150904084613.GA2315@griffinp-ThinkPad-X1-Carbon-2nd>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Many thanks for your thoughts on the issue.

On Thu, 03 Sep 2015, Rob Herring wrote:

> +devicetree-spec as a good question to separate from the fire hose.
> 
> On Thu, Sep 3, 2015 at 9:49 AM, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Hi Rob, Pawel, Mark, Ian and Kumar,
> >
> > Quick question regarding this series here
> > https://lkml.org/lkml/2015/7/8/832. and the proposed
> > st,fw-name binding.
> 
> Thanks for looking at the bigger picture.
> 
> > What are the rules with putting firmware names into DT?
> 
> Whatever you can sneak in without DT maintainers noticing...

:) I appear to have fallen at the first hurdle!

> 
> > Is it allowed?
> 
> They are already there as you have found, so yes. But should they be
> allowed? Possibly. I'm not saying no, but do have some concerns.

I was hoping you would have a strong opinion either for or against...

> 
> > If yes, is it worth having a generic binding?
> 
> If we decide it is a good idea, then yes. It doesn't look that hard to
> arrive at something common.
> 
> Strictly speaking, the firmware name is just an agreed upon name
> between the kernel and userspace. So why tie that into DT? Would other
> OS's use it or want something different? What if we started including
> paths in the names like <soc>/<firmware file>? Now we are imposing a
> directory structure on the OS filesystem.

To answer a few of your questions in terms of STi chipsets..

For FDMA at least it seems reasonable to tie it into the DT, as like I said
the same IP block 'fdma_mpe31' is used on multiple SoC's, where the only
difference is location of the IP in the memory map, and the firmware filename
which is loaded.

I'm not 100% sure if we have different firmware files
for various SoC's just because they are statically linked or if there
are other differences in the firmware. It could be that some of the IP
differences are in a way abstracted away from Linux due to the firmware.
In reality it doesn't matter as as have no visibility of the firmware
source code, so it is essentially a black box from our perspective and from
Linux's PoV the IP is the same, and all the driver code which interacts
with the firmware is the same. 

Regarding other OS's, way back when Windows CE was a thing and ran on STi
SH4 chipsets, these same fdma firmwares were used. So they are in theory 
(at least in the past) used by other OS's. In reality these days AFAIK Linux
really is the only primary OS used on STi platforms, with other RTOS's
running on the co-processors.

Regarding paths we certainly don't require the pathname. I would propose
that is up to the primary OS, to figure out the pathnames to check once it
has been given the filename.

Certainly Linux does this currently, and it seems like a reasonable assumption
to make of the primary OS. Like you say I don't think we want to impose
directory structure on the OS filesystem, as Android, Windows CE etc will
all have different ideas about where these things should live.

> 
> We'd also need to consider firmware that is needed to boot. In that
> case, we could include firmware binary directly in the dtb. I think
> that has been done before, but not in any standard way. u-boot FIT
> images happen to be DTBs containing mostly binary blobs.

For STi we don't have any, or any that are required to boot are loaded
by primary and secondary bootloaders.

Are you proposing there should be a DT property which means the
firmware is actually in the DTB and can be pulled out at boot by the
kernel?

If so it sounds like it could be a useful feature for some platforms, but
not one which we require AFAIK.

> 
> > From what I can see TI are using: -
> >     ti,pm-firmware in wkup_m3_rproc.c
> >
> > and Freescale are using: -
> >     fsl,sdma-ram-script-name in imx-sdma.c
> >
> > So other platforms seem to be putting firmware names into DT,
> > there are probably other examples.
> >
> > Most other STi drivers keep the firmware name in the C code, which is
> > usually my first preference. However with fdma it is more complicated
> > as there are seperate firmware files for each instance of the IP block.
> >
> > Currently also the same IP block "fdma_mpe31" is used on a number
> > of different SoC's but each firmware is named: -
> >
> >  fdma_<SoC>_<instancenum>.elf
> >
> > e.g. fdma_STiH407_0.elf
> >
> > So currently all we need to provide is a different firmware name in DT
> > for the new SoC and the driver "just works".
> >
> > Presumably the alternative would be to add a whole bunch of compatibles
> > in the driver for each SoC, where the only difference from a
> > functional point of view would be to help build the correct string for
> > the firmware filename. However I'm also then wondering what the best way
> > would be to find out the instance name of the IP.
> 
> If the name/path is Linux specific, then that is probably what we should do.

We don't need a path, and the firmware name isn't Linux specific per se. However
I've written some patches which work fine avoiding the need to have the fw name in
DT. See end of this email for an example.

I'm inclined to go with this approach, as it is I believe uncontroversial and
doesn't require a new firmware DT binding.

> 
> You could perhaps make a policy that firmware files be named by
> compatible string. So rather than translating from matching compatible
> to an arbitrary file name, you enforce file name is "<vendor>,<ip
> block>.fw" or something. I know we don't have policy in the kernel,
> but we already have it with hardcoded file names and search paths.

Whilst being a neat solution, I don't think changing the firmware filenames
is the way to go.

I suspect it will be the same for other vendors in that firmwares come
from many various teams throughtout the company, and getting them all to
change to a DT centric naming scheme is not realistic.

IMHO we should treat the firmware as a unchangeable black box, and that
includes the filename it is shipped with. It is certinaly well outside 
my sphere of influence to change.

> > We could do it by parsing the node name e.g. fdma0-audio, or by adding
> > a "instance" DT property to the node?
> 
> Generally we try to avoid caring about node names. Having some index
> or numbering also comes up which we also try to avoid. Generally, if
> you care about which instance you use for something, then there is
> some property you care about and should add.

I can't see any other way of doing it other than adding a "st,fdma-id" property,
or parsing the node name. The fdma-id isn't arbitary it matches the controller
number in the datasheet. There are no other useful properties I can see
which we need to add (possibly due to any differences being abstracted
away into the firmware). I opted for "st,fdma-id" property, as parsing the node
name seems like it would be fragile. The DT node now looks like this: -

fdma0: fdma0-audio@8e20000 {
	compatible = "st,stih407-fdma-mpe31";
	reg = <0x8e20000 0x20000>;
	interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
	dma-channels = <16>;
	#dma-cells = <3>;
	st,fdma-id = <0>;
	clocks = <&clk_s_c0_flexgen CLK_FDMA>,
		 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
		 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
		 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
	clock-names = "fdma_slim",
		      "fdma_hi",
		      "fdma_low",
		      "fdma_ic";
};

I'm inclined to go with this "firmware name not in DT" approach, unless I get
a strong endorsement from someone such as yourself that having the name in DT is
acceptable.

regards,

Peter.
