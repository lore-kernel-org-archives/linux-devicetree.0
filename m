From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 3/4] powerpc/mpc85xx: Add FSL QorIQ DPAA BMan support
 to device tree(s)
Date: Wed, 3 Dec 2014 22:04:10 -0600
Message-ID: <1417665850.15957.237.camel@freescale.com>
References: <1417428135-12895-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1417566777.15957.227.camel@freescale.com> <547EC183.2070005@Freescale.com>
	 <7923839.hEiWgLtlCl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7923839.hEiWgLtlCl@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Emil Medve <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hai-Ying Wang <Haiying.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chunhe Lan <Chunhe.Lan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-12-03 at 20:42 +0100, Arnd Bergmann wrote:
> On Wednesday 03 December 2014 01:53:39 Emil Medve wrote:
> > On 12/02/2014 06:32 PM, Scott Wood wrote:
> > > On Mon, 2014-12-01 at 04:02 -0600, Emil Medve wrote:
> > >> diff --git a/arch/powerpc/boot/dts/t4240rdb.dts b/arch/powerpc/boot/dts/t4240rdb.dts
> > >> index 53761d4..431bf4e 100644
> > >> --- a/arch/powerpc/boot/dts/t4240rdb.dts
> > >> +++ b/arch/powerpc/boot/dts/t4240rdb.dts
> > >> @@ -69,10 +69,27 @@
> > >>              device_type = "memory";
> > >>      };
> > >>  
> > >> +    reserved-memory {
> > >> +            #address-cells = <2>;
> > >> +            #size-cells = <2>;
> > >> +            ranges;
> > >> +
> > >> +            bman_fbpr: bman-fbpr {
> > >> +                    compatible = "fsl,bman-fbpr";
> > >> +                    alloc-ranges = <0 0 0xffff 0xffffffff>;
> > >> +                    size = <0 0x1000000>;
> > >> +                    alignment = <0 0x1000000>;
> > >> +            };
> > >> +    };
> > > 
> > > Can't this be done at the SoC level rather than board level?
> > 
> > The size of the memory is not SoC specific. Among other things is
> > determined by the number of MACs that are pinned-out on the board
> > 

Oh, right.

> Is this really a hardware property then, or some setting?

It's sort of a gray area (as is the reserved-memory mechanism itself)...
The hardware technically allows software to choose the size of the
memory, but the size required to perform optimally is primarily
determined by the ethernet ports that are pinned out on a given board --
except for any extra memory required by accelerators.

I previously suggested an extension to the reserved-memory binding to
convey the fact that the region can potentially be sized differently:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2014-October/122300.html

In most cases the size calculated from the board's ethernet ports is
what is desired, so I think providing a sane default counts as hardware
description.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
