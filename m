From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: l2c: add options to overwrite prefetching
 behavior
Date: Thu, 11 Jun 2015 11:24:59 +0200
Message-ID: <20150611112459.6590ab05@free-electrons.com>
References: <1432941541-18588-1-git-send-email-hauke@hauke-m.de>
	<20150610172100.230c0e71@free-electrons.com>
	<55788F6B.7060406@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55788F6B.7060406-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory =?UTF-8?B?Q2zDqW1lbnQ=?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Hauke Mehrtens,

On Wed, 10 Jun 2015 21:26:35 +0200, Hauke Mehrtens wrote:

> Thanks for asking, I did not know Russell's patch process, but Florian
> guided me and now it is submitted, see
> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8391/1

I tested your patch, and I'm not sure how it can work for you, because
the changes made to the PREFETCH_CTRL register on the data/instruction
prefetch bits are later overridden by changes made to the AUX_CTRL
register.

Here is what I've found so far:

static void l2c_configure(void __iomem *base)
{
	if (outer_cache.configure) {
		outer_cache.configure(&l2x0_saved_regs);
		return;
	}

	if (l2x0_data->configure)
		l2x0_data->configure(base);

	l2c_write_sec(l2x0_saved_regs.aux_ctrl, base, L2X0_AUX_CTRL);
}

l2x0_data->configure() is what writes the PREFETCH_CTRL register with
the value determined in l2c310_of_parse() :

	if (revision >= L310_CACHE_ID_RTL_R2P0) {
		l2c_write_sec(l2x0_saved_regs.prefetch_ctrl, base,
			      L310_PREFETCH_CTRL);
	}

The value written in the L310_PREFETCH_CTRL register is correct: it
properly has bits 28/29 sets depending on prefetch-data/prefetch-instr.

However, when l2c_configure() does:

	l2c_write_sec(l2x0_saved_regs.aux_ctrl, base, L2X0_AUX_CTRL);

It writes l2x0_saved_regs.aux_ctrl to the AUX_CTRL register, which has
a "clone" of the prefetch data and prefetch instruction bits. And it
resets them to zero. I've added debug messages before/after this line,
and here is what I see:

[    0.000000]  ==> (1) prefetch is now 0x58800000
[    0.000000]  ==> (2) prefetch is now 0x48800000

I had enabled only the prefetch-data, so in step (1) (before aux_ctrl
is written to AUX_CTRL), bit 28 is correctly set to 1. However, after
AUX_CTRL is written, it's restored to 0.

How does your patch handles the fact that the prefetch data and
prefetch instr are cloned between PREFETCH_CTRL and AUX_CTRL ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
