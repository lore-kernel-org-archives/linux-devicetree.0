From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 2/2] m32r: Add missing big-endian I/O accessors
Date: Fri, 28 Nov 2014 00:15:08 +0100
Message-ID: <3737870.23qKxazWvK@wuerfel>
References: <1417112193-14400-1-git-send-email-cernekee@gmail.com> <1417112193-14400-2-git-send-email-cernekee@gmail.com> <20141127222034.GB16647@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127222034.GB16647-q6ZYBFIlbFFi0tQiZxhdj1DQ4js95KgL@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hirokazu Takata <takata-TMSiXQfHlQjsTix1lMzHGQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 27 November 2014 14:20:34 Fengguang Wu wrote:
> Add CC to Hirokazu.
> 
> > Side note for Fengguang: both with and without my patches, m32r modules
> > fail to link using the make.cross script on Ubuntu 14.10:
>  
> Yes, the memory_start/memory_end link errors are really old m32r
> specific errors. The config file that can trigger this error is
> m32r-m32104ut_defconfig.

These should be trivial to fix:

diff --git a/arch/m32r/kernel/setup.c b/arch/m32r/kernel/setup.c
index 0392112a5d70..a5ecef7188ba 100644
--- a/arch/m32r/kernel/setup.c
+++ b/arch/m32r/kernel/setup.c
@@ -81,7 +81,10 @@ static struct resource code_resource = {
 };
 
 unsigned long memory_start;
+EXPORT_SYMBOL(memory_start);
+
 unsigned long memory_end;
+EXPORT_SYMBOL(memory_end);
 
 void __init setup_arch(char **);
 int get_cpuinfo(char *);

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
