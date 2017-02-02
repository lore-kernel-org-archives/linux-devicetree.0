From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2] EDAC: mpc85xx: Add T2080 l2-cache support
Date: Fri, 03 Feb 2017 10:55:33 +1100
Message-ID: <87h94cb11m.fsf@concordia.ellerman.id.au>
References: <20170201231624.28843-1-chris.packham@alliedtelesis.co.nz> <20170201232735.byk7bnpeoqtcc7mh@pd.tnic> <01fe1af463c640a8bd48e45c2752b52c@svr-chch-ex1.atlnz.lc> <20170202173005.gqesvy5owtsbrviu@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170202173005.gqesvy5owtsbrviu-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "linux-edac@vger.kernel.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "morbidrsa@gmail.com" <morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> writes:

> On Wed, Feb 01, 2017 at 11:46:23PM +0000, Chris Packham wrote:
>> >> diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
>> >> index 8f66cbed70b7..67f7bc3fe5b3 100644
>> >> --- a/drivers/edac/mpc85xx_edac.c
>> >> +++ b/drivers/edac/mpc85xx_edac.c
>> >> @@ -629,6 +629,7 @@ static const struct of_device_id mpc85xx_l2_err_of_match[] = {
>> >>  	{ .compatible = "fsl,p1020-l2-cache-controller", },
>> >>  	{ .compatible = "fsl,p1021-l2-cache-controller", },
>> >>  	{ .compatible = "fsl,p2020-l2-cache-controller", },
>> >> +	{ .compatible = "fsl,t2080-l2-cache-controller", },
>> >
>> > WARNING: DT compatible string "fsl,t2080-l2-cache-controller" appears un-documented -- check ./Documentation/devicetree/bindings/
>> > #58: FILE: drivers/edac/mpc85xx_edac.c:632:
>> > +       { .compatible = "fsl,t2080-l2-cache-controller", },
>> >
>> > What is checkpatch.pl trying to tell me here?
>> >
>> 
>> checpkatch.pl is confused by 
>> Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt which says
>> 
>> - compatible    : Should include "fsl,chip-l2-cache-controller" and "cache"
>>                    where chip is the processor (bsc9132, npc8572 etc.)
>> 
>> So none of the fsl cache controllers pass the checkpatch.pl test.
>
> Hmm, so others do list those names explicitly. For example:
>
> Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
>
> And the patch that added that check to cp:
>
> bff5da433525 ("checkpatch: add DT compatible string documentation checks")
>
> is basically to enforce explicit compatible names.
>
> So I'd like to have an ACK from a PPC maintainer here first before I
> apply this.

It's fine with me:

Acked-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>


Chris if you want to send a patch to add the compatible string to the
l2cache.txt I would merge that, but honestly it doesn't achieve much
other than possibly catching a typo in the compatible name.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
