From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/fdt: add kernel command line option for dtb_compat
	string
Date: Thu, 30 Dec 2010 14:32:56 -0700
Message-ID: <20101230213256.GB3220@angua.secretlab.ca>
References: <1291658059-383-1-git-send-email-dirk.brandewie@gmail.com>
	<4bb36a12-8d95-4d4e-936c-c1c74a9372cc@VA3EHSMHS025.ehs.local>
	<4CFD3322.1000503@gmail.com> <4CFD3371.3080807@gmail.com>
	<805e9139-7c09-45f5-a5a9-0ed0cbf64f2f@VA3EHSMHS025.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <805e9139-7c09-45f5-a5a9-0ed0cbf64f2f-+Ck8Kgl/v0/6UOWq+LNw4LjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 06, 2010 at 01:50:47PM -0800, Stephen Neuendorffer wrote:
> 
> 
> > -----Original Message-----
> > From: Dirk Brandewie [mailto:dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > Sent: Monday, December 06, 2010 11:03 AM
> > To: Stephen Neuendorffer
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Randy Dunlap;
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-
> > doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> > Subject: Re: [PATCH] of/fdt: add kernel command line option for
> dtb_compat string
> > 
> > On 12/06/2010 11:01 AM, Dirk Brandewie wrote:
> > > On 12/06/2010 10:37 AM, Stephen Neuendorffer wrote:
> > >>
> > >>
> > >>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > >>> index c1360e0..ca1318c 100644
> > >>> --- a/drivers/of/fdt.c
> > >>> +++ b/drivers/of/fdt.c
> > >>> @@ -15,6 +15,8 @@
> > >>> #include<linux/of_fdt.h>
> > >>> #include<linux/string.h>
> > >>> #include<linux/errno.h>
> > >>> +#include<asm-generic/vmlinux.lds.h>
> > >>> +
> > >>>
> > >>> #ifdef CONFIG_PPC
> > >>> #include<asm/machdep.h>
> > >>> @@ -604,3 +606,49 @@ void __init unflatten_device_tree(void)
> > >>>
> > >>> pr_debug("<- unflatten_device_tree()\n");
> > >>> }
> > >>> +
> > >>> +extern uint8_t __dtb_start[];
> > >>> +extern uint8_t __dtb_end[];
> > >>> +static void __init *of_flat_dt_find_compatible_dtb(char *name)
> > >>> +{
> > >>> + void *rc = NULL;
> > >>> + unsigned long root, size;
> > >>> + struct boot_param_header *orig_initial_boot_params;
> > >>> + uint8_t *blob;
> > >>> +
> > >>> + orig_initial_boot_params = initial_boot_params;
> > >>> + blob = __dtb_start;
> > >>> + initial_boot_params = (struct boot_param_header *)blob;
> > >>
> > >> Oy... can you avoid the pointer dance by using
> of_fdt_is_compatible()
> > >> from my recent set of patches?
> > >
> > > I would like to get rid of the pointer dance. Is your patch set
> going to make it
> > > into .37? I didn't see any acks.
> > >
> > Obviously I meant .38 :-)
> 
> I'd like it too, but that's up to Grant.  I imagine some of the
> bottleneck is that I don't have
> an easy way to test on powerpc or microblaze at the moment, so it's not
> clear that the code doesn't
> break anything.

It's in my -next branch now.

g.
