From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/8] of/base.c: export property access/modification
	functions
Date: Fri, 16 Jul 2010 13:07:43 -0700
Message-ID: <41b1b87c-a391-493d-8235-a9304562a6e4@SG2EHSMHS003.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<01cb5edd-5330-40ba-b410-6732e44f0954@VA3EHSMHS011.ehs.local>
	<AANLkTikwtfpH5qyG5cbsLYPHLSaAmBcHaSJT3zbt4s35@mail.gmail.com>
	<e198df81-5939-4b82-9d27-952d9781ec05@VA3EHSMHS007.ehs.local>
	<AANLkTilXmgTkJ2N0dTYsV99ElqssZAXwOgtKPBENZoX8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTilXmgTkJ2N0dTYsV99ElqssZAXwOgtKPBENZoX8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gra=
nt Likely
> Sent: Friday, July 16, 2010 11:57 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 4/8] of/base.c: export property access/modification f=
unctions
> =

> On Fri, Jul 16, 2010 at 12:38 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >
> >
> >> -----Original Message-----
> >> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
> > Grant Likely
> >> Sent: Friday, July 16, 2010 11:34 AM
> >> To: Stephen Neuendorffer
> >> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >> Subject: Re: [PATCH 4/8] of/base.c: export property
> > access/modification functions
> >>
> >> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
> >> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >> > These functions can be usefully used by device drivers.
> >>
> >> I'd like a little more description of the intended use case. =A0What a=
re
> >> the circumstances where a driver needs to modify the data (this
> >> information should be part of the patch description)?
> >
> > The PCIPR driver code needs to stuff the ranges property using these
> > calls...
> =

> I'd rather change the translation code to give you an intermediary
> value (an offset from a bar), and then use non-OF code to translate
> that into a physical address.

I don't see how that will work, since there is no callback from the device-=
tree
code behind platform_get_resource/of_address_to_resource back into the pcip=
r driver to
do the last translation bit.  I considered having a new 'bus_type' register=
ed in the
address translation code that would take care of it, but it seemed to still=
 require
the information from somewhere and it wasn't clear where to get it.

Steve

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
