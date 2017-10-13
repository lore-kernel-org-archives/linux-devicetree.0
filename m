From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: do not leak console options
Date: Fri, 13 Oct 2017 21:48:34 +0200
Message-ID: <CAMuHMdXL1v20PvP2=jv_YdNgk0afkrgfZf1b21LrTWXGoPDMhg@mail.gmail.com>
References: <20170926062510.4948-1-sergey.senozhatsky@gmail.com> <20171003072007.GB9706@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003072007.GB9706-KsEp0d+Q8qECVLCxKZUutA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 3, 2017 at 9:20 AM, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org> wrote:
> On Tue 2017-09-26 15:25:10, Sergey Senozhatsky wrote:
>> Do not strdup() console options. It seems that the only reason for
>> it to be strdup()-ed was a compilation warning: printk, UART and
>> console drivers, for some reason, expect char pointer instead of
>> const char pointer. So we can just pass `of_stdout_options', but
>> need to cast it to char pointer. A better fix would be to change
>> printk, console drivers and UART to accept const char `options';
>> but that will take time - there are lots of drivers to update.
>>
>> The patch also fixes a possible memory leak: add_preferred_console()
>> can fail, but we don't kfree() options.
>>
>> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Of course, it would be better to change add_preferred_console().
> But it would trigger many other changes. This alternative
> "temporary" change looks safe to me. Feel free to use

Really? Unless I'm missing something (it's been way too many hours after my
morning coffee), add_preferred_console() just calls __add_preferred_console(),
and the latter doesn't touch the passed string. As passing a "char *" to a
function that excepts a "const char *" is fine, you can just add "const" to
both add_preferred_console() and __add_preferred_console(), and be done with
it.

Repeat after me: casts are evil.

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
