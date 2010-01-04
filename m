From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH 06/11] arm-dt: postpone machine detection until setup_arch
	with CONFIG_ARM_DEVTREE
Date: Tue, 05 Jan 2010 01:36:19 +0900
Message-ID: <4B421903.4050200@simtec.co.uk>
References: <1261479296.247430.731563214048.6.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1261479296.247430.731563214048.6.gpush@pororo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jeremy Kerr <jeremy.kerr@canonical.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Jeremy Kerr wrote:
> When we're using CONFIG_ARM_DEVTREE, we need to postpone machine detection
> until later in setup_arch. Because ARM_DEVTREE depends on !DEBUG_LL,
> we don't need the mdesc this early anyway.
> 
> We'll add support for ARM_DEVTREE && DEBUG_LL later.

Why not add a specific machine type for 'this is device tree' and
then these routines don't even need to #ifdef. It would especially
be good as it allows dt and non-dt machines to coexist in the same
kernel together.

> Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>
> 
> ---
>  arch/arm/kernel/head.S |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index 38ccbe1..66bb56f 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -82,9 +82,18 @@ ENTRY(stext)
>  	bl	__lookup_processor_type		@ r5=procinfo r9=cpuid
>  	movs	r10, r5				@ invalid processor (r5=0)?
>  	beq	__error_p			@ yes, error 'p'
> +
> +	/* If we're using the device tree for machine detection, we don't
> +	 * look for a machinfo here, as we'll dynamically create one in
> +	 * setup_arch(). ARM_DEVTREE depends on !DEBUG_LL, so we won't need
> +	 * any machinfo fields 'til later.
> +	 */
> +#ifndef CONFIG_ARM_DEVTREE
>  	bl	__lookup_machine_type		@ r5=machinfo
>  	movs	r8, r5				@ invalid machine (r5=0)?
>  	beq	__error_a			@ yes, error 'a'
> +#endif
> +
>  	bl	__vet_atags
>  	bl	__create_page_tables
>  
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
