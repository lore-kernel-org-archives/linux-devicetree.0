From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3] fdt.c: Add non-boottime device tree functions
Date: Wed, 17 Nov 2010 13:41:56 -0800
Message-ID: <d51597e2-0b85-49cf-9f77-a1f53c1a96db@VA3EHSMHS008.ehs.local>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<17453aae-47e7-4b69-b7f4-b4577456c637@VA3EHSMHS001.ehs.local>
	<20101117194203.GA2352@angua.secretlab.ca>
	<ed30f7b9-a1dd-4cd3-a6df-f2361e790185@VA3EHSMHS030.ehs.local>
	<20101117200012.GD2352@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20101117200012.GD2352-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
Likely
> Sent: Wednesday, November 17, 2010 12:00 PM
> To: Stephen Neuendorffer
> Cc: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 1/3] fdt.c: Add non-boottime device tree functions
> 
> On Wed, Nov 17, 2010 at 11:46:07AM -0800, Stephen Neuendorffer wrote:
> >
> >
> > > -----Original Message-----
> > > From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
Grant
> > Likely
> > > Sent: Wednesday, November 17, 2010 11:42 AM
> > > To: Stephen Neuendorffer
> > > Cc: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > Subject: Re: [PATCH 1/3] fdt.c: Add non-boottime device tree
functions
> > >
> > > On Wed, Nov 17, 2010 at 11:15:43AM -0800, Stephen Neuendorffer
wrote:
> > > > In preparation for providing run-time handling of device trees,
> > factor
> > > > out some of the basic functions so that they take an arbitrary
blob,
> > > > rather than relying on the single boot-time tree.
> > > >
> > > > Signed-off-by: Stephen Neuendorffer
> > <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  drivers/of/fdt.c       |  129
> > ++++++++++++++++++++++++++++++-----------------
> > > >  include/linux/of_fdt.h |    9 +++
> > > >  2 files changed, 91 insertions(+), 47 deletions(-)
> > > >
> > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > index c1360e0..6ae207a 100644
> > > > --- a/drivers/of/fdt.c
> > > > +++ b/drivers/of/fdt.c
> > > > @@ -22,6 +22,86 @@
> > > >
> > > >  #include <asm/page.h>
> > > >
> > > > +char *fdt_get_string(u32 offset,
> > > > +			  struct boot_param_header *blob)
> > >
> > > nitpicking: Encouraged naming convention is of_flat_dt_* for this
> > > file.  Also, I think it makes more sense for blob to be the first
> > > argument in all of these functions.
> >
> > OK... Half of the other functions don't follow that convention,
tho...
> > :)
> 
> I know.  It's a mess.  But I need to start with something to start
> regaining sanity.  :)

I thought about this some more and I do think it makes sense to have the
'generic' functions in a separate namespace, since they really are
distinguished in usage from the others marked __init.  I started off
naming
these all *_blob, but the names were really ugly, especially since the
functions
that are getting refactored are the ones that already fail to follow the
convention.

Proposal: if/when the other functions get factored into a separate file,
they
should be renamed to be of_early_flat_dt_*.

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
