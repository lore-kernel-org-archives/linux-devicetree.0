From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 0/5] arm64: Initial Realtek RTD1295 enablement
Date: Tue, 5 Sep 2017 00:09:10 +0200
Message-ID: <068148b5-7add-96e5-dc6d-4597527a6c35@suse.de>
References: <20170514022429.11555-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170514022429.11555-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 14.05.2017 um 04:24 schrieb Andreas Färber:
> This mini-series adds initial support for the Realtek RTD1295 SoC and
> the Zidoo X9S TV box.
> 
> v3 changes #address-cells, #size-cells and ranges.
> 
> With these patches CPU0 can be booted with earlycon.
> 
> PSCI doesn't work despite present in the vendor device tree; as enable-method
> it instead used a custom "rtk-spin-table" that I sadly have no source code of.

Synology has now published source code for RTD1293/1296. This has
allowed me to narrow the RTD1295 CPU1..3 issue down to two changes in
arch/arm64/kernel/smp_spin_table.c:smp_spin_table_cpu_prepare():

1) writel_relaxed() instead of writeq_relaxed()
2) ioremap() instead of ioremap_cache()

Without those changes it hangs in earlycon after this line:
[    0.043674] Mountpoint-cache hash table entries: 4096 (order: 3,
32768 bytes)

The size difference sounds easy enough - we could introduce an optional
cpu-release-size property to handle this or derive a "spin-table-32bit"
enable-method to that effect.

The second one appears to be caused by PROT_NORMAL vs.
PROT_DEVICE_nGnRE. Is there any simple check we could do on
cpu-release-addr to choose which MT to use?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=113954c6463d1d80a206e91627ae49711f8b47cd

Any other ideas?

[...]
> The boot process is slightly twisted: The files need to be loaded from a
> 32-bit U-Boot, then boot into 64-bit U-Boot where the kernel can be booted.
> Similar to my previous Amlogic S905 work, the TEXT_OFFSET poses a problem, so
> a uImage needs to be used (or the kernel patched) for load address 0x00280000.
> I haven't succeeded loading an initrd via bootm/booti; but as quick workaround
> initrd=$rootfs_loadaddr,0x$filesize can manually be specified in $bootargs.
> 
> Cf. https://en.opensuse.org/HCL:Zidoo_X9S
> 
> More experimental patches at:
> https://github.com/afaerber/linux/commits/rtd1295-next
[snip]

My above branch includes the above spin-table hack for now.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
