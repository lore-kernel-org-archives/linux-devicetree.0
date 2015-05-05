From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Tue, 5 May 2015 18:51:33 +0200
Message-ID: <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 May 2015 at 17:18, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> where is a device tree compiler that can compile an overlay?
>
> The compiler at git://git.kernel.org/pub/scm/utils/dtc/dtc.git shrieks
> there is a syntax error as soon as the /plugin/ tag is present.

ok, so I found a dtc patch here https://lkml.org/lkml/2013/1/4/295

This does not apply cleanly to current DTC but the parts that fail are
due to cosmetic changes in the code so I went ahead and applied it.

However, the created blob is not what the kernel can accept into
of_overlay_create so what do I do with the blob to load it?

 Please CC me.

 Thanks

 Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
