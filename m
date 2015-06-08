From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Mon, 8 Jun 2015 11:14:34 +0300
Message-ID: <CF8AAE4C-400C-47D9-9440-3CD04DF02F50@konsulko.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org> <1433686811-12303-3-git-send-email-grant.likely@linaro.org> <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ricardo, Grant,

> On Jun 7, 2015, at 21:13 , Ricardo Ribalda Delgado <ricardo.ribalda@g=
mail.com> wrote:
>=20
> Hello Grant
>=20
> I would ask you to go through all the discussion related to this bug.
> Here is a summary (please anyone involved correct me if I am wrong)
>=20
> 1) I send a patch to fix the oops if release resource is executed wit=
h
> a resource without parent
> 2) Bjorn says that we should fix the issue of the problem, which he
> pointed out being that we use platform_device_del() after using
> of_device_add()
> 3) I resend a patchset to use platform_devide_add()
> 4) 3 series of cleanouts after the help from Rob and Bjorn
> 5) Greg adds the series (v5) to his device core tree
> 6) You complaint that that series can break miss behaved platforms
> 7) I send a couple of patches that fix your problem and leaves the
> window open to blacklist the platforms that miss behave.
>=20
> now you send a patch that takes us to back to step 1), and adds some
> code that is already merged into gregk's
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/t=
ree/drivers/base/platform.c?h=3Ddriver-core-testing#n314
>=20
>=20
> Wouldn't you agree that it will be a better solution to give your
> feedback regarding https://lkml.org/lkml/2015/6/5/246 and fix this
> issue together?
>=20
> that solution has been reviewed by a bunch of people, removes code
> duplication and afaik, is tested, does not break any platform, and I
> believe that is closer to an scenario when we can remove
> of_device_add() and all the devices behave similarly.
>=20
>=20
> Best Regards
>=20

Either patch fixes (or rather papers over) the problem.

The way I understand it is that we have two issues.

1. The rather obvious crash on device removal.
2. The of_platform_populate (and the subsequent call to=20
of_platform_device_create_pdata()) not registering the resources
due to bugs in platforms that do overlapping regions.


#1 is fixed but #2 is rather touchy.

I would like to eventually fix those platforms; starting with a
nice fat warning when using overlapping regions would be nice.

The problem is how to deal with range definitions that overlap.
Does anyone remember what does the spec say regarding those?

If the way they are used now in those platform is wrong we should
mark them in some manner in the DT so that the idiom does not propagate=
=2E

If they are valid, so be it, we have to fix it in driver core somehow.

Regards

=E2=80=94 Pantelis

>=20
>=20
> On Sun, Jun 7, 2015 at 4:20 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
> wrote:
>> The unregister path of platform_device is broken. On registration, i=
t
>> will register all resources with either a parent already set, or
>> type=3D=3DIORESOURCE_{IO,MEM}. However, on unregister it will releas=
e
>> everything with type=3D=3DIORESOURCE_{IO,MEM}, but ignore the others=
=2E There
>> are also cases where resources don't get registered in the first pla=
ce,
>> like with devices created by of_platform_populate()*.
>>=20
>> Fix the unregister path to be symmetrical with the register path by
>> checking the parent pointer instead of the type field to decide whic=
h
>> resources to unregister. This is safe because the upshot of the
>> registration path algorithm is that registered resources have a pare=
nt
>> pointer, and non-registered resources do not.
>>=20
>> * It can be argued that of_platform_populate() should be registering
>>  it's resources, and they argument has some merit. However, there ar=
e
>>  quite a few platforms that end up broken if we try to do that due t=
o
>>  overlapping resources in the device tree. Until that is fixed, we n=
eed
>>  to solve the immediate problem.
>>=20
>> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> drivers/base/platform.c | 8 ++------
>> 1 file changed, 2 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
>> index ebf034b97278..7403de94832c 100644
>> --- a/drivers/base/platform.c
>> +++ b/drivers/base/platform.c
>> @@ -375,9 +375,7 @@ int platform_device_add(struct platform_device *=
pdev)
>>=20
>>        while (--i >=3D 0) {
>>                struct resource *r =3D &pdev->resource[i];
>> -               unsigned long type =3D resource_type(r);
>> -
>> -               if (type =3D=3D IORESOURCE_MEM || type =3D=3D IORESO=
URCE_IO)
>> +               if (r->parent)
>>                        release_resource(r);
>>        }
>>=20
>> @@ -408,9 +406,7 @@ void platform_device_del(struct platform_device =
*pdev)
>>=20
>>                for (i =3D 0; i < pdev->num_resources; i++) {
>>                        struct resource *r =3D &pdev->resource[i];
>> -                       unsigned long type =3D resource_type(r);
>> -
>> -                       if (type =3D=3D IORESOURCE_MEM || type =3D=3D=
 IORESOURCE_IO)
>> +                       if (r->parent)
>>                                release_resource(r);
>>                }
>>        }
>> --
>> 2.1.4
>>=20
>=20
>=20
>=20
> --=20
> Ricardo Ribalda

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
