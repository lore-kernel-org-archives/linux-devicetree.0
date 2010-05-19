From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 19 May 2010 05:45:50 -0600
Message-ID: <AANLkTimIUgIdMUY0WKH4OXpOATtGbW2bgtT0hhF0HujF@mail.gmail.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201005181054.32325.jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 17, 2010 at 8:54 PM, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wr=
ote:
> Hi all,
>
> As we're getting closer to device tree support on ARM, I'd like to get so=
me
> input on our proposed boot interface.
>
> Basically, I'd like to define how we pass the device tree from the bootlo=
ader
> to the kernel.
>
> My current method of doing this is through a new atag. It looks like this:
>
> =A0 =A0 =A0 =A0/* flattened device tree blob pointer */
> =A0 =A0 =A0 =A0#define ATAG_DEVTREE =A0 =A00x5441000a
>
> =A0 =A0 =A0 =A0struct tag_devtree {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__u32 start; =A0 =A0/* physical start addr=
ess */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__u32 size; =A0 =A0 /* size of dtb image i=
n bytes */
> =A0 =A0 =A0 =A0};
>
> With ATAG_DEVTREE, we keep the existing boot interface the same (ie, mach=
ine
> number in r1, atags pointer r2).

For the reference of those new to this discussion, here is a link to
the previous thread and the link to the draft boot interface document.

http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg00884.ht=
ml
http://devicetree.org/Boot_Environment

[...]

> =A0- We are now potentially carrying data in two different places - atags=
 and
> the device tree. For example, the physical memory layout and kernel comma=
nd
> line may be present in both.

I've tried to explicitly addresses this in the draft document.  the DT
blob always supersedes ATAG information.

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
