From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] of/address: replace printk(KERN_ERR ...) with pr_err(...)
Date: Wed, 9 Dec 2015 01:09:32 +0900
Message-ID: <CAK7LNAQr+9gv84S0=S_WZNQ_+8F1VcZx_o2Df3Pjj=ovF0KsAg@mail.gmail.com>
References: <1448864059-12319-1-git-send-email-yamada.masahiro@socionext.com>
	<CAL_JsqJNsQtGe9cUJVj_iqzsRfB+CyCxACNW6FBDDE28T3tm_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJNsQtGe9cUJVj_iqzsRfB+CyCxACNW6FBDDE28T3tm_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

2015-12-07 5:40 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Nov 30, 2015 at 12:14 AM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> A trivial change suggested by checkpatch.pl.
>
> You might as well all levels while you are at it. Looks like that is
> only one more:
>
> drivers/of/address.c:   printk(KERN_DEBUG "%s", s);
>

OK, I have just posted v2.





-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
