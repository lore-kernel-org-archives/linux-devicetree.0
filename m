From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Tue, 30 May 2017 09:44:26 +0200
Message-ID: <CACRpkdYbicYPJvaeTMpHSn4F77ognBfnEbj7OknFiZgfK1qizA@mail.gmail.com>
References: <20170516075840.23130-1-andrew@aj.id.au> <CACRpkdZsbzwBKRj1FXAoCW9nD357SNNK8t=gOO-OBtV_pwjpKg@mail.gmail.com>
 <0f526d58-3138-d7ea-0dc7-5ef623fb0547@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0f526d58-3138-d7ea-0dc7-5ef623fb0547-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ryan Chen <ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 28, 2017 at 8:27 PM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 28/05/2017 15:59, Linus Walleij wrote:
>> On Tue, May 16, 2017 at 9:58 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
>>
>>> Also clean up space-before-tab issues in the documentation.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
>>
>> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Does this collide with Daniel's 2500 patch?
>>
>> Sorry for the mess, tell me if I need to fix something up :(
>
> It is ok, an usual collision change to be fixed when merging ;)
>
> By the way, can you have a look at fttmr010_read_sched_clock to remove
> the local_fttmr->count_down test?

I guess what we can do is make two different sched_clock()
callbacks: one for upward and one for downward counting.

Would you like an optimization like that?

(It makes sense.)

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
