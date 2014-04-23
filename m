From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 18/21] powerpc: use libfdt accessors for header data
Date: Wed, 23 Apr 2014 09:05:07 -0500
Message-ID: <CAL_JsqKg8oAd+JmmhERa3Xb1dD9CPz1_cVM3mb=ypWhxkZJHtQ@mail.gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
	<1398215901-25609-19-git-send-email-robherring2@gmail.com>
	<5357C4BE.3050606@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5357C4BE.3050606-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 23, 2014 at 8:48 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> On 04/23/2014 03:18 AM, Rob Herring wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> With libfdt support, we can take advantage of helper accessors in libfdt
>> for accessing the FDT header data. This makes the code more readable and
>> makes the FDT blob structure more opaque to the kernel. This also
>> prepares for removing struct boot_param_header completely.

[...]

>> @@ -117,14 +118,14 @@ static void __init move_device_tree(void)
>>       DBG("-> move_device_tree\n");
>>
>>       start = __pa(initial_boot_params);
>> -     size = be32_to_cpu(initial_boot_params->totalsize);
>> +     size = fdt_totalsize(initial_boot_params);
>
> In 19/21 you use your newly introduced of_get_flat_dt_size()
> that's why I expect you will use it here too.
> size = of_get_flat_dt_size();
>
> The same is for 14/21 where you can use this new function too.
> It means moving 14/21 to the end and using this new function
> makes more sense.

Really, I would prefer to just use libfdt accessors directly rather
than have wrappers, but including libfdt.h is not the cleanest
solution. Since x86 just needed this one function, I added a wrapper.
Since PPC needs other header fields I prefer to use the libfdt
accessors directly for all fields. The same goes for drivers/of/fdt.c.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
