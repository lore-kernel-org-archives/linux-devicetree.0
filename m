From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: vexpress: Remove platform SMP functions from
 ct_desc
Date: Thu, 17 Nov 2011 15:31:02 +0000
Message-ID: <20111117153102.GQ9581@n2100.arm.linux.org.uk>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-3-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321036026-23411-3-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2011 at 06:27:03PM +0000, Pawel Moll wrote:
> This patch removes platform SMP callbacks from ct_desc struct
> and replaces them with global symbols in preparation for
> DT-based support code.

Will and myself discussed how to do this, and we came up with the
ct_desc solution.  Now you're doing something different.  It seems to
me like there's a disconnect between various different parts of ARM Ltd
between people who have different ideas about how problems are to be
solved.

So, what's the technical reason for this change?

I can't see how this improves anything.  In fact, this patch reintroduces
a bug which have been previously fixed:

> +static void ct_ca9x4_init_cpu_map(void)
> +{
> +	int i, ncores;
> +	ncores = scu_get_core_count(V2T_PERIPH_P2V(A9_MPCORE_SCU));
> +
> +	for (i = 0; i < ncores; ++i)
> +		set_cpu_possible(i, true);
> +
> +	set_smp_cross_call(gic_raise_softirq);
> +}
vs
> -static void ct_ca9x4_init_cpu_map(void)
> -{
> -	int i, ncores = scu_get_core_count(V2TILE_PERIPH_P2V(A9_MPCORE_SCU));
> -
> -	if (ncores > nr_cpu_ids) {
> -		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
> -			ncores, nr_cpu_ids);
> -		ncores = nr_cpu_ids;
> -	}
> -
> -	for (i = 0; i < ncores; ++i)
> -		set_cpu_possible(i, true);
> -
> -	set_smp_cross_call(gic_raise_softirq);
> -}

When you rebase, please pay better attention to the conflicts.
