From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: drivers/of: crash on boot
Date: Wed, 18 May 2016 19:23:49 -0500
Message-ID: <CAL_JsqKn1BLCiW=CBch4G8s=YheXFVouhz+JVvB6j8-4W-UK6A@mail.gmail.com>
References: <573C8B6C.6030900@oracle.com> <CAL_JsqJsjh+Shk1nD5YQeQ=6B1MZOyEj5oX-q_xKH642toURdA@mail.gmail.com>
 <80967a3a-3b97-e131-97e5-f449f567b01c@nvidia.com> <d0e2564c-c8d4-2c4c-f194-60b43b0ab80e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d0e2564c-c8d4-2c4c-f194-60b43b0ab80e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sasha Levin <sasha.levin-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 4:26 PM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
> On 5/18/2016 3:58 PM, Rhyland Klein wrote:
>> On 5/18/2016 3:36 PM, Rob Herring wrote:
>>> On Wed, May 18, 2016 at 10:34 AM, Sasha Levin <sasha.levin@oracle.c=
om> wrote:
>>>> Hi Rhyland,
>>>>
>>>> I'm seeing a crash on boot that seems to have been caused by
>>>> "drivers/of: Fix depth when unflattening devicetree":
>>>>
>>>> [   61.145229] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>>>
>>>> [   61.147588] BUG: KASAN: stack-out-of-bounds in unflatten_dt_nod=
es+0x11d2/0x1290 at addr ffff88005b30777c
>>>
>>> The following appears to fix it for me. Rhyland, please confirm.
>>>
>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>> index 7f38241..888ec2a 100644
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -409,7 +409,7 @@ static int unflatten_dt_nodes(const void *blob,
>>>         fpsizes[depth] =3D dad ? strlen(of_node_full_name(dad)) : 0=
;
>>>         nps[depth+1] =3D dad;
>>>         for (offset =3D 0;
>>> -            offset >=3D 0;
>>> +            offset >=3D 0, depth >=3D 0;
>>>              offset =3D fdt_next_node(blob, offset, &depth)) {
>>>                 if (WARN_ON_ONCE(depth >=3D FDT_MAX_DEPTH))
>>>                         continue;
>>>
>>
>> If I try that patch, i see this when compiling:
>>
>> In function =E2=80=98unflatten_dt_nodes=E2=80=99:
>> warning: left-hand operand of comma expression has no effect
>> [-Wunused-value]
>>       offset >=3D 0, depth >=3D 0;

Doh! However, that does make the unit test pass and I don't see a NULL =
ptr...

>>
>
> This patch seems to work for me. I found a bug in my original patch.
> Sasha/Rob, can you see if this works for you too:
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 0b5850027bb5..e7a8caac5b27 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -407,9 +407,9 @@ static int unflatten_dt_nodes(const void *blob,
>
>         root =3D dad;
>         fpsizes[depth] =3D dad ? strlen(of_node_full_name(dad)) : 0;
> -       nps[depth+1] =3D dad;
> +       nps[depth] =3D dad;
>         for (offset =3D 0;
> -            offset >=3D 0;
> +            offset >=3D 0 && depth >=3D 0;
>              offset =3D fdt_next_node(blob, offset, &depth)) {
>                 if (WARN_ON_ONCE(depth >=3D FDT_MAX_DEPTH))
>                         continue;

This is not work for me. I'm booting x86 with the DT unit test and
KASAN enabled. I suspect our differences are due to different data
after the end of the dtb. Also, I think there may be a bug in
fdt_next_node FDT_END handling. The "!depth" seems suspicious to me
and I think it should be "!(*depth)".

The DT overlay unit tests are also failing. Not sure if that's related.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
