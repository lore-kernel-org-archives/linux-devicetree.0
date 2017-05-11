From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] of: remove extraneous 'const' in typedef
Date: Thu, 11 May 2017 17:03:49 +0200
Message-ID: <CAK8P3a3YNqUrV1eREJ4eZaULO-+A2EnTg+2s7RUNd77F0d9wng@mail.gmail.com>
References: <20170511122458.3862716-1-arnd@arndb.de> <CAL_JsqJxubj3Swe7qr7sU8xJbQJRcK17LYKpDhN4DsF-yg7cHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJxubj3Swe7qr7sU8xJbQJRcK17LYKpDhN4DsF-yg7cHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 4:44 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, May 11, 2017 at 7:24 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> One change that was meant to address a sparse warning turned out
>> to cause hundreds of new gcc-7 warnings:
>
> I guess you are the only one on gcc-7.

It was just released last week or so. I actually had been using it for
a while but accidentally disabled a lot of the warning output until now
some others started using it too and asked me about it.

>> include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>>
>> After reverting the change, the gcc warnings are gone again, and I
>> can't reproduce the sparse warnings either.
>
> Humm, maybe different sparse versions? I'm on 0.5.0.

I have v0.5.0-183-gfbbfc73. To clarify, I did not get a sparse warning after my
patch, I did not try reverting your patch first.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
