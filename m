From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RESEND PATCH v3 2/7] Add utilfdt for common functions
Date: Tue, 20 Sep 2011 11:08:59 +1000
Message-ID: <20110920010859.GE29197@yookeroo.fritz.box>
References: <1316463668-976-1-git-send-email-sjg@chromium.org>
	<1316463668-976-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316463668-976-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 01:21:03PM -0700, Simon Glass wrote:
> This adds a new utility library for performing libfdt operations.
> 
> This is a separate library from libfdt because it performs OS operations,
> like open/close/read/write, while libfdt is OS-neutral. These utility
> functions are useful within the dtc package, and could potentially even
> be generally useful, but should not be part of libfdt.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Remove util_decode_key
> - Add utilfdt_decode_type to be used by fdtget/put
> - Remove limits on device tree binary size
> 
> Changes in v3:
> - Change format of -t argument to be more like printf
> - Move utilfdt into its own directory and make it a library
> - Use code closer to testutils.c implementation
> - Use open/close instead of fopen/fclose

[snip]
> diff --git a/Makefile b/Makefile
> index 380a705..4f5ccdd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -15,7 +15,7 @@ EXTRAVERSION =
>  LOCAL_VERSION =
>  CONFIG_LOCALVERSION =
>  
> -CPPFLAGS = -I libfdt
> +CPPFLAGS = -I libfdt -I utilfdt
>  WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
>  CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> @@ -151,6 +151,35 @@ ifneq ($(DEPTARGETS),)
>  -include $(LIBFDT_OBJS:%.o=$(LIBFDT_objdir)/%.d)
>  endif
>  
> +#
> +# Rules for utilfdt
> +#
> +UTILFDT_objdir = utilfdt
> +UTILFDT_srcdir = utilfdt
> +UTILFDT_archive = $(UTILFDT_objdir)/libutilfdt.a
> +UTILFDT_lib = $(UTILFDT_objdir)/libutilfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
> +UTILFDT_include = $(addprefix $(UTILFDT_srcdir)/,$(UTILFDT_INCLUDES))
> +
> +include $(UTILFDT_srcdir)/Makefile.utilfdt
> +
> +.PHONY: utilfdt
> +utilfdt: $(UTILFDT_archive) $(UTILFDT_lib)
> +
> +$(UTILFDT_archive): $(addprefix $(UTILFDT_objdir)/,$(UTILFDT_OBJS))
> +$(UTILFDT_lib): $(addprefix $(UTILFDT_objdir)/,$(UTILFDT_OBJS))

Building a shared library out of this is complete overkill.  In fact,
so is building a .a of it.  This is not an exported library for
general use, but just an internal mini-"library" for use by the fdtget
and fdtput functions.  Just have them both link with utilfdt.o.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
