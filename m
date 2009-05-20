From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: dtc build failures on OS X
Date: Tue, 19 May 2009 21:08:14 -0500
Message-ID: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I'm trying to build dtc on Mac OS X.  The compilation seems to go
okay, but the linker dies.  First, it says this:

	 LD libfdt/libfdt.so
ld: unknown option: --version-script=libfdt/version.lds
collect2: ld returned 1 exit status

A Google search suggested that I can just delete the --version-script
option.  I did that, and now I get this error:

	 LD libfdt/libfdt.so
ld: unknown option: -soname
collect2: ld returned 1 exit status

This web page: http://lists.apple.com/archives/unix-porting/2003/Oct/msg00032.html
had some suggestions on how to fix that, so my Makefile now looks like
this:

$(LIBFDT_lib):
        @$(VECHO) LD $@
        $(CC) $(LDFLAGS) -fPIC -Wl,-dylib_install_name -Wl,$(notdir
$@) -shared -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).so $^
        ln -s libfdt-$(DTC_VERSION).so $(LIBFDT_objdir)/libfdt.so

But now I get this error:

	 LD libfdt/libfdt.so
Undefined symbols:
  "_main", referenced from:
      start in crt1.10.5.o
ld: symbol(s) not found
collect2: ld returned 1 exit status

So now I'm stuck.  Has anyone tried this before?  Can anyone tell me
how to fix this?

-- 
Timur Tabi
Linux kernel developer at Freescale
