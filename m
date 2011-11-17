From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: vexpress: Add DT support in v2m
Date: Thu, 17 Nov 2011 16:05:37 +0000
Message-ID: <20111117160536.GU9581@n2100.arm.linux.org.uk>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-4-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321036026-23411-4-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
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

On Fri, Nov 11, 2011 at 06:27:04PM +0000, Pawel Moll wrote:
> +#if defined(CONFIG_ARCH_VEXPRESS_DT)
> +		int err;
> +		const char *path;
> +		struct device_node *node;
> +
> +		node = of_find_compatible_node(NULL, NULL, "arm,sp810");
> +		BUG_ON(!node);
> +		sysctl_base = of_iomap(node, 0);
> +		BUG_ON(!sysctl_base);
> +
> +		err = of_property_read_string(of_aliases, "timer", &path);
> +		BUG_ON(err);
> +		node = of_find_node_by_path(path);
> +		BUG_ON(!node);
> +		timer01_base = of_iomap(node, 0);
> +		BUG_ON(!timer01_base);
> +		timer01_irq = irq_of_parse_and_map(node, 0);

Are you sure you have enough BUG_ON()s there?  It's well worth reading
Linus' various messages on the use of BUG(), which can be found:

	http://yarchive.net/comp/linux/BUG.html

The lack of the timer and sysctl registers are really a 'report and maybe
we could get a message out' kind of scenario rather than a 'oops, kill
the machine'.

> +#endif
> +	} else {
>  		sysctl_base = ioremap(V2M_SYSCTL, SZ_4K);
>  		BUG_ON(!sysctl_base);
>  		timer01_base = ioremap(V2M_TIMER01, SZ_4K);
>  		BUG_ON(!timer01_base);
>  		timer01_irq = IRQ_V2M_TIMER0;
> +	}

And in any case, both these paths have a common set of BUG_ON()s:
	BUG_ON(!sysctl_base);
	BUG_ON(!timer01_base);

So do we really need them having this independently?

> @@ -383,11 +412,18 @@ static struct clk_lookup v2m_lookups[] = {
>  	},
>  };
>  
> +static void __init v2m_system_id(void)
> +{
> +	if (!system_rev)
> +		system_rev = readl(v2m_sysreg_base + V2M_SYS_ID);

You do understand that system_rev is for the system _revision_ not for
some kind of system ID.  For example, it's to identify whether we're on
a revision 4, 5 or 6 system.

However, with DT the differences in system revision should be encoded
into the DT itself, and the kernel should not be making choices about
the hardware off this.
