From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] powerpc: pseries: vio: match parent nodes with of_find_node_by_path
Date: Thu, 24 Aug 2017 13:08:48 -0500
Message-ID: <CAL_Jsq+sUgVcfNkpAHG7TmkO03+-0_GuZVW2tpxq6Xm2qDzUog@mail.gmail.com>
References: <20170821151651.25096-1-robh@kernel.org> <20170821151651.25096-3-robh@kernel.org>
 <87fuckb2z2.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fuckb2z2.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, David Laight <David.Laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 12:12 AM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>
>> In preparation to remove the full path from device_node.full_name, use
>> of_find_node_by_path instead of open coding with strcmp.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
>> Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> ---
>> v2:
>> - rebased to linux-next and removed spurious change fro patch 1.
>>
>>  arch/powerpc/platforms/pseries/vio.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
>> index aa5ca74316fa..5754572deb23 100644
>> --- a/arch/powerpc/platforms/pseries/vio.c
>> +++ b/arch/powerpc/platforms/pseries/vio.c
>> @@ -1357,9 +1357,9 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
>>        */
>>       parent_node = of_get_parent(of_node);
>>       if (parent_node) {
>> -             if (!strcmp(parent_node->full_name, "/ibm,platform-facilities"))
>> +             if (parent_node == of_find_node_by_path("/ibm,platform-facilities"))
>>                       family = PFO;
>> -             else if (!strcmp(parent_node->full_name, "/vdevice"))
>> +             else if (parent_node == of_find_node_by_path("/vdevice"))
>>                       family = VDEVICE;
>
> This leaks references to the looked up nodes.
>
> Both these nodes are defined in PAPR (our hypervisor spec), and both of
> them must have a device_type, either "ibm,platform-facilities" or
> "vdevice".
>
> Looking at the commit that added the code I don't see any particular
> reason it used the comparison against full_name, rather than using the
> device_type.
>
> So I'm inclined to do this instead:
>
> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> index 8a47f168476b..f26f906e6021 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -1357,9 +1357,9 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
>          */
>         parent_node = of_get_parent(of_node);
>         if (parent_node) {
> -               if (!strcmp(parent_node->full_name, "/ibm,platform-facilities"))
> +               if (!strcmp(parent_node->type, "ibm,platform-facilities"))
>                         family = PFO;
> -               else if (!strcmp(parent_node->full_name, "/vdevice"))
> +               else if (!strcmp(parent_node->type, "vdevice"))
>                         family = VDEVICE;
>                 else {
>                         pr_warn("%s: parent(%s) of %s not recognized.\n",
>
>
> I've checked both Qemu and kvmtool add the device_type, and I'm fairly
> confident that PowerVM does too. Anyway I'll test it on all the machines
> I can find.

Okay, do you want me to respin the patch or will you update it with
the above change?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
