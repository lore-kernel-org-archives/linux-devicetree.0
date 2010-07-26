From: "Lorenzo Pieralisi" <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: RE: [PATCH] arm/dt: Fix booting non-dt versatile
Date: Mon, 26 Jul 2010 10:08:46 +0100
Message-ID: <10842.6908300773$1280136389@news.gmane.org>
References: <20100723201336.20683.88973.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100723201336.20683.88973.stgit@angua>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant, Jeremy,

> -----Original Message-----
> From: devicetree-discuss-
> bounces+lorenzo.pieralisi=arm.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org [mailto:devicetree-
> discuss-bounces+lorenzo.pieralisi=arm.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf
> Of Grant Likely
> Sent: 23 July 2010 21:14
> To: jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: [PATCH] arm/dt: Fix booting non-dt versatile
> 
> Without this patch, versatilepb will not boot in qemu
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
> 
> Hi Jeremy,
> 
> I'm not sure if this is the best fix or not, but without it I cannot
> boot
> versatilepb anymore in QEMU.
> 
> g.
> 
>  arch/arm/kernel/head.S |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index 8683b3b..049d533 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -93,7 +93,7 @@ ENTRY(stext)
>  	 * Also, we don't need to call __vet_atags.
>  	 */
>  	add	r3, r1, #1
> -	bcs	1f
> +	beq	1f
> 
>  	bl	__lookup_machine_type		@ r5=machinfo
>  	movs	r8, r5				@ invalid machine (r5=0)?
> 

I think the issue is the add instruction not the conditional jump here.
It needs to be an "adds" to update the flags so the carry.
With beq (or bcs) you are jumping on a condition set by the movs a few lines
before, beq does not jump because the movs before did not set the zero flag
otherwise you wouldn't be executing that code, you would have branched to
__error_p. 
Please let me know if it works I have not tested so I might be wrong.

Patches for versatile express coming, 

Cheers,
Lorenzo
