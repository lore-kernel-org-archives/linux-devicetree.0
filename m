From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH RFC 0/2] of/unittest: Add reference count tests
Date: Wed, 4 Feb 2015 18:08:37 +0100
Message-ID: <CAMuHMdXUbD=4cOa-2Dwzhpz9vYVzjpewx4Z2tcMhccVyrJbVHg@mail.gmail.com>
References: <1422029405-9353-1-git-send-email-geert+renesas@glider.be>
	<CAL_Jsq+7rDCvNQoGVpnjAWwB6Yma6fkiY3YXOso+92iiLU7rEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+7rDCvNQoGVpnjAWwB6Yma6fkiY3YXOso+92iiLU7rEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Feb 4, 2015 at 5:14 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jan 23, 2015 at 10:10 AM, Geert Uytterhoeven
> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>> This patch series adds tests to detect reference count imbalances.
>> The tests use a fixed list of paths to devices nodes (required device
>> nodes in a minimal DTS, and device nodes present in unittest-data).
>> I considered scanning for all present device node instead, but these
>> are more likely to change while running the test.
>>
>> These tests are executed only if CONFIG_OF_DYNAMIC=y.
>>
>> Patches are against devicetree/next, with "[PATCH] of: Add missing
>> of_node_put() in of_find_node_by_path()" (or the alternative proposed
>> by Grant) applied.
>>
>> Note that it shows 44 failures, which I haven't investigated yet:
>
> Do you plan to?

Maybe. It doesn't have such a high priority in my task list...

> While this could find problems in the unittests or the core OF code,
> the vast majority of the problems are likely in the users and this
> doesn't help with those. This whole issue of ref counts has been
> discussed some and probably needs to be redesigned or instrumented in
> a way that users can validate. But then it is pretty low priority
> given that ref counts only matter on pseries.

I agree most issues are in the users.
However, I did find one issue in the core code.

Note that the reference counts may become more important in the future,
as OF_OVERLAY selects OF_DYNAMIC.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
