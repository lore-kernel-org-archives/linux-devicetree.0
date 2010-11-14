From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [sodaville] [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Date: Sun, 14 Nov 2010 11:44:09 +1100
Message-ID: <20101114004409.GB2937@yookeroo>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<a7e6885535e6c930560f3d79a8a55ae922499752.1289520079.git.dirk.brandewie@gmail.com>
	<4CDC8EA3.6080608@linux.intel.com> <4CDC91DC.7030407@gmail.com>
	<20101112011617.GA3102@yookeroo> <4CDD6A55.6040603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CDD6A55.6040603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Fri, Nov 12, 2010 at 08:24:53AM -0800, Dirk Brandewie wrote:
> Hi David,
> On 11/11/2010 05:16 PM, David Gibson wrote:
> >On Thu, Nov 11, 2010 at 05:01:16PM -0800, Dirk Brandewie wrote:
[snip]
> >I also think this is the wrong place to do this.  scripts/dtc is a
> >mirror of copy of upstream dtc, designed for making dtb images for
> >general purposes.  I think the alignment should instead go into the
> >linker script fragments you generate to incbin the dtbs.
> 
> I was sleep deprived when I responded to HPA I thought he had
> replied to the patch modifying vmlinux.lds.h since we had talked
> about that file a fair amount. So my first response had little
> bearing on patch in question.
> 
> I am trying to solve two issues with this change.
> 
> The structure needs to be 32 byte aligned for the code in fdt.c to
> be able parse the blob.  You are right I can force this alignment in
> the assembly fragment.
> 
> The second issue is being able to parse the section in the kernel
> image to find each of the blobs that have been concatenated
> together.  If the DTB size is modulo 32 bytes I can use  blob =
> blob+be32_to_cpu(blob->totalsize) to find the next blob in the
> section and use that address directly to have fdt.c parse the blob.
> Otherwise I would need to search for the signature of the next blob
> somewhere past the end of the current blob which is knid of messy
> IMHO.

As hpa says you can just align your increment too, to find the next
blob.

> I have two questions,
> Do you think this acceptable if I made forcing the alignment a
> command line argument?

Um, sure.  It's not actually necessary for what you're doing here, but
it might have some use, I guess, and it's pretty non-invasive.  Your
posted patch for this, however, is broken, see my comments in reply,

> Where is the DTC git tree I should be delivering patches against?
> is git://www.jdl.com/software/dtc.git the correct tree?

That's right.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
