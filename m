From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Add missing of_node_put() in of_find_node_by_path()
Date: Thu, 22 Jan 2015 21:35:56 +0100
Message-ID: <CAMuHMdU+sQCxaZsV0KthWkuPrFseqtQZb1j+Emn1CShXh4VdnQ@mail.gmail.com>
References: <1421250356-16690-1-git-send-email-geert+renesas@glider.be>
	<20150122161446.101EBC40A80@trevor.secretlab.ca>
	<CACxGe6sDFQQfiN0+d5HV7JPE-0bosqdaKqrS-7o-obCy1NP_qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sDFQQfiN0+d5HV7JPE-0bosqdaKqrS-7o-obCy1NP_qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Thu, Jan 22, 2015 at 5:18 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jan 22, 2015 at 4:14 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, 14 Jan 2015 16:45:56 +0100
>> , Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>  wrote:
>>> When traversing all nodes and moving to a new path component, the old
>>> one must be released by calling of_node_put(). Else the refcounts of the
>>> parent node(s) will not be decremented.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>> ---
> [...]
>>> Feel free to (ab)use the code below and derive a unittest from it...
>
> BTW, can you do this please? They are pretty important for core
> changes now, and I'm stuck with doing them if the person supplying a
> patch does not (and I'm already too much of a bottleneck on the DT
> code).

I'll see whether I can get to it...

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
