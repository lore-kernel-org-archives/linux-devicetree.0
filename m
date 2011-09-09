From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: supply a DTB file to be appended
Date: Thu, 08 Sep 2011 23:52:07 -0500
Message-ID: <4E699B77.5040906@gmail.com>
References: <1315476884-28470-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315476884-28470-1-git-send-email-linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Linus,

On 09/08/2011 05:14 AM, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This adds a Kconfig string where you can specify a
> file to be appended to the zImage on build, then
> auto-appends it. The idea is to mimic how we supply
> an initramfs image by a similar parameter.

The key difference is an initramfs is much more likely to be platform
independent, but a dtb will never be. Once we have a single kernel, then
we'll need a way to include multiple dtbs and logic to select one?

I think appending a dtb in a way that can be done as late as possible
(i.e. kernel rootfs install time) is a much more useful feature.

Rob

> 
> This makes it easy to script the kernel build with
> different device trees, and it also vastly simplifies
> building uImages since "make uImage" will now pick
> up the devcie tree and include it in the final image
> as part of the build process.
> 
> Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This builds on top of Nicos pending appended device tree
> patches. Nico, if this gains some liking, please include
> it in your series.
> ---
>  arch/arm/Kconfig       |   10 ++++++++++
>  arch/arm/boot/Makefile |    8 +++++++-
>  2 files changed, 17 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 4ea9974..cb8ee68 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1789,6 +1789,16 @@ config ARM_APPENDED_DTB
>  	  (dtb) appended to zImage
>  	  (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
>  
> +config ARM_APPENDED_DTB_FILE
> +	string "DTB file"
> +	depends on ARM_APPENDED_DTB
> +	default ""
> +	help
> +	  This gives the name of file from the build directory to append
> +	  to the zImage after it has been built.
> +
> +	  If you are not sure, leave it blank.
> +
>  config ARM_ATAG_DTB_COMPAT
>  	bool "Supplement the appended DTB with traditional ATAG information"
>  	depends on ARM_APPENDED_DTB
> diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
> index a1edfd5..5ab6abf 100644
> --- a/arch/arm/boot/Makefile
> +++ b/arch/arm/boot/Makefile
> @@ -53,8 +53,14 @@ $(obj)/Image: vmlinux FORCE
>  $(obj)/compressed/vmlinux: $(obj)/Image FORCE
>  	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
>  
> -$(obj)/zImage:	$(obj)/compressed/vmlinux FORCE
> +# Rule to optionally append a DTB
> +dtbfile := $(shell echo $(CONFIG_ARM_APPENDED_DTB_FILE))
> +quiet_cmd_append = CAT     $@
> +      cmd_append = (cat /dev/null $(dtbfile) >> $@)
> +
> +$(obj)/zImage:	$(obj)/compressed/vmlinux $(dtbfile) FORCE
>  	$(call if_changed,objcopy)
> +	$(call if_changed,append)
>  	@echo '  Kernel: $@ is ready'
>  
>  endif
