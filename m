From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V6 4/5] arm: mm: Add support for PJ4B cpu and init routines
Date: Wed, 21 Nov 2012 15:13:07 +0000
Message-ID: <20121121151307.GN11990@mudshark.cambridge.arm.com>
References: <1353509970-5237-1-git-send-email-gregory.clement@free-electrons.com>
 <1353509970-5237-5-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353509970-5237-5-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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

On Wed, Nov 21, 2012 at 02:59:29PM +0000, Gregory CLEMENT wrote:
> PJ4B is an implementation of the ARMv7 (such as the Cortex A9 for
> example) released by Marvell. This CPU is currently found in
> Armada 370 and Armada XP SoCs. This patch provides a support for the
> specific initialization of this CPU.
> 
> Signed-off-by: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/mach-mvebu/Kconfig |    2 +-
>  arch/arm/mm/Kconfig         |    4 +++
>  arch/arm/mm/proc-v7.S       |   66 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 79299cd..f4c3bf8 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -21,7 +21,7 @@ menu "Marvell SOC with device tree"
>  config MACH_ARMADA_370_XP
>  	bool
>  	select ARMADA_370_XP_TIMER
> -	select CPU_V7
> +	select CPU_PJ4B
>  
>  config MACH_ARMADA_370
>  	bool "Marvell Armada 370 boards"
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 94186b6..3fd629d 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -352,6 +352,10 @@ config CPU_PJ4
>  	select ARM_THUMBEE
>  	select CPU_V7
>  
> +config CPU_PJ4B
> +	bool
> +	select CPU_V7
> +
>  # ARMv6
>  config CPU_V6
>  	bool "Support ARM V6 processor" if ARCH_INTEGRATOR || MACH_REALVIEW_EB || MACH_REALVIEW_PBX
> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
> index 846d279..1aa3891 100644
> --- a/arch/arm/mm/proc-v7.S
> +++ b/arch/arm/mm/proc-v7.S
> @@ -169,6 +169,62 @@ __v7_ca15mp_setup:
>  	orreq	r0, r0, r10			@ Enable CPU-specific SMP bits
>  	mcreq	p15, 0, r0, c1, c0, 1
>  #endif
> +
> +__v7_pj4b_setup:
> +#ifdef CONFIG_CPU_PJ4B
> +
> +/* Auxiliary Debug Modes Control 1 Register */
> +#define STATIC_BP     (1 << 2) /* Enable Static BP */
> +#define INTER_PARITY  (1 << 8) /* Disable Internal Parity Handling */
> +#define BCK_OFF_STREX (1 << 5) /* Enable the back off of STREX instr */
> +#define CLEAN_LINE    (1 << 16) /* Disable data transfer for clean line */
> +
> +/* Auxiliary Debug Modes Control 2 Register */
> +#define FAST_LDR      (1 << 23) /* Disable fast LDR */
> +#define SNOOP_DATA    (1 << 25) /* Do not interleave write and snoop data */
> +#define CWF           (1 << 27) /* Disable Critical Word First feature */
> +#define OUTSANDING_NC (1 << 29) /* Disable outstanding non cacheable request */

OUTSTANDING

> +#define L1_REP_RR     (1 << 30) /* L1 replacement - Strict round robin */
> +#define AUX_DBG_CTRL2 (SNOOP_DATA | CWF | OUTSANDING_NC | L1_REP_RR)
> +
> +/* Auxiliary Functional Modes Control Register 0 */
> +#define SMP_CFB         (1 << 1) /* Set SMP mode. Join the coherency fabric */
> +#define L1_PAR_CHK      (1 << 2) /* Support L1 parity checking */
> +#define BROADCAST_CACHE (1 << 8) /* Broadcast Cache and TLB maintenance */
> +
> +/* Auxiliary Debug Modes Control 0 Register */
> +#define WFI_WFE         (1 << 22) /* WFI/WFE - serve the DVM and back to idle */

It's probably worth prefixing these with PJ4B as well, since they don't
apply to other CPUs supported in this file.

Will
