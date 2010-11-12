From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [sodaville] [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Date: Fri, 12 Nov 2010 12:16:17 +1100
Message-ID: <20101112011617.GA3102@yookeroo>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<a7e6885535e6c930560f3d79a8a55ae922499752.1289520079.git.dirk.brandewie@gmail.com>
	<4CDC8EA3.6080608@linux.intel.com> <4CDC91DC.7030407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CDC91DC.7030407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 11, 2010 at 05:01:16PM -0800, Dirk Brandewie wrote:
> On 11/11/2010 04:47 PM, H. Peter Anvin wrote:
> >On 11/11/2010 04:03 PM, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >>From: Dirk Brandewie<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >>This patch forces the size of the DTB to be modulo 32 bytes. This is
> >>needed to support linking multiple DTB's into a single section in the
> >>image. GCC wants structures to be 32 byte aligned without this change
> >>DTB's after the first in the section may not be properly aligned so
> >>the flat tree parsing code will fall over.
> >>
> >>Signed-off-by: Dirk Brandewie<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> >I don't think 32 is a universal number; it should depend on the ABI.  On
> >x86, for one thing, I'm pretty sure that there is no particular
> >alignment requirements beyond the natural alignment of the data items,
> >for example.
> >
> >Although 32 is probably conservative on any platform, please flag the
> >origin of this with a comment, or make it a constant defined in a header
> >file... otherwise, if this breaks for whatever reason it'll be near
> >impossible to find.
> >
> 
> I will change . = ALIGN(32); to STRUCT_ALIGN();
> 
> from vmlinux.lds.h:
> /*
>  * Align to a 32 byte boundary equal to the
>  * alignment gcc 4.5 uses for a struct
>  */
> #define STRUCT_ALIGN() . = ALIGN(32)

I also think this is the wrong place to do this.  scripts/dtc is a
mirror of copy of upstream dtc, designed for making dtb images for
general purposes.  I think the alignment should instead go into the
linker script fragments you generate to incbin the dtbs.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
