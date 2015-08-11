From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 01/11] dm: serial: Update binding for PL01x serial
 UART
Date: Mon, 10 Aug 2015 22:24:11 -0600
Message-ID: <55C978EB.8090104@wwwdotorg.org>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org> <1438954951-13329-2-git-send-email-sjg@chromium.org> <55C972BA.5050706@wwwdotorg.org> <CAPnjgZ2XdOPGMfAPHGy4c7vuc+exrirXkZ5DF+wHKGmAPg8ZjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ2XdOPGMfAPHGy4c7vuc+exrirXkZ5DF+wHKGmAPg8ZjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Herrmann <morpheus.ibis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/10/2015 10:11 PM, Simon Glass wrote:
> HI Stephen,
> 
> On 10 August 2015 at 21:57, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 08/07/2015 07:42 AM, Simon Glass wrote:
>>> This binding differs from that of Linux. Update it and change existing
>>> users.
>>
>> Is that meant to imply that this patch fixes the copy of the binding doc
>> in U-Boot so it does match the kernel's copy?
>>
>>> Changes in v3:
>>> - Rename binding file to pl01x.txt
>>
>> The file is named pl011.txt in the kernel. Shouldn't U-Boot's copy be
>> named the same?
> 
> In the previous discussion a reviewed asked for this change, since it
> covers both drivers.

I think it's more important to match the DT docs in the Linux kernel
since they are a shared resource, and should eventually be split off
into a separate project at some point, forking from whatever Linux has
at that time.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
