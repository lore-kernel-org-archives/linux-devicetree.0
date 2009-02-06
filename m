From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [2/2] libfdt: Rework/cleanup fdt_next_tag()
Date: Fri, 06 Feb 2009 11:22:22 -0600
Message-ID: <E1LVUPG-0000Pi-SK@jdl.com>
References: <20090206024929.GC18397@yookeroo.seuss>
	<20090206030156.GG18397@yookeroo.seuss>
	<20090206030324.GH18397@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20090206030324.GH18397-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Currently, callers of fdt_next_tag() must usually follow the call with
> some sort of call to fdt_offset_ptr() to verify that the blob isn't
> truncated in the middle of the tag data they're going to process.
> This is a bit silly, since fdt_next_tag() generally has to call
> fdt_offset_ptr() on at least some of the data following the tag for
> its own operation.
> 
> This patch alters fdt_next_tag() to always use fdt_offset_ptr() to
> verify the data between its starting offset and the offset it returns
> in nextoffset.  This simplifies fdt_get_property() which no longer has
> to verify itself that the property data is all present.
> 
> At the same time, I neaten and clarify the error handling for
> fdt_next_tag().  Previously, fdt_next_tag() could return -1 instead of
> a tag value in some circumstances - which almost none of the callers
> checked for.  Also, fdt_next_tag() could return FDT_END either because
> it encountered an FDT_END tag, or because it reached the end of the
> structure block - no way was provided to tell between these cases.
> 
> With this patch, fdt_next_tag() always returns FDT_END with a negative
> value in nextoffset for an error.  This means the several places which
> loop looking for FDT_END will still work correctly - they only need to
> check for errors at the end.  The errors which fdt_next_tag() can
> report are:
> 	- -FDT_ERR_TRUNCATED if it reached the end of the structure
> 	   block instead of finding a tag.
> 
> 	- -FDT_BADSTRUCTURE if a bad tag was encountered, or if the
>            tag data couldn't be verified with fdt_offset_ptr().
> 
> This patch also updates the callers of fdt_next_tag(), where
> appropriate, to make use of the new error reporting.
> 
> Finally, the prototype for the long gone _fdt_next_tag() is removed
> from libfdt_internal.h.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

Thanks,
jdl
