From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] MIPS: fix build with CONFIG_OF=y for non OF-enabled targets
Date: Sun, 19 Jul 2015 23:16:30 +0200
Message-ID: <CAOiHx=mChjd5sMDat2qPW73Hjjxoqs11s5SoHz+9AxV0K7MiYA@mail.gmail.com>
References: <1437309769-8382-1-git-send-email-jogo@openwrt.org> <CAL_JsqKwQHqUauyOxYg2PF4rBy1DC_UC9s8orWuXUsxMf66bMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKwQHqUauyOxYg2PF4rBy1DC_UC9s8orWuXUsxMf66bMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 19, 2015 at 11:06 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Jul 19, 2015 at 7:42 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>> Commit 01306aeadd75 ("MIPS: prepare for user enabling of CONFIG_OF")
>> changed the guards in asm/prom.h from CONFIG_OF to CONFIG_USE_OF, but
>> missed the actual function declarations in kernel/prom.c, which have
>> additional dependencies.
>
> Just curious, what machine do you hit this on?

bcm63xx without my local WIP OF-patches applied, but still CONFIG_OF=y
in the .config. So more accidentally found than intentionally OF
enabled.


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
