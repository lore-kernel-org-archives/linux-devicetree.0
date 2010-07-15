From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] of/flattree: Fix crash when device tree absent
Date: Thu, 15 Jul 2010 00:15:17 -0600
Message-ID: <AANLkTikD3ZhhVg4PTuG5Zkc38oW1I6yaQyKqcv9rAaoR@mail.gmail.com>
References: <20100714233130.21887.73872.stgit@angua>
	<20100714233136.21887.27766.stgit@angua>
	<1279156262.15089.68.camel@pororo.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279156262.15089.68.camel-353AF/3W9ll+urZeOPWqwQ@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 14, 2010 at 7:11 PM, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wr=
ote:
> Hi Grant,
>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index d61fda8..66401bc 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -94,6 +94,8 @@ int __init of_scan_flat_dt(int (*it)(unsigned long nod=
e,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 } while (1);
>>
>> + =A0 =A0 if (rc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Failed to unflatten device tree blob. =
=A0rc=3D%i\n", rc);
>> =A0 =A0 =A0 return rc;
>> =A0}
>
> rc =3D=3D 1 is perfectly valid - it indicates that the iterator callback
> stopped the scan early.

This was just an informational output anyway.  I'll just drop this hunk.

> How about we just check for the presence of OF_DT_HEADER instead?

Probably a good idea.  We'll need more robust dtb pointer checking
with ARM.  I'll do that in a separate patch.

g.
