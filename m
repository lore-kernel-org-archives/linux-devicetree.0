From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V6 1/5] arm: mvebu: Add support for coherency fabric in
 mach-mvebu
Date: Wed, 21 Nov 2012 15:15:56 +0000
Message-ID: <20121121151556.GO11990@mudshark.cambridge.arm.com>
References: <1353509970-5237-1-git-send-email-gregory.clement@free-electrons.com>
 <1353509970-5237-2-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353509970-5237-2-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <Leif.Lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWOunwaRDDq4rA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2012 at 02:59:26PM +0000, Gregory CLEMENT wrote:
> diff --git a/arch/arm/mach-mvebu/coherency_ll.S b/arch/arm/mach-mvebu/coherency_ll.S
> new file mode 100644
> index 0000000..74272b6
> --- /dev/null
> +++ b/arch/arm/mach-mvebu/coherency_ll.S
> @@ -0,0 +1,49 @@
> +/*
> + * Coherency fabric: low level functions
> + *
> + * Copyright (C) 2012 Marvell
> + *
> + * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + *
> + * This file implements the assembly function to add a CPU to the
> + * coherency fabric. This function is called by each of the secondary
> + * CPUs during their early boot in an SMP kernel, this why this
> + * function have to callable from assembly. It can also be called by a
> + * primary CPU from C code during its boot.
> + */
> +
> +#include <linux/linkage.h>
> +#define ARMADA_XP_CFB_CTL_REG_OFFSET 0x0
> +#define ARMADA_XP_CFB_CFG_REG_OFFSET 0x4
> +
> +	.text
> +/*
> + * r0: Coherency fabric base register address
> + * r1: HW CPU id
> + */
> +ENTRY(ll_set_cpu_coherent)
> +	/* Create bit by cpu index */
> +	mov	r3, #(1 << 24)
> +	lsl     r1, r3, r1
> +
> +	/* Add CPU to SMP group - Atomic */
> +	add	r3, r0, #ARMADA_XP_CFB_CTL_REG_OFFSET
> +	ldr     r2, [r3]
> +	orr     r2, r2, r1
> +	str	r2, [r0]

This should be storing to [r3] but you get away with it because your
immediate offset evaluates to zero.

If you fix that:

  Reviewed-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

Will
