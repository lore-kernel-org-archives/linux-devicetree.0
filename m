From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: DT/OCTEON driver probing broken
Date: Sun, 28 Aug 2016 15:22:39 +0300
Message-ID: <20160828122239.GA14316@raspberrypi.musicnaut.iki.fi>
References: <20160816150056.GD18731@ak-desktop.emea.nsn-net.net>
 <0336fae0-1717-2f90-c221-6ef69f7024ee@leemhuis.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0336fae0-1717-2f90-c221-6ef69f7024ee-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
Cc: Aaro Koskinen <aaro.koskinen-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Aug 28, 2016 at 12:34:06PM +0200, Thorsten Leemhuis wrote:
> Lo! Kefeng, below report made it to the list of regression for 4.8, but
> afaics nothing happened after the initial report. Is there maybe some
> reason why it shouldn't be on the list of regressions at all? Or was the
> problem discussed elsewhere? Or is it even fixed already? I noticed
> https://git.kernel.org/torvalds/c/fc520f8b4f (of/platform: disable the
> of_platform_default_populate_init() for all the ppc board), but that
> change is PPC specific.

There is a fix proposal here:

	https://patchwork.linux-mips.org/patch/14041/

There is still few other boards remaining that use of_platform_bus_probe()
from device_initcall, but who knows, maybe they are not affected.

arch/microblaze/kernel/platform.c
arch/mips/mti-malta/malta-dt.c
arch/mips/netlogic/xlp/dt.c
arch/x86/platform/olpc/olpc_dt.c

A.

> On 16.08.2016 17:00, Aaro Koskinen wrote:
> > Hi,
> > 
> > Commit 44a7185c2ae6 ("of/platform: Add common method to populate default
> > bus") added new arch_initcall of_platform_default_populate_init() that
> > will be called before device_initcall octeon_publish_devices(). Now the
> > of_platform_bus_probe() called in octeon_publish_devices() is apparently
> > doing nothing:
> > 
> > [   52.331353] calling  octeon_publish_devices+0x0/0x14 @ 1
> > [   52.331358] OF: of_platform_bus_probe()
> > [   52.331362] OF:  starting at: /
> > [   52.331378] OF: of_platform_bus_create() - skipping /soc@0, already populated
> > [   52.331394] initcall octeon_publish_devices+0x0/0x14 returned 0 after 29 usecs
> > 
> > This also means that USB etc. won't get probed.
> > 
> > Any ideas what would be the proper fix for this? Changing
> > octeon_publish_devices() to arch_initcall seems to work but that may be
> > a bit hackish... Also, there might be also other MIPS boards affected
> > (arch/mips/netlogic/xlp/dt.c, arch/mips/mti-malta/malta-dt.c).
> > 
> > A.
> > 
> > http://news.gmane.org/find-root.php?message_id=20160816150056.GD18731%40ak-desktop.emea.nsn-net.net 
> > http://mid.gmane.org/20160816150056.GD18731%40ak-desktop.emea.nsn-net.net
> > 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
