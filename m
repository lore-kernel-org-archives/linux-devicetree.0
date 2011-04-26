From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] libfdt: include version number in soname
Date: Tue, 26 Apr 2011 13:16:27 +0200
Message-ID: <4DB6A98B.6020107@redhat.com>
References: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
	<20110425030733.GA6263@yookeroo> <4DB5B8D0.90802@redhat.com>
	<20110426104527.GC6263@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110426104527.GC6263@yookeroo>
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

On 04/26/2011 12:45 PM, David Gibson wrote:
> Minimally, yes.  But I think we can do a bit better.  In particular
> I'd prefer not to tie the soname directly to the dtc version at all.
> Updates to dtc are only vaguely in sync with libfdt updates, and since
> we are symbol versioning in libfdt, even pretty significant changes in
> libfdt won't break backwards compatibility if we do things right.
> 
> So here's my patch version instead.  Jon, please apply.
> 
> libfdt: include version number in soname
> 
> From: Paolo Bonzini<pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> The libfdt shared library is only installed by its unversioned name.
> Including it properly in a distribution requires installation of both
> the versioned name (used in the binary-only package) and the unversioned
> name (used in the development package).  The latter is just a symbolic
> link, so you need to change the soname in turn to include the version.
> 
> While at it, use Makefile variables to shorten some lines and avoid
> cut-and-paste typos; and clean up remnants of when shared libraries were
> not supported on Darwin.
> 
> Signed-off-by: Paolo Bonzini<pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: David Gibson<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

This:

+	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_SONAME) -o $(LIBFDT_lib) $^

should be $(LIBFDT_soname).

ACK with that change.

Paolo
