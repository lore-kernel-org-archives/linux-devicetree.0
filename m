From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: sunxi-ng: a83t: Fix audio PLL divider offset
Date: Mon, 22 May 2017 15:35:57 +0800
Message-ID: <CAGb2v65SUR2NvGOFFgzUpDh_9Dm6SAhzwC31KBOqFZubOhkK9w@mail.gmail.com>
References: <20170522062552.19026-1-wens@csie.org> <20170522062552.19026-3-wens@csie.org>
 <20170522072047.bffdbwkz2nqvhums@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522072047.bffdbwkz2nqvhums-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 22, 2017 at 3:20 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, May 22, 2017 at 02:25:48PM +0800, Chen-Yu Tsai wrote:
>> The divider of the audio PLL has an offset of 1.
>> Fix this in the driver.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Applied, thanks!

So even with this patch applied, the audio is still slow and off pitch.
It's even worse without this patch...

Maybe it's time we added a special class of clks for the audio PLL
to deal with sigma-delta modulation of the divider?

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
