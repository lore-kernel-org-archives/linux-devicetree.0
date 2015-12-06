From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v7 45/50] drivers/of: Avoid recursively calling
 unflatten_dt_node()
Date: Sun, 6 Dec 2015 13:49:29 -0800
Message-ID: <5664AD69.6050702@roeck-us.net>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-46-git-send-email-gwshan@linux.vnet.ibm.com>
 <CAL_Jsq+BnPEKkRgQX4+e0MA9dKLVLhy8rVF25Fr9yXL2jp+WLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+BnPEKkRgQX4+e0MA9dKLVLhy8rVF25Fr9yXL2jp+WLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/06/2015 12:28 PM, Rob Herring wrote:
> +Guenter
>
> On Wed, Nov 4, 2015 at 7:12 AM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>> In current implementation, unflatten_dt_node() is called recursively
>> to unflatten device nodes in FDT blob. It's stress to limited stack
>> capacity.
>>
>> This avoids calling the function recursively, meaning the device
>> nodes are unflattened in one call on unflatten_dt_node(): two arrays
>> are introduced to track the parent path size and the device node of
>> current level of depth, which will be used by the device node on next
>> level of depth to be unflattened. Also, the parameter "poffset" and
>> "fpsize" are unused and dropped.
>
> Do you plan to respin the OF parts at least soon? There's another
> problem Guenter found that of_fdt_unflatten_tree is not re-entrant due
> to "depth" being static and this series fixes that. So I'd rather
> apply this and avoid adding a mutex if possible.
>

Hi Rob,

We see this problem in 4.1, so whatever patch you accept should be
back-ported to at least that release.

Any idea when this patch will be accepted ? We actively see the problem
in our kernel, so I'll need a solution soon. Otherwise I'll have to apply
my patch to our kernel and revert it as soon as the 'real' patch has been
back-ported.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
