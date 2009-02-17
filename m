From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] Fix libraries (static and dynamic) installation
Date: Tue, 17 Feb 2009 10:14:38 -0600
Message-ID: <E1LZSak-0006Ze-Mb@jdl.com>
References: <1234798759-32149-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <1234798759-32149-1-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> ---
> 
> The static library was not installed at all and the dynamic library was
> installed without execute permission


Emil,

I rearranged that log to put your description in it.
But the real problem is that applying it is a no-op.
I think your patch is mal-formed.  Specifically, it
looks like the line counts:

    @@ -142,2 +142,2 @@ endif

are bogus.  Only 2 lines?

Cleverly, Git applys the patch and yields a commit
with no changes.  (Identical tree before and after.)
Clearly wrong.

Can you send me a better patch?

Thanks,
jdl



>  Makefile |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 1cfa28a..be0fc8b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -142,2 +142,2 @@ endif
>  # intermediate target and building them again "for real"
>  .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
> 
> -
> -
>  install: all
>  	@$(VECHO) INSTALL
>  	$(INSTALL) -d $(DESTDIR)$(BINDIR)
> -	$(INSTALL) -m 755 $(BIN) $(DESTDIR)$(BINDIR)
> +	$(INSTALL) $(BIN) $(DESTDIR)$(BINDIR)
>  	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
> -	$(INSTALL) -m 644 $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
> +	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
> +	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
>  	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
>  	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
> 
> --
> 1.6.1.3
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
