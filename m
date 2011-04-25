From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] libfdt: include version number in soname
Date: Mon, 25 Apr 2011 20:09:20 +0200
Message-ID: <4DB5B8D0.90802@redhat.com>
References: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
	<20110425030733.GA6263@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110425030733.GA6263@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/25/2011 05:07 AM, David Gibson wrote:
> it sets the SONAME containing the whole of the dtc version, which
> means even minor version updates will cause a change of soname and
> will therefore be seen as incompatible changes.

Squashing this in should be enough:

diff --git a/Makefile b/Makefile
index 1db9f30..e29cd25 100644
--- a/Makefile
+++ b/Makefile
@@ -131,7 +131,7 @@ LIBFDT_objdir = libfdt
 LIBFDT_srcdir = libfdt
 LIBFDT_archive = $(LIBFDT_objdir)/libfdt.a
 LIBFDT_lib = $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
-LIBFDT_lib_VERSIONED = $(subst .$(SHAREDLIB_EXT),-$(DTC_VERSION).$(SHAREDLIB_EXT),$(LIBFDT_lib))
+LIBFDT_lib_VERSIONED = $(subst .$(SHAREDLIB_EXT),.$(SHAREDLIB_EXT).$(VERSION),$(LIBFDT_lib))
 LIBFDT_lib_SONAME = $(notdir $(LIBFDT_lib_VERSIONED)) 
 LIBFDT_include = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_VERSION))

Paolo
