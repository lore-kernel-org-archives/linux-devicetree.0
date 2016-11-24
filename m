From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [RFC PATCH 3/5] arm64: defconfig: sunxi: include
 options for Allwinner H5 SoC
Date: Thu, 24 Nov 2016 19:01:51 +0800
Message-ID: <CAGb2v67AntaTBCTzJf_-oUcAqaFsQv3t4pp-E6jzpkXLNctKww@mail.gmail.com>
References: <1479950235-26821-1-git-send-email-andre.przywara@arm.com>
 <1479950235-26821-4-git-send-email-andre.przywara@arm.com> <20161124105725.va6gf6b3min74occ@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBOER3PAQKGQELKBFZPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161124105725.va6gf6b3min74occ@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 6:57 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Thu, Nov 24, 2016 at 01:17:13AM +0000, Andre Przywara wrote:
>> The Allwinner H5 SoC is closely related to the H3 SoC, so select the
>> basic pinctrl driver and the DMA driver to let a defconfig kernel boot
>> on those boards.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  arch/arm64/Kconfig.platforms | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index cfbdf02..8300677 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -5,8 +5,12 @@ config ARCH_SUNXI
>>       select GENERIC_IRQ_CHIP
>>       select PINCTRL
>>       select PINCTRL_SUN50I_A64
>> +     select PINCTRL_SUN8I_H3
>> +     select PINCTRL_SUN8I_H3_R
>> +     select DMA_SUN6I
>
> I'm not sure I want to get an ever growing select which will be an
> union of all the drivers that all the arm64 Allwinner SoCs will
> require.
>
> Select leaves no option to disable that option, and we have defconfig
> to deal with that nicely.

I have to agree. We should only select things that aren't selectable
by the user. In our case, that's only the pinctrl drivers.

We should use default y (ARCH_SUNXI && ARM64) for every driver that
has a prompt entry in Kconfig.

ChenYu
