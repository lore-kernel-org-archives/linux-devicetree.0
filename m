From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] of/fdt: add kernel command line option for dtb_compat
	string
Date: Mon, 6 Dec 2010 13:50:47 -0800
Message-ID: <805e9139-7c09-45f5-a5a9-0ed0cbf64f2f@VA3EHSMHS025.ehs.local>
References: <1291658059-383-1-git-send-email-dirk.brandewie@gmail.com>
	<4bb36a12-8d95-4d4e-936c-c1c74a9372cc@VA3EHSMHS025.ehs.local>
	<4CFD3322.1000503@gmail.com> <4CFD3371.3080807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <4CFD3371.3080807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Dirk Brandewie [mailto:dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Monday, December 06, 2010 11:03 AM
> To: Stephen Neuendorffer
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Randy Dunlap;
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-
> doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> Subject: Re: [PATCH] of/fdt: add kernel command line option for
dtb_compat string
> 
> On 12/06/2010 11:01 AM, Dirk Brandewie wrote:
> > On 12/06/2010 10:37 AM, Stephen Neuendorffer wrote:
> >>
> >>
> >>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> >>> index c1360e0..ca1318c 100644
> >>> --- a/drivers/of/fdt.c
> >>> +++ b/drivers/of/fdt.c
> >>> @@ -15,6 +15,8 @@
> >>> #include<linux/of_fdt.h>
> >>> #include<linux/string.h>
> >>> #include<linux/errno.h>
> >>> +#include<asm-generic/vmlinux.lds.h>
> >>> +
> >>>
> >>> #ifdef CONFIG_PPC
> >>> #include<asm/machdep.h>
> >>> @@ -604,3 +606,49 @@ void __init unflatten_device_tree(void)
> >>>
> >>> pr_debug("<- unflatten_device_tree()\n");
> >>> }
> >>> +
> >>> +extern uint8_t __dtb_start[];
> >>> +extern uint8_t __dtb_end[];
> >>> +static void __init *of_flat_dt_find_compatible_dtb(char *name)
> >>> +{
> >>> + void *rc = NULL;
> >>> + unsigned long root, size;
> >>> + struct boot_param_header *orig_initial_boot_params;
> >>> + uint8_t *blob;
> >>> +
> >>> + orig_initial_boot_params = initial_boot_params;
> >>> + blob = __dtb_start;
> >>> + initial_boot_params = (struct boot_param_header *)blob;
> >>
> >> Oy... can you avoid the pointer dance by using
of_fdt_is_compatible()
> >> from my recent set of patches?
> >
> > I would like to get rid of the pointer dance. Is your patch set
going to make it
> > into .37? I didn't see any acks.
> >
> Obviously I meant .38 :-)

I'd like it too, but that's up to Grant.  I imagine some of the
bottleneck is that I don't have
an easy way to test on powerpc or microblaze at the moment, so it's not
clear that the code doesn't
break anything.

> >> It takes a blob argument. Then the loop below goes away.
> >>
> >
> > The loop will still be needed since multiple DTBs may be linked into
the image.
> > using your of_fdt_is_compatible() will make the loop a lot more
readable though.

Yeah, right.  Is the format just the binary concatenation of the device
trees?  part of why I ask
is the PTR_ALIGN code: It seems like different blob functions make
different assumptions about the 
location of the blob. In some cases, it is assumed to be the passed
pointer, in others, 
the pointer is scanned for OF_DT_BEGIN_NODE (using of_get_flat_dt_root).
Is the concern about
STRUCT_ALIGNMENT necessary if you call of_get_flat_dt_root() afterwards?
Would it make sense to
always call of_get_flat_dt_root in the 'generic' functions I added or
not?

BTW, PTR_ALIGN should probably be ALIGN.

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
