From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: include version number in soname
Date: Thu, 12 May 2011 01:06:28 +1000
Message-ID: <20110511150628.GG11959@yookeroo.fritz.box>
References: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
	<20110425030733.GA6263@yookeroo> <4DB5B8D0.90802@redhat.com>
	<20110426104527.GC6263@yookeroo> <4DB6A98B.6020107@redhat.com>
	<20110426151912.GE6263@yookeroo> <E1QFo3q-0001O9-IK@jdl.com>
	<20110511142953.GA8845@dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110511142953.GA8845-iIV0ii4H0r6tG0bUXCXiUA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2011 at 04:29:53PM +0200, Domenico Andreoli wrote:
> Hi Jon,
> 
> On Fri, Apr 29, 2011 at 08:48:46AM -0500, Jon Loeliger wrote:
> > > On Tue, Apr 26, 2011 at 01:16:27PM +0200, Paolo Bonzini wrote:
> > > > On 04/26/2011 12:45 PM, David Gibson wrote:
> > > > > 
> > > > > The libfdt shared library is only installed by its unversioned name.
> > > > > Including it properly in a distribution requires installation of both
> > > > > the versioned name (used in the binary-only package) and the unversioned
> > > > > name (used in the development package).  The latter is just a symbolic
> > > > > link, so you need to change the soname in turn to include the version.
> > 
> > Applied with last-minute mod and pushed out.
> > 
> > Consider this the candidate for a 1.3.0 release!
> 
> I'm considering to package dtc for Debian, do you plan to release
> tarballs or is git the only way you release dtc? I'm seeing the v1.3.0
> tag, is it already the final release?

dtc is already packaged in Debian, under the package name
'device-tree-compiler'.  However the package is missing some stuff,
and doesn't include libfdt at all.

> What libfdt is used for?

libfdt is used for manipulating device trees at run time.  It can be
used by bootloaders or kernels as well as userspace programs.

> Why dtc does not depend on it?

Partly history, partly because dtc does not do much runtime
manipulation of trees in flattened form, partly because having
separate implementations allows them to be tested against each other.

> Is there any
> other user-space tool that may use libfdt?

qemu can use libfdt in some configurations.

> I need to understand if it's
> appropriate to have the following packages: dtc, libfdt and
> libfdt-dev.

Yes, that would be appropriate, except it would be libfdt1, so that
debian's automatic shared library dependency stuff would work.  This
is exactly what I did in a quick and dirty .deb I made for internal
use.  lib32fdt1 and lib64fdt1 packages would also be useful.

> Are you available to host debian specific subdir containing all the
> packaging details (few files)? Has dtc an homepage or only the gitweb?
> 
> This is not an intent statement yet, I'm an almost retired debian
> developer but since the packaging effort is rather low I could think
> to take it anyway. If anybody else is available I will happily leave
> it to him.
> 
> thanks,
> Domenico
> 
> -----[ Domenico Andreoli, aka cavok
>  --[ http://cavokz.wordpress.com/gpgkey/
>    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
