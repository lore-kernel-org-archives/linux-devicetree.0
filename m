From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: dts: r8a7795: Add USB3.0 host
Date: Mon, 25 Jan 2016 09:25:01 +0100
Message-ID: <CAMuHMdUor3YxMAjL=YWgmG+7p-6+=h=C5vZAr4NkgroermgshA@mail.gmail.com>
References: <1453457003-7720-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20160125000845.GC774@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160125000845.GC774-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Jan 25, 2016 at 1:08 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Fri, Jan 22, 2016 at 07:03:21PM +0900, Yoshihiro Shimoda wrote:
>> This patch set is based on the latest renesas.git / renesas-devel-20160121-v4.4
>> tag. (commit id = 3740ade0617955c76e1767b6d49347d5446eed74)
>>
>> This patch needs r8a7795-cpg-mssr.c update for usb3.0 clocks.
>
> Thanks. Please let me know if I should wait for that change before
> queuing up these patches.

I think you can queue it up fine. It should start working in next
renesas-drivers
release.

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
