From: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [sodaville] [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Date: Fri, 12 Nov 2010 11:08:15 -0800
Message-ID: <4CDD909F.10406@linux.intel.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<a7e6885535e6c930560f3d79a8a55ae922499752.1289520079.git.dirk.brandewie@gmail.com>
	<4CDC8EA3.6080608@linux.intel.com> <4CDC91DC.7030407@gmail.com>
	<20101112011617.GA3102@yookeroo> <4CDD6A55.6040603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/12/2010 08:24 AM, Dirk Brandewie wrote:
> 
> The second issue is being able to parse the section in the kernel image to find 
> each of the blobs that have been concatenated together.  If the DTB size is 
> modulo 32 bytes I can use  blob = blob+be32_to_cpu(blob->totalsize) to find the 
> next blob in the section and use that address directly to have fdt.c parse the 
> blob.  Otherwise I would need to search for the signature of the next blob 
> somewhere past the end of the current blob which is knid of messy IMHO.
> 

Not if you know it is aligned mod <whatever> bytes, then you just do:

blob = ALIGN_UP(blob + be32_to_cpu(blob->totalsize), DTB_ALIGNMENT);

This, of course, makes it even more important that DTB_ALIGNMENT is a
common constant across the kernel build.  The nice part is that you can
just add:

	.balign DTB_ALIGNMENT

... into your generated .S files and all is good.

	-hpa
