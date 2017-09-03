From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] devicetree: Remove remaining references/tests for
 "chosen@0"
Date: Sun, 03 Sep 2017 22:02:34 +1000
Message-ID: <1504440154.2250.1.camel@kernel.crashing.org>
References: <alpine.LFD.2.21.1709020416130.13598@localhost.localdomain>
         <1504390854.4974.108.camel@kernel.crashing.org>
         <alpine.LFD.2.21.1709030637090.24875@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.21.1709030637090.24875-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Linux PPC Mailing List <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2017-09-03 at 06:43 -0400, Robert P. J. Day wrote:
>   however, given the diff stat of the change to remove every single
> reference to that node name in the current kernel source:
> 
>  arch/microblaze/kernel/prom.c | 3 +--
>  arch/mips/generic/yamon-dt.c  | 4 ----
>  arch/powerpc/boot/oflib.c     | 7 ++-----
>  drivers/of/base.c             | 2 --
>  drivers/of/fdt.c              | 5 +----
>  5 files changed, 4 insertions(+), 17 deletions(-)
> 
> it seems inconsistent that three architectures would be testing for
> that node, but none of the rest. consistency suggests that every
> architecture should take it into account, or none should.
> 
>   anyway, not a big deal, i'm fine with any decision.

powerpc is the only one of the 3 who has an actual open firmware
implementation afaik.

In any case, I think you can probably remove from microblaze and
possibly mips but I'm a bit worried about the generic case and powerpc
boot.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
