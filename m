From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Sat, 30 Oct 2010 23:57:11 +1100
Message-ID: <20101030125711.GG5250@yookeroo>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com> <4CC8C423.9050600@gmail.com>
	<20101028005754.GA27386@dvomlehn-lnx2.corp.sa.net>
	<4CC99441.4030307@linux.intel.com>
	<20101028173202.GA25771@dvomlehn-lnx2.corp.sa.net>
	<4CC9EECF.9020208@linux.intel.com> <20101029040456.GB5250@yookeroo>
	<4CCB2E93.2010809@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CCB2E93.2010809-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 29, 2010 at 01:29:07PM -0700, H. Peter Anvin wrote:
> On 10/28/2010 09:04 PM, David Gibson wrote:
> > On Thu, Oct 28, 2010 at 02:44:47PM -0700, H. Peter Anvin wrote:
> >> On 10/28/2010 10:32 AM, David VomLehn wrote:
> >>>
> >>> In my case, where there are a lot of up-front reservations of memory
> >>> at a static address, there is a fair amount of work to do before
> >>> it's possible to do the dynamic address allocation for the blob's
> >>> ultimate destination, but I'm okay with either doing blob size and address
> >>> rounding or copying it from init. I don't see a benefit of supporting
> >>> multiple approaches for Linux.
> >>>
> >>
> >> The reason I mentioned dynamic allocation is that you still need to do
> >> dynamic allocation if you're using a blob from an external source.  If
> >> you don't end up with pointers *into* the blob, though, then you don't
> >> need to do the relocation until some time before you jettison the init
> >> section.
> > 
> > The way the dtb format is designed, you should almost never work with
> > pointers into the the middle of the blob.
> 
> "Almost never"?  That scares me when I hear it...

Heh, understandable.  So, the dtb format is such that you want to work
with internal offsets most of the time, not pointers into the middle.
Except that of course, you will use transient internal pointers to
grab pieces from the dtb - it's just best to avoid passing them around
whenever you can.

The other case is that once the dtb is "frozen" (no more changes), it
can be useful to keep around pointers to bits of data within the dtb,
rather than duplicating each such thing in its own allocated buffer
somewhere.  e.g. I think once we unflatten the tree in powerpc,
property values will still actually point to within the original dtb.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
