From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: parameter initrd must override FDT initrd
Date: Sat, 11 Jan 2014 16:52:24 +0100
Message-ID: <20140111155224.GP9681@lunn.ch>
References: <2b2c04$57762f@icp-osb-irony-out4.iinet.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <2b2c04$57762f@icp-osb-irony-out4.iinet.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: klightspeed@killerwolves.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 11, 2014 at 10:03:58AM +1000, klightspeed@killerwolves.net wrote:
> The initrd_start and initrd_end as set by FDT was overriding
> the phys_initrd_start and phys_initrd_size set by the initrd=
> kernel parameter.  This patch will ignore the initrd_start
> and initrd_end set earlier if phys_initrd_start and
> phys_initrd_size (as set by the initrd= parameter) are set.
> 
> Signed-off-by: Ben Peddell <klightspeed@killerwolves.net>

Hi Ben

Since this is a fix, it is a good idea to put Fix somewhere in the
subject.  You should also try to say which patch broke it. Looking at
the git logs, i think it was 65939301acdb1e593fdb424bd356f0b9bc7ba5be
"arm: set initrd_start/initrd_end for fdt scan" which came from Rob
Herring <rob.herring@calxeda.com>. I added Rob to CC.

	Andrew

> ---
>  arch/arm/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 1f7b19a..819c539 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -345,10 +345,11 @@ void __init arm_memblock_init(struct meminfo *mi,
>  #endif
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	/* FDT scan will populate initrd_start */
> -	if (initrd_start) {
> +	if (initrd_start && !phys_initrd_size) {
>  		phys_initrd_start = __virt_to_phys(initrd_start);
>  		phys_initrd_size = initrd_end - initrd_start;
>  	}
> +	initrd_start = initrd_end = 0;
>  	if (phys_initrd_size &&
>  	    !memblock_is_region_memory(phys_initrd_start, phys_initrd_size)) {
>  		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
> -- 
> 1.8.3.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
