From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 3/4] powerpc/mpc85xx: Add FSL QorIQ DPAA BMan support to device tree(s)
Date: Wed, 03 Dec 2014 20:42:50 +0100
Message-ID: <7923839.hEiWgLtlCl@wuerfel>
References: <1417428135-12895-1-git-send-email-Emilian.Medve@Freescale.com> <1417566777.15957.227.camel@freescale.com> <547EC183.2070005@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547EC183.2070005-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hai-Ying Wang <Haiying.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chunhe Lan <Chunhe.Lan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 03 December 2014 01:53:39 Emil Medve wrote:
> On 12/02/2014 06:32 PM, Scott Wood wrote:
> > On Mon, 2014-12-01 at 04:02 -0600, Emil Medve wrote:
> >> diff --git a/arch/powerpc/boot/dts/t4240rdb.dts b/arch/powerpc/boot/dts/t4240rdb.dts
> >> index 53761d4..431bf4e 100644
> >> --- a/arch/powerpc/boot/dts/t4240rdb.dts
> >> +++ b/arch/powerpc/boot/dts/t4240rdb.dts
> >> @@ -69,10 +69,27 @@
> >>              device_type = "memory";
> >>      };
> >>  
> >> +    reserved-memory {
> >> +            #address-cells = <2>;
> >> +            #size-cells = <2>;
> >> +            ranges;
> >> +
> >> +            bman_fbpr: bman-fbpr {
> >> +                    compatible = "fsl,bman-fbpr";
> >> +                    alloc-ranges = <0 0 0xffff 0xffffffff>;
> >> +                    size = <0 0x1000000>;
> >> +                    alignment = <0 0x1000000>;
> >> +            };
> >> +    };
> > 
> > Can't this be done at the SoC level rather than board level?
> 
> The size of the memory is not SoC specific. Among other things is
> determined by the number of MACs that are pinned-out on the board
> 

Is this really a hardware property then, or some setting?

Also, if you use the name 'ranges', I would assume that the second
set of two cells is a length and should be <0 0 0x10000 0>.

Finally, you add a label here, so anything that is not board
specific could just stay in the per-soc file, with the board
specific properties added at teh board level.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
