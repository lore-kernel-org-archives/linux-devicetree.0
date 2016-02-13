From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 0/2] clk: sunxi: Fix APBS clock for
 Allwinner A80
Date: Sat, 13 Feb 2016 10:28:51 +0800
Message-ID: <CAGb2v65FT-Kn4C3hno_FDcvbTkpow3FAnLLEUPz3y===d5YebQ@mail.gmail.com>
References: <1455269475-8180-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB65J7K2QKGQEFVEELVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455269475-8180-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Feb 12, 2016 at 5:31 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi everyone,
>
> This is v2 of the A80 APBS clock fixes series.
>
> When I did the A80 PRCM support, I failed to notice the A80's APBS clock
> was not the same as the A23's APB0 clock. The former is a zero-based
> divider, while the latter is a power-of-two divider. But the lowest 2
> dividers are the same.

It turns out that clk-sun8i-a23-apb0 was wrong. It's a zero-based divider,
not a power-of-two divider as the driver says. Thanks to Vishnu for pointing
it out. So NACK on this series.

I'll send a patch fixing this, but what should we do for old kernels?
I don't think backporting the CLK_OF_DECLARE changes is acceptable.
Maybe a stable patch based on the fix?

Sorry for the noise.

ChenYu

> The hardware defaults to the lowest setting, or a /1 divider. Since the
> child gates do not propagate clk_set_rate up, and no consumers here do
> clk_set_rate, this actually works.
>
> I realized my mistake while reviewing the A83T's PRCM patches. The A83T
> shares the same PRCM clocks as the A80.
>
> Maxime, since this was introduced in 4.5-rc1, please apply this series
> for 4.5 so we fix it before the release.
>
>
> Changes since v1:
>
>   - Replace the CLK_OF_DECLARE version of sun8i-a23-apb0-clk with the
>     A80 APBS version, instead of writing a new driver.
>
> Regards
> ChenYu
>
>
> Chen-Yu Tsai (2):
>   clk: sunxi: Add support for A80 APBS clock
>   ARM: dts: sun9i: Fix apbs clock compatible
>
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  arch/arm/boot/dts/sun9i-a80.dtsi                  |  2 +-
>  drivers/clk/sunxi/clk-sun8i-apb0.c                | 23 ++++++++---------------
>  3 files changed, 10 insertions(+), 16 deletions(-)
>
> --
> 2.7.0
>
