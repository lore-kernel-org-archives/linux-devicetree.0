From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4] kbuild: dtbs_install: new make target
Date: Tue, 19 Nov 2013 14:58:05 -0700
Message-ID: <528BDEED.8080708@wwwdotorg.org>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <1384896475-8744-1-git-send-email-jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384896475-8744-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/19/2013 02:27 PM, Jason Cooper wrote:
> Unlike other build products in the Linux kernel, there is no 'make
> *install' mechanism to put devicetree blobs in a standard place.
> 
> This patch is an attempt to fix this problem.  Akin to 'make install',
> this creates a new make target, dtbs_install.  The script that gets
> called defers to a distribution or user supplied installdtbs binary,
> if found in the system.  Otherwise, the default action is to install a
> given dtb into
> 
>   /lib/modules/${kernel_version}/devicetree/${dts_filename}.dtb

I still don't see why you wouldn't install the files in
/lib/devicetrees, but I suppose that location is fine.

> This is done to keep dtbs from different kernel versions separate until
> things have settled down.  Once the dtbs are stable, and not so strongly
> linked to the kernel version, the devicetree files will most likely move
> to their own repo.  Users will need to upgrade install scripts at that
> time.
> 
> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> ---
> Question: should I make a note about the filenames not being considered an ABI,
> or just let it be?

I still believe they're an ABI.

I guess Grant meant that they aren't an ABI to the kernel at run-time,
unlike the content which is an ABI. That's fine.

However, I believe the files certainly are an ABI to any script that
takes them from the "make dtbs_install" output directory.

Perhaps the best resolution is to just say nothing and let it be:-)

> diff --git a/arch/arm/Makefile b/arch/arm/Makefile

> +dtbs_install: dtbs
> +	$(CONFIG_SHELL) $(srctree)/scripts/installdtbs.sh $(KERNELRELEASE) \
> +	"$(MODLIB)/devicetree" "$(srctree)/$(boot)/dts"

I still think this rule should be in Makefile not arch/arm/Makefile.

Aside from those couple of issues, this version looks OK to me.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
