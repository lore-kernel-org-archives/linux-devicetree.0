From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 4/8] arm/dt: probe for platforms via the device tree
Date: Mon, 2 May 2011 08:15:42 -0700
Message-ID: <20110502151542.GG2092@atomide.com>
References: <20110429070135.12522.35745.stgit@ponder>
	<20110429071548.12522.56929.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110429071548.12522.56929.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> [110429 00:13]:
> +
> +/**
> + * setup_machine_fdt - Machine setup when an dtb was passed to the kernel
> + * @dt_phys: physical address of dt blob
> + *
> + * If a dtb was passed to the kernel in r2, then use it to choose the
> + * correct machine_desc and to setup the system.
> + */
> +struct machine_desc * __init setup_machine_fdt(unsigned int dt_phys)
> +{
...

> +
> +	/* Retrieve various information from the /chosen node */
> +	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);

Just to make sure we're considering properly what this change means..

Does this patch require using CONFIG_CMDLINE_FORCE for older bootloaders
with the device tree append patch?

Or should we still somehow get ATAG_CMDLINE let's say in the uncompress
code and use that if nothing else is found?

Otherwise booting old boards with the same kernel will be painful as
it requires a kernel recompile to set the cmdline..

Also, not counting the separate DT append issues, I got things booting
with these patches (and the dts files) on omaps. So for patches 1 - 5,
and patch 8:

Tested-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>

I don't have versatile or tegra, so can't test those :)
