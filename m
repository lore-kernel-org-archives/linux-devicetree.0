From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Date: Sat, 13 Nov 2010 21:35:35 -0700
Message-ID: <20101114043535.GA2355@angua.secretlab.ca>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<a7e6885535e6c930560f3d79a8a55ae922499752.1289520079.git.dirk.brandewie@gmail.com>
	<4CDC8EA3.6080608@linux.intel.com> <4CDC91DC.7030407@gmail.com>
	<20101112011617.GA3102@yookeroo> <4CDD6A55.6040603@gmail.com>
	<20101114004409.GB2937@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101114004409.GB2937@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 14, 2010 at 11:44:09AM +1100, David Gibson wrote:
> On Fri, Nov 12, 2010 at 08:24:53AM -0800, Dirk Brandewie wrote:
[snip]
> > I am trying to solve two issues with this change.
> > 
> > The structure needs to be 32 byte aligned for the code in fdt.c to
> > be able parse the blob.  You are right I can force this alignment in
> > the assembly fragment.
> > 
> > The second issue is being able to parse the section in the kernel
> > image to find each of the blobs that have been concatenated
> > together.  If the DTB size is modulo 32 bytes I can use  blob =
> > blob+be32_to_cpu(blob->totalsize) to find the next blob in the
> > section and use that address directly to have fdt.c parse the blob.
> > Otherwise I would need to search for the signature of the next blob
> > somewhere past the end of the current blob which is knid of messy
> > IMHO.
> 
> As hpa says you can just align your increment too, to find the next
> blob.

+1

I agree, handle the alignment issues entirely within the kernel.  You
don't need to modify dtc to get the behaviour you want.

> 
> > I have two questions,
> > Do you think this acceptable if I made forcing the alignment a
> > command line argument?
> 
> Um, sure.  It's not actually necessary for what you're doing here, but
> it might have some use, I guess, and it's pretty non-invasive.  Your
> posted patch for this, however, is broken, see my comments in reply,

I disagree here.  True it is non-invasive, but I'd rather not be
adding yet another command line option unless there was a real
use-case for doing so.

g.
