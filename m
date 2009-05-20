From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc build failures on OS X
Date: Wed, 20 May 2009 14:43:01 +1000
Message-ID: <20090520044301.GI6333@yookeroo.seuss>
References: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2009 at 09:08:14PM -0500, Timur Tabi wrote:
> I'm trying to build dtc on Mac OS X.  The compilation seems to go
> okay, but the linker dies.  First, it says this:

Well, I'm not surprised something has gone wrong - not much work has
gone into making dtc portable yet (though it has been compiled on
FreeBSD, at least).

> 	 LD libfdt/libfdt.so
> ld: unknown option: --version-script=libfdt/version.lds
> collect2: ld returned 1 exit status
> 
> A Google search suggested that I can just delete the --version-script
> option.  I did that, and now I get this error:

Hrm.  What toolchain are you using?

> 	 LD libfdt/libfdt.so
> ld: unknown option: -soname
> collect2: ld returned 1 exit status
> 
> This web page: http://lists.apple.com/archives/unix-porting/2003/Oct/msg00032.html
> had some suggestions on how to fix that, so my Makefile now looks like
> this:
> 
> $(LIBFDT_lib):
>         @$(VECHO) LD $@
>         $(CC) $(LDFLAGS) -fPIC -Wl,-dylib_install_name -Wl,$(notdir
> $@) -shared -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).so $^
>         ln -s libfdt-$(DTC_VERSION).so $(LIBFDT_objdir)/libfdt.so
> 
> But now I get this error:
> 
> 	 LD libfdt/libfdt.so
> Undefined symbols:
>   "_main", referenced from:
>       start in crt1.10.5.o
> ld: symbol(s) not found
> collect2: ld returned 1 exit status

*That* looks like it's trying to build an executable, rather than a
shared library.  Hence including the crt1.o module, which wants to
call main().

> So now I'm stuck.  Has anyone tried this before?  Can anyone tell me
> how to fix this?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
