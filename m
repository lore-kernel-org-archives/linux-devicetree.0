From: Jeremy Kerr <jeremy.kerr@canonical.com>
Subject: Re: [PATCH 06/11] of/flattree: merge early_init_devtree() and early_init_move_devtree()
Date: Mon, 7 Dec 2009 15:08:25 +0800
Message-ID: <200912071508.25551.jeremy.kerr@canonical.com>
References: <20091124081316.6216.66310.stgit@angua> <20091124081853.6216.68105.stgit@angua>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20091124081853.6216.68105.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, microblaze-uclinux@itee.uq.edu.au, benh@kernel.crashing.org, sfr@canb.auug.org.au, davem@davemloft.net, monstr@monstr.eu
List-Id: devicetree@vger.kernel.org

Hi Grant,

> +	/* Scan memory nodes and rebuild LMBs */
> +	lmb_init();
> +	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
> +
> +	/* Save command line for /proc/cmdline and then parse parameters */
> +	strlcpy(boot_command_line, cmd_line, COMMAND_LINE_SIZE);
> +	parse_early_param();
> +
> +	/* This is in an arbitrary spot, but it is temporary.  After all
> +	 * the common code is merged, the structure of the early init
> +	 * code will be reevaluated and refactored */
> +	early_init_devtree_arch();
> +
> +	lmb_analyze();
> +	lmb_dump_all();

So we're assuming that the arch has lmb support, or should we make this 
conditional on CONFIG_HAVE_LMB?

Looks like ARM has its own lmb implementation (struct membank), so for the 
former case, I'd need to convert that to use lmb instead (which may not be a 
bad thing overall...)

Cheers,


Jeremy 
