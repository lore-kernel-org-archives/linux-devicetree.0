From: Kushwaha Prabhakar-B32579 <B32579-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH][v2] powerpc/85xx:Add BSC9131 RDB Support
Date: Wed, 21 Mar 2012 17:45:12 +0000
Message-ID: <071A08F2C6A57E4E94D980ECA553F8745B298F@039-SN1MPN1-004.039d.mgd.msft.net>
References: <1331973588-29896-1-git-send-email-prabhakar@freescale.com>
 <6E492C67-B422-46B2-9A8E-C1E9B6C534E7@kernel.crashing.org>
 <071A08F2C6A57E4E94D980ECA553F8745B28E5@039-SN1MPN1-004.039d.mgd.msft.net>
 <F67F01CF-E431-42B7-BA59-EBC6A792FC69@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <F67F01CF-E431-42B7-BA59-EBC6A792FC69-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Srivastava Rajan-B34330 <B34330-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mehresh Ramneek-B31383 <B31383-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Goyal Akhil-B35197 <B35197-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jain Priyanka-B32167 <B32167-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Kumar for clarifying my doubts.

> -----Original Message-----
> From: Kumar Gala [mailto:galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org]
> Sent: Wednesday, March 21, 2012 11:08 PM
> To: Kushwaha Prabhakar-B32579
> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> Jain Priyanka-B32167; Mehresh Ramneek-B31383; Srivastava Rajan-B34330;
> Goyal Akhil-B35197
> Subject: Re: [PATCH][v2] powerpc/85xx:Add BSC9131 RDB Support
> 
> 
> On Mar 21, 2012, at 12:29 PM, Kushwaha Prabhakar-B32579 wrote:
> 
> >>
> >>
> >> [snip]
> >>
> >
> > ??
> > Not getting you..
> 
> Just meant, I was removing parts of the patch in the email to reduce
> things.
> 

Oh :)


> >
> >>> diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
> >>> b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
> >>> new file mode 100644
> >>> index 0000000..611c289
> >>> --- /dev/null
> >>> +++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
> >>> @@ -0,0 +1,95 @@
> >>> +/*
> >>> + * BSC913xRDB Board Setup
> >>> + *
> >>> + * Author: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >>> + *
> >>> + * Copyright 2011-2012 Freescale Semiconductor Inc.
> >>> + *
> >>> + * This program is free software; you can redistribute  it and/or
> >>> +modify it
> >>> + * under  the terms of  the GNU General  Public License as
> >>> +published by the
> >>> + * Free Software Foundation;  either version 2 of the  License, or
> >>> +(at your
> >>> + * option) any later version.
> >>> + */
> >>> +
> >>> +#include <linux/of_platform.h>
> >>> +#include <linux/pci.h>
> >>> +#include <asm/mpic.h>
> >>> +#include <sysdev/fsl_soc.h>
> >>> +#include <asm/udbg.h>
> >>> +
> >>> +void __init bsc913x_rdb_pic_init(void) {
> >>> +	struct mpic *mpic;
> >>> +	struct resource r;
> >>> +	struct device_node *np;
> >>> +
> >>> +	np = of_find_node_by_type(NULL, "open-pic");
> >>> +	if (!np) {
> >>> +		pr_err("bsc913x: Could not find open-pic node\n");
> >>> +		return;
> >>> +	}
> >>> +
> >>> +	if (of_address_to_resource(np, 0, &r)) {
> >>> +		pr_err("bsc913x: Failed to map mpic register space\n");
> >>> +		of_node_put(np);
> >>> +		return;
> >>> +	}
> >>> +
> >>> +	mpic = mpic_alloc(np, r.start, MPIC_WANTS_RESET |
> >>> +	  MPIC_BIG_ENDIAN | MPIC_BROKEN_FRR_NIRQS | MPIC_SINGLE_DEST_CPU,
> >>> +	  0, 256, " OpenPIC  ");
> >>> +
> >>> +	of_node_put(np);
> >>> +
> >>> +	if (!mpic)
> >>> +		pr_err("bsc913x: Failed to allocate MPIC structure\n");
> >>> +	else
> >>> +		mpic_init(mpic);
> >>> +}
> >>> +
> >>
> >> This code is still out of date w/other board ports.  Have you tried
> >> building this against upstream??
> >>
> >
> > I build with powerpc.git.
> > do you mean build with upstream code base ??
> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> >
> 
> I mean if you use my 'next' branch of galak/powerpc.git and apply this
> patch, and enable it.  For example MPIC_BROKEN_FRR_NIRQS doesn't exist
> anymore
> 


I did on master branch. I will check on "next" branch and if required send new patch version.

--Prabhakar
