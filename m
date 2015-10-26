From: Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i-a31: Add pins definitions for more UARTs
Date: Mon, 26 Oct 2015 02:05:40 -0300
Message-ID: <CAHbBuxraeMd1jB1EkA8g9Z2nPWFxgubUx00VorSAz1S11PqRMA@mail.gmail.com>
References: <1445828876-35549-1-git-send-email-luaraneda@gmail.com>
	<CAGb2v669OCEJ_f5Oy8vCmd6sYsrgbLLTN4fq==thQ9JJ3F3CVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v669OCEJ_f5Oy8vCmd6sYsrgbLLTN4fq==thQ9JJ3F3CVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

You're right on that these pins aren't currently in use by any .dts
file, but the manufacturer, Sinovoip,
should be submitting a .dts file for the board soon, and if they
don't, I'm sure the Linux-Sunxi community will do.
You can see a work-in-progress device tree at:
https://github.com/BPI-SINOVOIP/BPI-Mainline-kernel/blob/master/arch/arm/boot/dts/sun6i-a31s-bananapi-m2.dts

Apologies in advance if some of what I've written is against any rule,
I read them, but something might be wrong because this is my first
attempt to submit a patch.

Cheers,
Luis Araneda.

On Mon, Oct 26, 2015 at 12:47 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi,
>
> On Mon, Oct 26, 2015 at 11:07 AM, Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Two additional UARTs tested on the GPIO pins from the
>> Banana Pi M2 board
>>
>> Signed-off-by: Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>
> IIRC the policy we have is only add stuff that is actually used. I don't
> see a follow up patch using these in any boards.
>
> Also, please Cc LAKML for DT patches.
>
>
> Regards
> ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
