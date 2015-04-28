From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [tty:tty-testing 9/30] drivers/of/fdt.c:807:2: error: implicit
 declaration of function 'fdt_path_offset_namelen'
Date: Tue, 28 Apr 2015 09:26:05 -0400
Message-ID: <553F8A6D.9040404@hurleysoftware.com>
References: <201504282048.WK91FDRR%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201504282048.WK91FDRR%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[ +cc Rob H, Grant L, devicetree ]

On 04/28/2015 08:24 AM, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
> head:   962a6a5ce6b8280d6ce7416ce57a36103d31a523
> commit: 5a95cfdfaf5cb960ea06f333323dbe85ed269abf [9/30] of: earlycon: Fix 'stdout-path' with ':' path terminator
> config: microblaze-mmu_defconfig (attached as .config)
> reproduce:
>   wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>   chmod +x ~/bin/make.cross
>   git checkout 5a95cfdfaf5cb960ea06f333323dbe85ed269abf
>   # save the attached .config to linux build tree
>   make.cross ARCH=microblaze 
> 
> All error/warnings:
> 
>    drivers/of/fdt.c: In function 'early_init_dt_scan_chosen_serial':
>>> drivers/of/fdt.c:807:2: error: implicit declaration of function 'fdt_path_offset_namelen' [-Werror=implicit-function-declaration]
>      offset = fdt_path_offset_namelen(fdt, p, (int)(q - p));
>      ^
>    cc1: some warnings being treated as errors

Greg,

This error occurs because the patch "libfdt: Add fdt_path_offset_namelen()"
has not been upstreamed yet by the devicetree maintainers.

Please back out commits 5a95cfdfaf5c ("of: earlycon: Fix 'stdout-path' with ':' path terminator")
through 865f9cc509db ("of: earlycon: Log more helpful message if earlycon not found")
from tty-testing.

I'll just resend the series when the situation with the missing
commit has been sorted.

Regards,
Peter Hurley

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
