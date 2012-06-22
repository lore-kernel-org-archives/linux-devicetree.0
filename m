From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] of: reform prom_update_property function
Date: Fri, 22 Jun 2012 13:25:06 +0800
Message-ID: <CAA+hA=RoxfXWOQbZ2i=6w8GJShbpdi4EzkQRghSi2DL5F8pAng@mail.gmail.com>
References: <1340171647-2815-1-git-send-email-b29396@freescale.com>
 <4FE1CB2C.5040208@gmail.com> <1340237796.28143.207.camel@pasglop>
 <20120621093702.GE21231@shlinux2.ap.freescale.net>
 <1340323284.16104.4.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1340323284.16104.4.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 22, 2012 at 8:01 AM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Thu, 2012-06-21 at 17:37 +0800, Dong Aisheng wrote:
>> Maybe we could change it as as follows.
>> It looks then the code follow is the same as before.
>> Do you think if it's ok?
>>
>> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/pl=
atforms/pseries/reconfig.c
>> index 7b3bf76..4c237f4 100644
>> --- a/arch/powerpc/platforms/pseries/reconfig.c
>> +++ b/arch/powerpc/platforms/pseries/reconfig.c
>> @@ -443,6 +443,9 @@ static int do_update_property(char *buf, size_t bufs=
ize)
>> =A0 =A0 =A0 =A0 if (!next_prop)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>>
>> + =A0 =A0 =A0 if (!strlen(name)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> +
>> =A0 =A0 =A0 =A0 newprop =3D new_property(name, length, value, NULL);
>> =A0 =A0 =A0 =A0 if (!newprop)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> @@ -450,13 +453,6 @@ static int do_update_property(char *buf, size_t buf=
size)
>> =A0 =A0 =A0 =A0 if (!strcmp(name, "slb-size") || !strcmp(name, "ibm,slb-=
size"))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 slb_set_size(*(int *)value);
>>
>> - =A0 =A0 =A0 oldprop =3D of_find_property(np, name,NULL);
>> - =A0 =A0 =A0 if (!oldprop) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strlen(name))
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return prom_add_property(n=
p, newprop);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> - =A0 =A0 =A0 }
>
> No:
>
> IE. Old code did:
>
> =A0 =A0 =A0 =A0if (property doesn't exist) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (has a name)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0create_it()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
> =A0 =A0 =A0 =A0}
>
What i saw is:
       if (property doesn't exist) {
               if (has a name)
                       return create_it()
               return -ENODEV;
       }
Which seems the same behavior as the new prop_update_property api.
The only different is if no name, return -EINVAL;
Am i wrong?

> What you propose is:
>
> =A0 =A0 =A0 =A0if (!has_a_name)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
>
> Not at all the same semantic.
>
> =A0.../...
>
>> > IE. The allocation of the "old" property isn't disposed of. It can't
>> > because today we don't know whether any of those pointers was
>> > dynamically allocated or not. IE they could point to the fdt
>
>> Hmm, i did not see static allocated property before.
>> Where can we see an exist case?
>
> Almost all your property names and values. They are pointers to the
> original fdt block, so you can't free them. But dynamically added
> propreties will have kmalloc'ed pointers which should be freed. We need
> to add flags to indicate that if we want to avoid leaking memory in very
> dynamic environments.
>
Okay, got it, thanks for clarify.

>> If we really have this issue, it seems of_node_release also has the same=
 issue,
>> since it frees the property without distinguish whether the property is =
allocated
>> dynamically.
>
> Well, actually we do have a flag:
>
> =A0 =A0 =A0 =A0if (!of_node_check_flag(node, OF_DYNAMIC))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
Oh, i see.

> So we use that. Good. So if update property uses that flag it should be
> able to know when to free or not. I forgot we had that :-)
>
I'm still not sure whether we should free the property in update
property function.
Looking at the code, it seems prom_update_property actually does not remove=
 it.
It only move the property to "dead properties" list.
See the function comment in kernel:
/**
 * prom_remove_property - Remove a property from a node.
 *
 * Note that we don't actually remove it, since we have given out
 * who-knows-how-many pointers to the data using get-property.
 * Instead we just move the property to the "dead properties"
 * list, so it won't be found any more.
 */

Finally the dead properties will be freed in of_release_node
if the node has no users after calling of_node_put.

static void of_node_release(struct kref *kref)
{
.....
        struct property *prop =3D node->properties;
.......
        if (!of_node_check_flag(node, OF_DYNAMIC))
                return;

        while (prop) {
                struct property *next =3D prop->next;
                kfree(prop->name);
                kfree(prop->value);
                kfree(prop);
                prop =3D next;

                if (!prop) {
                        prop =3D node->deadprops;
                        node->deadprops =3D NULL;
                }
        }
        kfree(node->full_name);
        kfree(node->data);
        kfree(node);
}

So it looks to me there's no memory leak,
did i understand wrong?

>> > string list, data block, or could be bootmem ... or could be
>> > actual kernel memory.
>> >
>> > We might want to extend the struct property to contain indications of
>> > the allocation type so we can kfree dynamic properties properly.
>> >
>> I wonder the simplest way may be not allow static allocated property, li=
ke dt
>> node does i guess.
>
> No way. We generate the device-tree way before we have an allocator
> available.
>
Oh, got it.

>> > But then there's the question of the lifetime of a property... since
>> > they aren't reference counted like nodes are.
>> >
>> Yes, that's a real exist problem.
>>
>> Anyway, i guess we could do that work of this problem in another patch
>> rather than have to in this patch series.
>
> Cheers,
> Ben.
>
>

Regards
Dong Aisheng
