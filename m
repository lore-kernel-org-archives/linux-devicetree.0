From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] devicetree: Enable generation of __symbols__ in all dtb
 files
Date: Tue, 15 Aug 2017 17:14:46 -0700
Message-ID: <59938E76.3010807@gmail.com>
References: <1502831736-28282-1-git-send-email-trini@konsulko.com>
 <CABGGiswpz6k4rnXk-3SLpwD5V8+zah-yaaB+yrrLofKY1eBx2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABGGiswpz6k4rnXk-3SLpwD5V8+zah-yaaB+yrrLofKY1eBx2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/15/17 15:36, Rob Herring wrote:
> On Tue, Aug 15, 2017 at 4:15 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> With support for stacked overlays being part of libfdt it is now

< snip >

>> My proposal is that we do not want __symbols__ existence to be dependent
>> on some part of the kernel configuration for a number of reasons.
>> First, this is out of step with the rest of how dtbs are created today
>> and more importantly, thought about.  Today, all dtb content is
>> independent of CONFIG options.  If you build a dtb from a given kernel
>> tree, everyone will agree on the result.  This is part of the "contract"
>> on passing old kernels and new dtb files even.
> 
> Agree completely. I don't even like that building dtbs depends on the ARCH.

< snip >

I also agree that use of CONFIG options is a solution that I do not like.
It has always seemed that there is a bit of an impedence mismatch in that
we build a dtb in an environment that is configured for a specific board
and architecture.

Does anyone have any thoughts on another way to control whether or not a
given dtb or a given build of a dtb would contain the symbols needed for
overlays or not include the symbols?

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
