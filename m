From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] of/flattree: Fix crash when device tree absent
Date: Sun, 18 Jul 2010 22:37:09 -0600
Message-ID: <AANLkTinKJZPV2mSJ0YMmZDBDl4cgVYOYeAOiGf7B6w0f@mail.gmail.com>
References: <20100714233130.21887.73872.stgit@angua>
	<20100714233136.21887.27766.stgit@angua>
	<1279497882.10390.1753.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279497882.10390.1753.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 18, 2010 at 6:04 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Wed, 2010-07-14 at 17:31 -0600, Grant Likely wrote:
>> This patch fixes the condition where device tree support is compiled
>> in, but no device tree was proved by firmware. =A0It makes
>> of_platform_bus_probe() explicitly check for a NULL device tree
>> pointer, and adds an error message if the device tree was unable
>> to be flattened.
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> Not sure about the message..

What do you mean?  On the draft ARM code, CONFIG_OF can be set, but no
device tree passed in.  As for the error message, I've removed that
from this patch (see below).

>
>> ---
>> =A0drivers/of/fdt.c =A0 =A0 =A0| =A0 =A02 ++
>> =A0drivers/of/platform.c | =A0 =A02 ++
>> =A02 files changed, 4 insertions(+), 0 deletions(-)
>>
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
> This is of_scan_flat_dt() ... might be better using something like
>
> "Failed to scan the flat device-tree (error %d)". Might also want to
> rate limit it to 1.

I've dropped this hunk anyway.  IIRC, I added this message to the
unflatten function, but it looks to have gotten mangled during a
rebase.  Anyway, there is no need for it right now, so I'll just write
a separate patch later if that changes.

g.
