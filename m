From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Provide dummy of_device_compatible_match() for compile-testing
Date: Tue, 13 Jun 2017 15:52:26 -0500
Message-ID: <CAL_JsqL0=G1A6k2nJjoYCuXHrng3KLOQn8-A65uuWB+EFc6bYA@mail.gmail.com>
References: <1493141928-29251-1-git-send-email-geert+renesas@glider.be> <CAMuHMdUwXXioxt8_nhDM0x1h=KBb6HnNgkzwdM-qGVy7cSNH9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUwXXioxt8_nhDM0x1h=KBb6HnNgkzwdM-qGVy7cSNH9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 13, 2017 at 5:32 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Tue, Apr 25, 2017 at 7:38 PM, Geert Uytterhoeven
> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>> Most of_device_*() functions have dummy versions for CONFIG_OF=n,
>> but of_device_compatible_match() hasn't.  Fix that to improve the
>> ability to do compile-testing.
>>
>> Fixes: b9c13fe32faaa71c ("dt: Add of_device_compatible_match()")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
> Any reason not to apply this patch?

No, sorry I missed it. I've queued it up for 4.13.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
