From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] arm: Fix conversion to early_init_dt_scan() for non-DT
 platforms
Date: Thu, 03 Oct 2013 11:37:52 -0500
Message-ID: <524D9D60.7000804@gmail.com>
References: <1380804633-14130-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1380804633-14130-1-git-send-email-broonie@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@linaro.org>
List-Id: devicetree@vger.kernel.org

On 10/03/2013 07:50 AM, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Commit 67a964490bfd14 (arm: use early_init_dt_scan) in the OF tree in
> -next converts ARM to use early_init_dt_scan(), factoring out some common
> code. However it ignores the return value of the function meaning that on
> non-DT platforms the kernel fails to boot as it attempts to configure
> itself using DT.
> 
> Fix this by adding the appropriate return value check.

I have this fixed already in my tree. I had not pushed out my -next
branch with the fix, but have done so now.

Rob

> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  arch/arm/kernel/devtree.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index 04050f7..67f4ebe 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -198,7 +198,8 @@ const struct machine_desc * __init setup_machine_fdt(unsigned int dt_phys)
>  	if (!dt_phys)
>  		return NULL;
>  
> -	early_init_dt_scan(phys_to_virt(dt_phys));
> +	if (!early_init_dt_scan(phys_to_virt(dt_phys)))
> +		return NULL;
>  
>  	/* Search the mdescs for the 'best' compatible value match */
>  	dt_root = of_get_flat_dt_root();
> 
