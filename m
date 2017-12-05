From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: overlay: Fix cleanup order in of_overlay_apply()
Date: Mon, 4 Dec 2017 20:25:57 -0600
Message-ID: <CAL_JsqL9OnGQ5WVHSQPCTEUKLk_fSTgZ0qnPjzqQqW9SZ5hURg@mail.gmail.com>
References: <1512402456-8176-1-git-send-email-geert+renesas@glider.be>
 <1512402456-8176-3-git-send-email-geert+renesas@glider.be>
 <CAL_JsqJqb-01rQ6D65-r3Q1ZdF407b11BrVgnUQZPjyTW8hj8A@mail.gmail.com> <CAMuHMdVFR3FPVAM2J_L2HvNUzkJsQM57SJJ2CMux71M4dhZYfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVFR3FPVAM2J_L2HvNUzkJsQM57SJJ2CMux71M4dhZYfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 4, 2017 at 1:45 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Rob,
>
> On Mon, Dec 4, 2017 at 8:35 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Dec 4, 2017 at 9:47 AM, Geert Uytterhoeven
>> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>>> The special overlay mutex is taken first, hence it should be released
>>> last in the error path.
>>>
>>> Move "mutex_lock(&of_mutex)" up, as suggested by Frank, as
>>> free_overlay_changeset() should be called with that mutex held if any
>>> non-trivial cleanup is to be done.
>>
>> Not holding the of_mutex for of_resolve_phandles is just wrong.
>> Without it, a node and new phandle could be added via of_attach_node
>> making the max phandle wrong.
>
> After my patch it's held, so what's the problem?

There's no problem. Just highlighting the issue with the prior
location is more than it seems from your explanation.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
