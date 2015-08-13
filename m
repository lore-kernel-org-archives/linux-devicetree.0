From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 01/11] dm: serial: Update binding for PL01x serial UART
Date: Thu, 13 Aug 2015 09:59:52 -0600
Message-ID: <CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
 <1438954951-13329-2-git-send-email-sjg@chromium.org> <CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Herrmann <morpheus.ibis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 11 August 2015 at 07:00, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 7, 2015 at 3:42 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
>> This binding differs from that of Linux. Update it and change existing
>> users.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> (...)
>>  doc/device-tree-bindings/serial/pl01x.txt | 55 ++++++++++++++++++++++++++++---
>
> So why does U-Boot have its own copy of any bindings at all?
>
> This is forking the ontology of who gets to define bindings I fear.
> It's a bit like have two bibles both claiming to be the word of god.
> (OK maybe a hyperbolic statement, but you see what I mean.)
>
> Can't we just have the bindings in the Linux kernel tree please?

Is there any plan to move them out of Linux and put them in a separate place?

We should make an effort to sync the device tree files with Linux periodically.

I quite like having the bindings in U-Boot since it makes people think
about what they are adding. Are you worried that the bindings in
U-Boot might evolve separately? Certainly there has been some of that.

However I recently sent a series to add a few things for Raspberry Pi
("arm: rpi: Device tree modifications for U-Boot") and I don't yet see
a willingness to add what some see as 'U-Boot things' to the binding.
How do we address that?

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
