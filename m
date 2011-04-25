From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: include version number in soname
Date: Mon, 25 Apr 2011 13:07:33 +1000
Message-ID: <20110425030733.GA6263@yookeroo>
References: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303380829-16965-1-git-send-email-pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2011 at 12:13:49PM +0200, Paolo Bonzini wrote:
> The libfdt shared library is only installed by its unversioned name.
> Including it properly in a distribution requires installation of both
> the versioned name (used in the binary-only package) and the unversioned
> name (used in the development package).  The latter is just a symbolic
> link, so you need to change the soname in turn to include the version.
> 
> While at it, use Makefile variables to shorten some lines and avoid
> cut-and-paste typos; and clean up remnants of when shared libraries were
> not supported on Darwin.

So, as it happens, I was attempting to package libfdt just a few days
ago and also hit problems because the shared library was not properly
versioned.  That was more due to the lack of SONAME entry in the ELF
itself, rather than the missing installed filename.

However this patch isn't quite right - it sets the SONAME containing
the whole of the dtc version, which means even minor version updates
will cause a change of soname and will therefore be seen as
incompatible changes.

I'll revise and send out a version with both sign-offs in a moment.
Jon, it would be really good to squeeze this one into the mooted
upcoming official release - it would then be a good base for the
distros to build proper libfdt packages from.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
