From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [sodaville] [RFC] [PATCH V2] Adding DTB to architecture
	independent vmlinux
Date: Thu, 28 Oct 2010 11:00:53 -0700
Message-ID: <20101028180053.GC25771@dvomlehn-lnx2.corp.sa.net>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com> <4CC8C423.9050600@gmail.com>
	<20101028005754.GA27386@dvomlehn-lnx2.corp.sa.net>
	<4CC99441.4030307@linux.intel.com> <4CC9A66B.6070408@linutronix.de>
	<4CC9A705.3080806@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CC9A705.3080806-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 28, 2010 at 09:38:29AM -0700, H. Peter Anvin wrote:
> On 10/28/2010 9:35 AM, Sebastian Andrzej Siewior wrote:
>> H. Peter Anvin wrote:
>>> How big are these blobs in the typical case? Padding to the page size
>> You usually pad the dtb by 1kib (-p 1024 in dtc). Converting all dtbs in
>> powerpc's tree leads to:
>> 991545 / 130 = 7627 bytes average.
>>
>
> So expanding to a page is a lot of memory, but it's pretty important to  
> jettison unused DTBs.
>
> 	-hpa

IIRC, the slab allocator will simply use the buddy allocator when allocating
close to or above the page size. So, this will use 8192 bytes whether
you use what I had proposed or you dynamically allocate space and copy it
from the .init section.

If memory usage is not an issue, it would be nice to avoid the copy. Another
possible consideration is image size. If you don't do the rounding, you'll
have a smaller boot image. Not really sure how to weigh these and whether there
are other considerations.
-- 
David VL
