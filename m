From: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Xilinx SYSACE driver and 8-bit attachment
Date: Wed, 7 Oct 2009 17:44:18 -0600
Message-ID: <7a2a686d-ddf4-4a42-8c73-c933cebf22a4@VA3EHSMHS005.ehs.local>
References: <1d3f23370910070013u6307bc42hf7ab243b52d007df@mail.gmail.com>
	<fa686aa40910070634r4a8dcf74qdcbfb3bde3413109@mail.gmail.com>
	<838c3c32-27d9-4a0a-a197-c7227b911942@VA3EHSMHS014.ehs.local>
	<1d3f23370910071641s75b2d217h71a839b1a0b4013c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <1d3f23370910071641s75b2d217h71a839b1a0b4013c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Stephen Neuendorffer <stephenn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I fixed the device tree generator and checked into git-dev, I'll push it ou=
t soon after a little more test time.

-- John

> -----Original Message-----
> From: John Williams [mailto:john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org]
> Sent: Wednesday, October 07, 2009 5:42 PM
> To: John Linn
> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; Linux Kernel list; Michal Simek; David DeB=
onis; Stephen Neuendorffer;
> devicetree-discuss
> Subject: Re: Xilinx SYSACE driver and 8-bit attachment
> =

> Hi John,
> =

> On Thu, Oct 8, 2009 at 12:24 AM, John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > I'll look to see if something has changed. =A0It's not clear to me if i=
t has ever been right.
> >
> > It look like we normally use 16 bit mode as that's how BSB generates th=
e system by default.
> =

> The SP605 reference design uses an 8-bit attachment to the SystemACE -
> that's how I found this issue.
> =

> John
> --
> John Williams, PhD, B.Eng, B.IT
> PetaLogix - Linux Solutions for a Reconfigurable World
> w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
