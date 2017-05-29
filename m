From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] reset: Add basic single-register reset driver
Date: Mon, 29 May 2017 18:41:13 +0300
Message-ID: <CAHp75VeLmwUwkpJ7C7bzKOq5YzFXabHseqCwM+Wf09s2-=amRA@mail.gmail.com>
References: <20170526033214.8081-1-joel@jms.id.au> <20170526033214.8081-3-joel@jms.id.au>
 <CAHp75VdXHnyTDJqZ8D+OxbrAXYQE+-sfTzYvfoo8FCe0SS35PA@mail.gmail.com> <CACPK8XeZEY6yVpf=Awmzju+W74-+4sRAQL3LK0nX9iN4_MrcKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XeZEY6yVpf=Awmzju+W74-+4sRAQL3LK0nX9iN4_MrcKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 29, 2017 at 1:24 PM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> On Sun, May 28, 2017 at 12:41 AM, Andy Shevchenko
> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, May 26, 2017 at 6:32 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
>>> This driver is a basic single-register reset controller driver that
>>> supports clearing a single bit in a register.
>>>
>>
>> While this makes sense, I'm wondering if there can be generic
>> interface for this from which we can derive this one and GPIO-based
>> one.
>
> Do we have a GPIO based one already? I couldn't find it.

No, we haven't.

> Having a think, it would be a very similar looking driver, but with
> little shared code. The context struct would contain a gpio pointer
> instead of regmap, probe would request a GPIO instead of a regmap and
> the assert/deassert/status callbacks would be gpiod_ calls.
>
> Given this is four of the four functions in this driver, do you think would be
> better off with two small drivers?

Fair enough.
Sounds like independent drivers for now is a good approach, though
it's up to maintainer.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
