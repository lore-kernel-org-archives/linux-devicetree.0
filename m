From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/9] Xilinx PCI endpoint driver
Date: Tue, 10 Aug 2010 10:27:59 -0700
Message-ID: <1a6203e3-1f65-4b0c-9838-1cbcc8c9e04e@VA3EHSMHS013.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<0f773b9c-7bf4-4795-93e1-64b1f81dd286@VA3EHSMHS028.ehs.local>
	<AANLkTim81JjUYzRaiz_X3sh1evKSEfUia39_Lzjr7H-o@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTim81JjUYzRaiz_X3sh1evKSEfUia39_Lzjr7H-o-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> Sent: Tuesday, August 10, 2010 10:15 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 0/9] Xilinx PCI endpoint driver
> =

> On Fri, Jul 23, 2010 at 3:39 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > Sorry, I just realized that the NO_IRQ patch is incomplete 'cuz I hadn't
> > fixed the
> > x86 part... =A0But can you try putting the hwicap fix in the test tree?
> =

> Hi Stephen,  I didn't get a chance to look at these before the merge
> window opened, and then of course everything else fell to the wayside.
>  I'll take a quick look now, but a bunch of devicetree changes went in
> that will affect some of your patches, so you'll want to rebase on top
> of Linus' current tree sometime soon.
> =

> g.

No worries about the hwicap stuff...

As for the other device tree things:
I've also been stuck on other things and haven't had much chance to drive a=
nything.
I see the main barrier being the code that has to get added to x86 to make =
it work,
and all the recent updates you've made are moving in exactly the right dire=
ction, so
I've been waiting a bit for that to settle down.

Steve

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
