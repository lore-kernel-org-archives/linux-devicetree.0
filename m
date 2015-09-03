From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Thu, 3 Sep 2015 16:45:35 -0500
Message-ID: <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+devicetree-spec as a good question to separate from the fire hose.

On Thu, Sep 3, 2015 at 9:49 AM, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Rob, Pawel, Mark, Ian and Kumar,
>
> Quick question regarding this series here
> https://lkml.org/lkml/2015/7/8/832. and the proposed
> st,fw-name binding.

Thanks for looking at the bigger picture.

> What are the rules with putting firmware names into DT?

Whatever you can sneak in without DT maintainers noticing...

> Is it allowed?

They are already there as you have found, so yes. But should they be
allowed? Possibly. I'm not saying no, but do have some concerns.

> If yes, is it worth having a generic binding?

If we decide it is a good idea, then yes. It doesn't look that hard to
arrive at something common.

Strictly speaking, the firmware name is just an agreed upon name
between the kernel and userspace. So why tie that into DT? Would other
OS's use it or want something different? What if we started including
paths in the names like <soc>/<firmware file>? Now we are imposing a
directory structure on the OS filesystem.

We'd also need to consider firmware that is needed to boot. In that
case, we could include firmware binary directly in the dtb. I think
that has been done before, but not in any standard way. u-boot FIT
images happen to be DTBs containing mostly binary blobs.

> From what I can see TI are using: -
>     ti,pm-firmware in wkup_m3_rproc.c
>
> and Freescale are using: -
>     fsl,sdma-ram-script-name in imx-sdma.c
>
> So other platforms seem to be putting firmware names into DT,
> there are probably other examples.
>
> Most other STi drivers keep the firmware name in the C code, which is
> usually my first preference. However with fdma it is more complicated
> as there are seperate firmware files for each instance of the IP block.
>
> Currently also the same IP block "fdma_mpe31" is used on a number
> of different SoC's but each firmware is named: -
>
>  fdma_<SoC>_<instancenum>.elf
>
> e.g. fdma_STiH407_0.elf
>
> So currently all we need to provide is a different firmware name in DT
> for the new SoC and the driver "just works".
>
> Presumably the alternative would be to add a whole bunch of compatibles
> in the driver for each SoC, where the only difference from a
> functional point of view would be to help build the correct string for
> the firmware filename. However I'm also then wondering what the best way
> would be to find out the instance name of the IP.

If the name/path is Linux specific, then that is probably what we should do.

You could perhaps make a policy that firmware files be named by
compatible string. So rather than translating from matching compatible
to an arbitrary file name, you enforce file name is "<vendor>,<ip
block>.fw" or something. I know we don't have policy in the kernel,
but we already have it with hardcoded file names and search paths.

> We could do it by parsing the node name e.g. fdma0-audio, or by adding
> a "instance" DT property to the node?

Generally we try to avoid caring about node names. Having some index
or numbering also comes up which we also try to avoid. Generally, if
you care about which instance you use for something, then there is
some property you care about and should add.

Rob
