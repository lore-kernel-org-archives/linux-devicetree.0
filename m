From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] x86: convert to generic irq_domain
Date: Mon, 16 Jan 2012 09:16:03 -0700
Message-ID: <20120116161603.GD4223@ponder.secretlab.ca>
References: <1324099129-28832-1-git-send-email-robherring2@gmail.com>
 <20120115163538.GA19026@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120115163538.GA19026-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 15, 2012 at 05:35:38PM +0100, Sebastian Andrzej Siewior wrote:
> * Rob Herring | 2011-12-16 23:18:49 [-0600]:
> 
> >From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >
> >This is needed to avoid struct collisions with the generic irq_domain
> >support being added to kernel/irq/generic-chip.c.
> >
> >Boot tested, but not on a DT enabled platform.
> 
> If you add this piece into your patch:
> 
> From 34d9bb9b582136c8412e14ad870c8aaaa28c9e15 Mon Sep 17 00:00:00 2001
> From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Date: Sun, 15 Jan 2012 16:52:13 +0100
> Subject: [PATCH] fixup of "x86: convert to generic irq_domain"
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

It's a little late for 3.3, and I've got a major rework to irq_domain
almost ready which will get merged in 3.4.  I'll rework the patch on
top of that series and get you to retest.

g.

> ---
>  arch/x86/Kconfig             |    1 +
>  arch/x86/kernel/devicetree.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index d6f1e91..0d74f88 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -397,6 +397,7 @@ config X86_INTEL_CE
>  	select X86_REBOOTFIXUPS
>  	select OF
>  	select OF_EARLY_FLATTREE
> +	select IRQ_DOMAIN
>  	---help---
>  	  Select for the Intel CE media processor (CE4100) SOC.
>  	  This option compiles in support for the CE4100 SOC for settop
> diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
> index 5632e5b..41eb2a7 100644
> --- a/arch/x86/kernel/devicetree.c
> +++ b/arch/x86/kernel/devicetree.c
> @@ -4,6 +4,7 @@
>  #include <linux/bootmem.h>
>  #include <linux/export.h>
>  #include <linux/io.h>
> +#include <linux/irqdomain.h>
>  #include <linux/interrupt.h>
>  #include <linux/list.h>
>  #include <linux/of.h>
> -- 
> 
> you add my acked-by to it.
> 
> Sebastian
