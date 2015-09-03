From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: st_fdma: Firmware filename in DT?
Date: Thu, 3 Sep 2015 15:49:44 +0100
Message-ID: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob, Pawel, Mark, Ian and Kumar,

Quick question regarding this series here
https://lkml.org/lkml/2015/7/8/832. and the proposed
st,fw-name binding.

What are the rules with putting firmware names into DT?
Is it allowed? If yes, is it worth having a generic binding?

>From what I can see TI are using: -
    ti,pm-firmware in wkup_m3_rproc.c

and Freescale are using: -
    fsl,sdma-ram-script-name in imx-sdma.c

So other platforms seem to be putting firmware names into DT,
there are probably other examples.

Most other STi drivers keep the firmware name in the C code, which is
usually my first preference. However with fdma it is more complicated
as there are seperate firmware files for each instance of the IP block.

Currently also the same IP block "fdma_mpe31" is used on a number
of different SoC's but each firmware is named: -

 fdma_<SoC>_<instancenum>.elf

e.g. fdma_STiH407_0.elf

So currently all we need to provide is a different firmware name in DT
for the new SoC and the driver "just works".

Presumably the alternative would be to add a whole bunch of compatibles
in the driver for each SoC, where the only difference from a
functional point of view would be to help build the correct string for
the firmware filename. However I'm also then wondering what the best way
would be to find out the instance name of the IP.

We could do it by parsing the node name e.g. fdma0-audio, or by adding
a "instance" DT property to the node?

Any guidance you can provide on the recommend "most correct" method
from a DT point of view would be very greatfully received :-)

regards,

Peter.







--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
