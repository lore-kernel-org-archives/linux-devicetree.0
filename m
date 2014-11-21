From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv3 09/16] ARM: mvebu: implement suspend/resume support for
 Armada XP
Date: Fri, 21 Nov 2014 17:41:42 +0100
Message-ID: <20141121164142.GB20238@lunn.ch>
References: <1416585613-2113-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416585613-2113-10-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416585613-2113-10-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +static void mvebu_pm_store_bootinfo(void)
> +{
> +	u32 *store_addr;
> +	phys_addr_t resume_pc;
> +
> +	store_addr = phys_to_virt(BOOT_INFO_ADDR);
> +	resume_pc = virt_to_phys(armada_370_xp_cpu_resume);
> +
> +	/*
> +	 * The bootloader expects the first two words to be a magic
> +	 * value (BOOT_MAGIC_WORD), followed by the address of the
> +	 * resume code to jump to. Then, it expects a sequence of
> +	 * (address, value) pairs, which can be used to restore the
> +	 * value of certain registers. This sequence must end with the
> +	 * BOOT_MAGIC_LIST_END magic value.
> +	 */

Hi Thomas

Is this a well defined mechanism supported by mainline uboot, barebox
etc. Or is it some Marvell extension to their uboot?

     Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
