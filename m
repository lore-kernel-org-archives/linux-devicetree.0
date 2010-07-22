From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 8/8] [Xilinx] xilinx_hwicap: Enable whenever OF/device
	trees are available.
Date: Thu, 22 Jul 2010 11:25:29 -0700
Message-ID: <b520314b-bf30-4f24-a366-a5314e244d34@VA3EHSMHS032.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-7-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-8-git-send-email-stephen.neuendorffer@xilinx.com>
	<a10f704f-cc4b-4ca2-bd06-a9c4fa2853d4@VA3EHSMHS003.ehs.local>
	<AANLkTilMVutoM9wH-67nqR2r3Lv-hq_aEKntjLk7_dgA@mail.gmail.com>
	<AANLkTimm9hxxaj5ir2SynudRu1o4LKXnHy1AnJ1C_ii7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTimm9hxxaj5ir2SynudRu1o4LKXnHy1AnJ1C_ii7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> Sent: Thursday, July 22, 2010 9:05 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 8/8] [Xilinx] xilinx_hwicap: Enable whenever OF/devic=
e trees are available.
> =

> On Fri, Jul 16, 2010 at 12:45 PM, Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
> > <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >> signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> =A0drivers/char/Kconfig | =A0 =A02 +-
> >> =A01 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> >> index 7cfcc62..f445f2f 100644
> >> --- a/drivers/char/Kconfig
> >> +++ b/drivers/char/Kconfig
> >> @@ -909,7 +909,7 @@ config DTLK
> >>
> >> =A0config XILINX_HWICAP
> >> =A0 =A0 =A0 =A0tristate "Xilinx HWICAP Support"
> >> - =A0 =A0 =A0 depends on XILINX_VIRTEX || MICROBLAZE
> >> + =A0 =A0 =A0 depends on OF
> >
> > I'll throw this and patch 7 into my experimental branch to see if they
> > break SPARC or PPC64.
> =

> It broke.
> =

> http://kisskb.ellerman.id.au/kisskb/buildresult/2946239/
> =

> g.

It looks like it can just use linux/io.h.  I'll spin the patches.

Steve


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
