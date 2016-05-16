From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] of: Support hashtable lookups for phandles
Date: Mon, 16 May 2016 23:13:50 +0300
Message-ID: <4BD4C1D6-D647-4029-A1E9-C432638C7072@konsulko.com>
References: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com> <1463417556-23087-3-git-send-email-pantelis.antoniou@konsulko.com> <CAL_Jsq+J4QF5jvUOF_J71W0YWswTBSu=RZkwy+=gR2F-dwq7XA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+J4QF5jvUOF_J71W0YWswTBSu=RZkwy+=gR2F-dwq7XA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 16, 2016, at 22:37 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> On Mon, May 16, 2016 at 11:52 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> When a device tree contains a lot of phandles, resolving one
>> takes time because the original method uses a search against
>> all nodes (not just the ones with phandles).
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>> drivers/of/base.c       | 41 ++++++++++++++++++++++++++++++++++++++-=
--
>> drivers/of/dynamic.c    |  8 ++++++++
>> drivers/of/of_private.h | 33 +++++++++++++++++++++++++++++++++
>> include/linux/of.h      |  2 ++
>> 4 files changed, 81 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 20bbc2f..436a088 100644
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
>> @@ -41,6 +42,18 @@ static const char *of_stdout_options;
>>=20
>> struct kset *of_kset;
>>=20
>> +const struct rhashtable_params of_phandle_ht_params =3D {
>=20
> static
>=20

No, it won=E2=80=99t work. The rhashtable API requires using this at ev=
ery call.


>> +       .key_offset =3D offsetof(struct device_node, phandle), /* ba=
se offset */
>> +       .key_len =3D sizeof(phandle),
>> +       .head_offset =3D offsetof(struct device_node, ht_node),
>> +       .automatic_shrinking =3D true,
>> +};
>> +
>> +struct rhashtable *of_phandle_ht;
>> +
>> +/* default is false */
>> +bool of_phandle_ht_is_disabled;
>=20
> I think this should go. The unittest alone is not enough reason to ke=
ep.
>=20

Hmm, OK.

>> +
>> /*
>>  * Used to protect the of_aliases, to hold off addition of nodes to =
sysfs.
>>  * This mutex must be held whenever modifications are being made to =
the
>> @@ -162,6 +175,12 @@ int __of_attach_node_post(struct device_node *n=
p)
>>        struct property *pp;
>>        int rc;
>>=20
>> +       if (of_phandle_ht_available()) {
>=20
> This can never be false as this function should only get called after=
 init.
>=20

How about a BUG_ON() just in case something weird is going on?

>> +               rc =3D of_phandle_ht_insert(np);
>> +               WARN(rc, "insert to phandle hash fail @%s\n",
>> +                               of_node_full_name(np));
>> +       }
>> +
>>        if (!IS_ENABLED(CONFIG_SYSFS))
>>                return 0;
>>=20
>> @@ -194,6 +213,17 @@ void __init of_core_init(void)
>>        struct device_node *np;
>>        int ret;
>>=20
>> +       of_phandle_ht =3D kzalloc(sizeof(*of_phandle_ht), GFP_KERNEL=
);
>> +       if (!of_phandle_ht) {
>> +               pr_warn("devicetree: Failed to allocate hashtable\n"=
);
>> +               return;
>> +       }
>> +       ret =3D rhashtable_init(of_phandle_ht, &of_phandle_ht_params=
);
>> +       if (ret) {
>> +               pr_warn("devicetree: Failed to initialize hashtable\=
n");
>> +               return;
>> +       }
>> +
>>        /* Create the kset, and register existing nodes */
>>        mutex_lock(&of_mutex);
>>        of_kset =3D kset_create_and_add("devicetree", NULL, firmware_=
kobj);
>> @@ -1073,9 +1103,14 @@ struct device_node *of_find_node_by_phandle(p=
handle handle)
>>                return NULL;
>>=20
>>        raw_spin_lock_irqsave(&devtree_lock, flags);
>> -       for_each_of_allnodes(np)
>> -               if (np->phandle =3D=3D handle)
>> -                       break;
>> +       /* when we're ready use the hash table (and not disabled) */
>> +       if (of_phandle_ht_available() && !of_phandle_ht_is_disabled)
>=20
> Just "if (of_phandle_ht)=E2=80=9D
>=20

OK


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
>> index 34ca783..931b905 100644
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
>=20
> Likewise, this can't be false either.
>=20

OK

>> +               rc =3D of_phandle_ht_remove(np);
>> +               WARN(rc, "remove from phandle hash fail @%s\n",
>> +                               of_node_full_name(np));
>> +       }
>>=20
>>        if (!IS_ENABLED(CONFIG_SYSFS))
>>                return;
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index 10b0342..386ae71 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -101,4 +101,37 @@ static inline int of_overlay_init(void)
>> }
>> #endif
>>=20
>> +extern const struct rhashtable_params of_phandle_ht_params;
>> +extern struct rhashtable *of_phandle_ht;
>> +
>> +/* for unittest use */
>> +extern bool of_phandle_ht_is_disabled;
>> +
>> +static inline bool of_phandle_ht_available(void)
>> +{
>> +       return of_phandle_ht !=3D NULL;
>> +}
>> +
>> +static inline int of_phandle_ht_insert(struct device_node *np)
>> +{
>> +       if (!np || !np->phandle)
>> +               return 0;
>> +       return rhashtable_insert_fast(of_phandle_ht,
>> +               &np->ht_node, of_phandle_ht_params);
>> +}
>> +
>> +static inline int of_phandle_ht_remove(struct device_node *np)
>> +{
>> +       if (!np || !np->phandle)
>> +               return 0;
>> +       return rhashtable_remove_fast(of_phandle_ht,
>> +               &np->ht_node, of_phandle_ht_params);
>> +}
>> +
>> +static inline struct device_node *of_phandle_ht_lookup(phandle hand=
le)
>> +{
>> +       return rhashtable_lookup_fast(of_phandle_ht,
>> +                       &handle, of_phandle_ht_params);
>> +}
>> +
>> #endif /* _LINUX_OF_PRIVATE_H */
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 18a8e59..9de9a3f 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -25,6 +25,7 @@
>> #include <linux/notifier.h>
>> #include <linux/property.h>
>> #include <linux/list.h>
>> +#include <linux/rhashtable.h>
>>=20
>> #include <asm/byteorder.h>
>> #include <asm/errno.h>
>> @@ -52,6 +53,7 @@ struct device_node {
>>        phandle phandle;
>>        const char *full_name;
>>        struct fwnode_handle fwnode;
>> +       struct rhash_head ht_node;
>=20
> Place next to .phandle as both will be accessed at the same time.
>=20

OK.

>>=20
>>        struct  property *properties;
>>        struct  property *deadprops;    /* removed properties */
>> --
>> 1.7.12

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
