From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] Rename RK1108 to RV1108
Date: Thu, 23 Feb 2017 11:15:56 +0100
Message-ID: <CACRpkdbNbGvwUq3uLgekimOwzBZCXf37JW9LCCqLm1so=CMNrw@mail.gmail.com>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
 <2809087.MHZWQWdaOC@phil> <0bbc4151-d954-1a27-48c3-1e8c9cb9e16f@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <0bbc4151-d954-1a27-48c3-1e8c9cb9e16f@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Shawn Lin <shawn.lin@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 14, 2017 at 1:44 AM, Andy Yan <andy.yan@rock-chips.com> wrote:
> Hi Heiko & Rob:
> On 2017=E5=B9=B402=E6=9C=8813=E6=97=A5 20:51, Heiko Stuebner wrote:
>>
>> Hi Andy,
>>
>> Am Montag, 13. Februar 2017, 18:59:26 CET schrieb Andy Yan:
>>>
>>> Rockchip finally named this soc as RV1108, so change
>>> RK1108/rk1108 to RV1108/rv1108 for compatible.
>>
>> renaming existing bindings (that have been in multiple kernel versions
>> already) always is a hot topic. So I'll be hoping for Rob to give a
>> go-ahead
>> for it :-) .
>>
>> Just to confirm, the rk1108/rv1108 is completely new to the market, so
>> we're
>> not breaking any existing devices, right?
>
>
>     Yes, the 1108 Soc is completely new to market, this change will not
> breaking any existing devices.

Nobody gets hurt. Just rename everything to avoid confusion.
Just my =E2=82=AC0.01.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if I can merge a subset of the patches to the pinctrl tree.

Yours,
Linus Walleij
