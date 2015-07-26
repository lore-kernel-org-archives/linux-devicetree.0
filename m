From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/of/fdt.c: replace pr_warning by pr_warn
Date: Sun, 26 Jul 2015 15:39:36 -0500
Message-ID: <CAL_JsqKQ5y_iNezoTOty3ogC9Gmv4728Vf-BfoufN58u10vW7Q@mail.gmail.com>
References: <1437465693-143982-1-git-send-email-long.wanglong@huawei.com>
 <CAL_JsqKY7hTurOdR4kgXZBT922-s-paM-CgU5rv_fB4qinfxSA@mail.gmail.com> <55B2DEE2.8080509@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B2DEE2.8080509-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "long.wanglong" <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wanglong-m92B/FuLcaEcWVvVuXF20w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 24, 2015 at 7:57 PM, long.wanglong <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> On 2015/7/25 3:00, Rob Herring wrote:
>> On Tue, Jul 21, 2015 at 3:01 AM, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>>> Update the last pr_warning callsite in drivers/of.
>>
>> That is obvious in the diff, but can you tell me why?
>
> Hi Rob,
>
> When we use script "./scripts/checkpatch.pl" to check a patch, using pr_warning
> will produce WARNING:
>
>         WARNING: Prefer pr_warn(... to pr_warning(...
>         #22: FILE: drivers/of/fdt.c:428:
>         +               pr_warning("End of tree marker overwritten: %08x\n",
>
> So,we should convert pr_warning to pr_warn.

Okay, but don't explain to me. Explain this in the commit message.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
