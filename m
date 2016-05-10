From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH 2/3] of: Support hashtable lookups for phandles
Date: Tue, 10 May 2016 16:52:51 +0300
Message-ID: <0BE5569D-749B-40FC-AA22-218A49344E09@antoniou-consulting.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-3-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLyKs02A0dhJAKZ2H38biJ4ufYg3-KyA2r1u=C+2ZowFA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLyKs02A0dhJAKZ2H38biJ4ufYg3-KyA2r1u=C+2ZowFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 10, 2016, at 00:21 , Rob Herring <robherring2@gmail.com> wrote=
:
>=20
> On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>=20
> Why this is needed goes here.
>=20
> Any data on how much time the current code takes?
>=20

I=E2=80=99ll get some numbers. The current algorithm is exhaustive sear=
ch of
all nodes (not even nodes that have phandles). So it=E2=80=99s kind of =
obvious
bad on large blobs.

>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/base.c       | 35 ++++++++++++++++++++++++++++++++---
>> drivers/of/dynamic.c    |  8 ++++++++
>> drivers/of/of_private.h | 31 +++++++++++++++++++++++++++++++
>> include/linux/of.h      |  2 ++
>> 4 files changed, 73 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 20bbc2f..770cb95 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -27,6 +27,7 @@
>> #include <linux/slab.h>
>> #include <linux/string.h>
>> #include <linux/proc_fs.h>
>> +#include <linux/rhashtable.h>
>>=20
>> #include "of_private.h"
>>=20
>> @@ -41,6 +42,16 @@ static const char *of_stdout_options;
>>=20
>> struct kset *of_kset;
>>=20
>> +const struct rhashtable_params of_phandle_ht_params =3D {
>> +       .key_offset =3D offsetof(struct device_node, phandle), /* ba=
se offset */
>> +       .key_len =3D sizeof(phandle),
>> +       .head_offset =3D offsetof(struct device_node, ht_node),
>> +       .automatic_shrinking =3D true,
>> +};
>> +
>> +struct rhashtable of_phandle_ht;
>> +bool of_phandle_ht_initialized;
>=20
> Get rid of this and of_phandle_ht_available. It should always be init=
ialized.
>=20

Not that simple. We have to support the case where calls are made very =
early
in the boot sequence before the initialization.

>> +
>> /*
>>  * Used to protect the of_aliases, to hold off addition of nodes to =
sysfs.
>>  * This mutex must be held whenever modifications are being made to =
the
>> @@ -162,6 +173,12 @@ int __of_attach_node_post(struct device_node *n=
p)
>>        struct property *pp;
>>        int rc;
>>=20
>> +       if (of_phandle_ht_available()) {
>> +               rc =3D of_phandle_ht_insert(np);
>> +               WARN(rc, "insert to phandle hash fail @%s\n",
>> +                               of_node_full_name(np));
>> +       }
>> +
>>        if (!IS_ENABLED(CONFIG_SYSFS))
>>                return 0;
>>=20
>> @@ -194,6 +211,13 @@ void __init of_core_init(void)
>>        struct device_node *np;
>>        int ret;
>>=20
>> +       ret =3D rhashtable_init(&of_phandle_ht, &of_phandle_ht_param=
s);
>> +       if (ret) {
>> +               pr_warn("devicetree: Failed to initialize hashtable\=
n");
>> +               return;
>> +       }
>> +       of_phandle_ht_initialized =3D 1;
>> +
>>        /* Create the kset, and register existing nodes */
>>        mutex_lock(&of_mutex);
>>        of_kset =3D kset_create_and_add("devicetree", NULL, firmware_=
kobj);
>> @@ -1073,9 +1097,14 @@ struct device_node *of_find_node_by_phandle(p=
handle handle)
>>                return NULL;
>>=20
>>        raw_spin_lock_irqsave(&devtree_lock, flags);
>> -       for_each_of_allnodes(np)
>> -               if (np->phandle =3D=3D handle)
>> -                       break;
>> +       /* when we're ready use the hash table */
>> +       if (of_phandle_ht_available() && !in_interrupt())
>> +               np =3D of_phandle_ht_lookup(handle);
>> +       else { /* fallback */
>> +               for_each_of_allnodes(np)
>> +                       if (np->phandle =3D=3D handle)
>> +                               break;
>> +       }
>>        of_node_get(np);
>>        raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>        return np;
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index eb31a55..bdebdf5 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -11,6 +11,7 @@
>> #include <linux/slab.h>
>> #include <linux/string.h>
>> #include <linux/proc_fs.h>
>> +#include <linux/rhashtable.h>
>>=20
>> #include "of_private.h"
>>=20
>> @@ -44,6 +45,13 @@ EXPORT_SYMBOL(of_node_put);
>> void __of_detach_node_post(struct device_node *np)
>> {
>>        struct property *pp;
>> +       int rc;
>> +
>> +       if (of_phandle_ht_available()) {
>> +               rc =3D of_phandle_ht_remove(np);
>> +               WARN(rc, "remove from phandle hash fail @%s\n",
>> +                               of_node_full_name(np));
>=20
> Can this really fail?
>=20

No, unless the structure is corrupted. I can move it under DEBUG.

> Rob
> =E2=80=94

Regards

=E2=80=94 Pantelis
