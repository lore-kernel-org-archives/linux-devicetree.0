From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Thu, 3 Aug 2017 10:14:32 +0200
Message-ID: <CACRpkdYqj68NpqedyPY2P6o_-JcVaw=4xzh7ccw6t-2gcy5sqg@mail.gmail.com>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog@mail.gmail.com>
 <20170719131640.GA2533@localhost> <596F73BC.1000305@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <596F73BC.1000305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 4:59 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Wednesday 19 July 2017 06:55 PM, Johan Hovold wrote:

>> I guess the latter is fine, even if it is likely to amount to a fair bit
>> of debugging world wide.
>>
>> Perhaps all this can still be avoided by adding further flags and
>> deprecating others before people start migrating to 4.12 (after all,
>> GPIO_OPEN_DRAIN has been around since 4.4 even if there are no in-kernel
>> users).
>>
>> Or we accept the binary interface breakage -- it probably is pretty rare
>> that people update the kernel without updating the dtb. I can just
>> update the dts on the system that broke for me, and hopefully anyone
>> debugging this issue while updating to 4.12 will find this mail quickly.
>
> Yes, it breaks the older DTS with new kernel. However,  this point was
> discussed before sending patch. As there was no user in the mainline DTs for
> these macros, we made change.

My operating assumption is usually "rough consensus and running code".

If the code doesn't run, i.e. if there are regressions then we need to fix
them.

I am not aware of any systems having picked up the flags as they were
set before this patch, but if they exist we need to patch it of course.

On the other hand we don't patch theoretical compatibility issues either,
only those that occure in practice.

It falls back on when a DT binding is really standardized. When it is
starting to get discussed? When the final binding is merged to the kernel
tree? When the devicetree.org people publish it? When a big enough
vendor ships more than 100 devices using it no matter what happened
discussion-wise?

All these are a bit fluid concepts, so as a result, the handling of bindings
is a bit fluid.

If we really want DT bindings to have a point when they are "set in stone"
then we need to talk to devicetree.org about that. But in reality I think all
standards ever are a bit fuzzy around the edges.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
