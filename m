From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 9/9] [Xilinx] xilinx_hwicap: Enable whenever OF/device
	trees are available.
Date: Tue, 10 Aug 2010 12:01:39 -0700
Message-ID: <5817abce-3f51-4e8e-a8ba-f95ea13a3536@SG2EHSMHS006.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-7-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-8-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-9-git-send-email-stephen.neuendorffer@xilinx.com>
	<d3cc257d-ca6f-40cd-82d4-5941e5fbc1d0@SG2EHSMHS001.ehs.local>
	<AANLkTimxkhWtnwViKj=3rEXcwZ7rPNezTe39Ef3Q5-WO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTimxkhWtnwViKj=3rEXcwZ7rPNezTe39Ef3Q5-WO-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> Sent: Tuesday, August 10, 2010 11:18 AM
> To: Stephen Neuendorffer
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 9/9] [Xilinx] xilinx_hwicap: Enable whenever OF/devic=
e trees are available.
> =

> On Fri, Jul 23, 2010 at 2:57 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> =

> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> =

> > ---
> > =A0drivers/char/Kconfig | =A0 =A02 +-
> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> > index 7cfcc62..f445f2f 100644
> > --- a/drivers/char/Kconfig
> > +++ b/drivers/char/Kconfig
> > @@ -909,7 +909,7 @@ config DTLK
> >
> > =A0config XILINX_HWICAP
> > =A0 =A0 =A0 =A0tristate "Xilinx HWICAP Support"
> > - =A0 =A0 =A0 depends on XILINX_VIRTEX || MICROBLAZE
> > + =A0 =A0 =A0 depends on OF
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0This option enables support for Xilinx Internal Conf=
iguration
> > =A0 =A0 =A0 =A0 =A0Access Port (ICAP) driver. =A0The ICAP is used on Xi=
linx Virtex
> > --
> > 1.5.6.6

Did you pull the fixed version into your next tree to build test on PowerPC?

Steve

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
