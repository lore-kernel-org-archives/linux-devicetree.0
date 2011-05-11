From: Domenico Andreoli <dr.domenico.andreoli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: include version number in soname
Date: Wed, 11 May 2011 16:29:53 +0200
Message-ID: <20110511142953.GA8845@dandreoli.com>
References: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
	<20110425030733.GA6263@yookeroo> <4DB5B8D0.90802@redhat.com>
	<20110426104527.GC6263@yookeroo> <4DB6A98B.6020107@redhat.com>
	<20110426151912.GE6263@yookeroo> <E1QFo3q-0001O9-IK@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1QFo3q-0001O9-IK-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Fri, Apr 29, 2011 at 08:48:46AM -0500, Jon Loeliger wrote:
> > On Tue, Apr 26, 2011 at 01:16:27PM +0200, Paolo Bonzini wrote:
> > > On 04/26/2011 12:45 PM, David Gibson wrote:
> > > > 
> > > > The libfdt shared library is only installed by its unversioned name.
> > > > Including it properly in a distribution requires installation of both
> > > > the versioned name (used in the binary-only package) and the unversioned
> > > > name (used in the development package).  The latter is just a symbolic
> > > > link, so you need to change the soname in turn to include the version.
> 
> Applied with last-minute mod and pushed out.
> 
> Consider this the candidate for a 1.3.0 release!

I'm considering to package dtc for Debian, do you plan to release
tarballs or is git the only way you release dtc? I'm seeing the v1.3.0
tag, is it already the final release?

What libfdt is used for? Why dtc does not depend on it? Is there any
other user-space tool that may use libfdt? I need to understand if it's
appropriate to have the following packages: dtc, libfdt and libfdt-dev.

Are you available to host debian specific subdir containing all the
packaging details (few files)? Has dtc an homepage or only the gitweb?

This is not an intent statement yet, I'm an almost retired debian
developer but since the packaging effort is rather low I could think
to take it anyway. If anybody else is available I will happily leave
it to him.

thanks,
Domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://cavokz.wordpress.com/gpgkey/
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
