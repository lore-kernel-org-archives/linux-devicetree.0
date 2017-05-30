From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Tue, 30 May 2017 11:53:35 +0200
Message-ID: <CACRpkdYtq09MYz4xcgYOpKDe406YzatnRKNmVyP9QRU2z5x2_g@mail.gmail.com>
References: <20170516075840.23130-1-andrew@aj.id.au> <CACRpkdZsbzwBKRj1FXAoCW9nD357SNNK8t=gOO-OBtV_pwjpKg@mail.gmail.com>
 <0f526d58-3138-d7ea-0dc7-5ef623fb0547@linaro.org> <CACRpkdYbicYPJvaeTMpHSn4F77ognBfnEbj7OknFiZgfK1qizA@mail.gmail.com>
 <1a165856-6863-ad51-d66c-eda062f4d98e@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1a165856-6863-ad51-d66c-eda062f4d98e-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ryan Chen <ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 30, 2017 at 10:54 AM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 30/05/2017 09:44, Linus Walleij wrote:

>> I guess what we can do is make two different sched_clock()
>> callbacks: one for upward and one for downward counting.
>>
>> Would you like an optimization like that?
>>
>> (It makes sense.)
>
> Yes, thanks Linus!

Can you point me to a git tree with all your patches so I can work
on top of what you have?

I think I will also look into adding delay timers.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
