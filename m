From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] ARM: kernel: fix nr_cpu_ids check in DT logical map init
Date: Thu, 22 Nov 2012 12:08:43 +0000
Message-ID: <20121122120843.GA16972@e102568-lin.cambridge.arm.com>
References: <1353516176-12929-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1353516176-12929-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Wed, Nov 21, 2012 at 04:42:56PM +0000, Lorenzo Pieralisi wrote:
> If a kernel is configured with a DT containing more /cpu nodes than
> nr_cpu_ids, the number of cpus must be capped in the DT parsing
> code. Current code carries out the check, but fails to cap the
> value and the check is executed after the cpu logical index is used,
> which can lead to memory corruption due to index overflow.
> 
> This patch refactors the check against nr_cpu_ids and move it before
> any computed index is used in the parsing code.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> ---
> Russell,
> 
> while refactoring the DT loop over nodes, I unfortunately missed this niggle
> in the parsing loop that Mark reported. Here is the fix, sorry for the
> additional commit, if it is ok for you I will add it to your patch system.
> 
> Apologies and thanks,
> Lorenzo
> 
>  arch/arm/kernel/devtree.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index aaf9add..70f1bde 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -139,10 +139,14 @@ void __init arm_dt_init_cpu_maps(void)
>  			i = cpuidx++;
>  		}
>  
> -		tmp_map[i] = hwid;
> -
> -		if (cpuidx > nr_cpu_ids)
> +		if (WARN(cpuidx > nr_cpu_ids, "DT /cpu %u nodes greater than "
> +					       "max cores %u, capping them\n",
> +					       cpuidx, nr_cpu_ids)) {
> +			cpuidx = nr_cpu_ids;
>  			break;
> +		}
> +
> +		tmp_map[i] = hwid;
>  	}
>  
>  	if (WARN(!bootcpu_valid, "DT missing boot CPU MPIDR[23:0], "

If it looks fine to you, can I queue this simple fix in your patch
system please ?

Thanks and apologies for the extra commit,
Lorenzo
