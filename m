From: Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] pinctrl: export pin_request to support parent pin
Date: Wed, 7 Sep 2016 09:38:06 +0800
Message-ID: <CABymUCMpbxidceZiePz9gTZ=_1hXSjqS34SYCZxLBJFrTVgvwg@mail.gmail.com>
References: <1472213942-4815-1-git-send-email-jun.nie@linaro.org> <CACRpkdYPfBKshf1jGF85vj+bzwb1kX+2j-kUA+8+w+vSFPuGDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYPfBKshf1jGF85vj+bzwb1kX+2j-kUA+8+w+vSFPuGDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Liu <jason.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-09-06 21:55 GMT+08:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On Fri, Aug 26, 2016 at 2:19 PM, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> Some pin functions may be controlled in 2nd level multiplex.
>> We need configure 1st level multiplex when request such
>> functions. Export pin_request functionality so that parent
>> can be configured automatically with calling it in
>> pinmux_ops->request().
>>
>> Signed-off-by: Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> This looks weird as 1/3, please put the DT bindings first in the
> series.

I thought 1/3 patch does not relate to ZTE driver directly, so I put as the
2nd patch. Will move it to the very first one as you point out.

>
> We first need to agree on how to represent this before we start
> hacking around in the core to support different shortcuts.
>
> This patch just makes me nervous, but maybe I can be convinced
> otherwise if we get some details on how the hardware works and why
> this is necessary.

Hardware has two register regions to control pinmux, one is for normal
function configuration and the other one is for always on subsystem(AON).
Some pins are controlled by both normal register and AON register. AON
register is the first level control for pinmux. If we need any
function in normal
register configuration, we need configure related AON pinmux register as
non-AON function first. Then we configure normal pinmux register to get the
pin function we want.

>
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
