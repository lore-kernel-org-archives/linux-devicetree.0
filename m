From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] of: dts: enable memory@0 quirk for PPC32 only
Date: Thu, 17 Apr 2014 19:43:13 -0500
Message-ID: <CAL_JsqL8B2ZY7ACXKX3J8VN5ukjKWuycgfDZpp4kYzBxg6BLmQ@mail.gmail.com>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397756521-29387-1-git-send-email-leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 17, 2014 at 12:41 PM, Leif Lindholm
<leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> drivers/of/fdt.c contains a workaround for a missing memory type
> entry on longtrail firmware. Make that quirk PPC32 only, and while
> at it - fix up the .dts files in the tree currently working only
> because of that quirk.

But why do you need this?

>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>
> Leif Lindholm (3):
>   arm: dts: add device_type="memory" for ste-ccu8540
>   mips: dts: add device_type="memory" where missing
>   of: Handle memory@0 node on PPC32 only
>
>  arch/arm/boot/dts/ste-ccu8540.dts     |    1 +
>  arch/mips/lantiq/dts/easy50712.dts    |    1 +
>  arch/mips/ralink/dts/mt7620a_eval.dts |    1 +
>  arch/mips/ralink/dts/rt2880_eval.dts  |    1 +
>  arch/mips/ralink/dts/rt3052_eval.dts  |    1 +
>  arch/mips/ralink/dts/rt3883_eval.dts  |    1 +

I'm not worried about these MIPS dts files because they are all
built-in, but you are breaking compatibility with old dtbs for this
ARM board.

Rob

>  drivers/of/fdt.c                      |    7 ++++++-
>  7 files changed, 12 insertions(+), 1 deletion(-)
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
