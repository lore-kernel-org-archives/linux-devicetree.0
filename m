From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/8] of/fdt.c: use architecture-independent ALIGN macro,
	defined in kernel.h
Date: Mon, 19 Jul 2010 11:34:23 -0700
Message-ID: <95d3e440-ff4e-4655-b0d6-632029c93821@VA3EHSMHS032.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<f2cebad3-5fb1-4984-800f-ef847e388e65@SG2EHSMHS001.ehs.local>
	<AANLkTin8GUuMjAVI-r2KNXBoH7DjsQWfTjC1inQTlD6V@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTin8GUuMjAVI-r2KNXBoH7DjsQWfTjC1inQTlD6V-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
Grant Likely
> Sent: Friday, July 16, 2010 11:30 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 1/8] of/fdt.c: use architecture-independent ALIGN
macro, defined in kernel.h
> 
> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > This removes an architecture dependency, making the code more
generic.
> 
> A similar change will be in linux-next today.  :-)  I've recently
> updated my next-devicetree and test-devicetree branches if you would
> like to rebase.
> 
> g.

FYI: I tried rebasing, but I get boot problems on my x86 box.  I haven't
determined if this is
related to rc3+, or my additional patches yet...

Steve


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
