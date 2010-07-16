From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/8] of/base.c: export property access/modification
	functions
Date: Fri, 16 Jul 2010 11:38:17 -0700
Message-ID: <e198df81-5939-4b82-9d27-952d9781ec05@VA3EHSMHS007.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<01cb5edd-5330-40ba-b410-6732e44f0954@VA3EHSMHS011.ehs.local>
	<AANLkTikwtfpH5qyG5cbsLYPHLSaAmBcHaSJT3zbt4s35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTikwtfpH5qyG5cbsLYPHLSaAmBcHaSJT3zbt4s35-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> Sent: Friday, July 16, 2010 11:34 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 4/8] of/base.c: export property
access/modification functions
> 
> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > These functions can be usefully used by device drivers.
> 
> I'd like a little more description of the intended use case.  What are
> the circumstances where a driver needs to modify the data (this
> information should be part of the patch description)?

The PCIPR driver code needs to stuff the ranges property using these
calls...
I admit I'm somewhat nervous about making changes to the device tree
after 
struct device objects are generated, but don't see a way to go about
what needs
to be done simply without these EXPORTS.

Steve


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
