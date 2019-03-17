From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Timer & SPI support for Allwinner suniv F1C100s
Date: Sun, 17 Mar 2019 21:52:09 +0100
Message-ID: <177e2598-3491-03af-8638-c60e77cc4a34@linaro.org>
References: <cover.1549875778.git.mesihkilinc@gmail.com>
 <2485e6c52810df376a0df6eb7f749f35b7b19044.camel@aosc.xyz>
Reply-To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYTLXUW4BRBAXHXLSAKGQEKSZWZYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2485e6c52810df376a0df6eb7f749f35b7b19044.camel-ymACFijhrKM@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/03/2019 18:39, Icenowy Zheng wrote:
> =E5=9C=A8 2019-02-11=E4=B8=80=E7=9A=84 12:21 +0300=EF=BC=8CMesih Kilinc=
=E5=86=99=E9=81=93=EF=BC=9A
>> This is followup series for F1C100s initial support patchset.=20
>> All patches merged except patch 1 ~ 2 which is related to timer.
>> I am resending those since they are already have Acked tags.
>=20
> Ping.
>=20
> Could you please merge these timer-related patches?

Hi,

I acked the timer-related patches. If you resend the patches with my
acked-by I will consider them to go through the allwinner tree.

Do you want me to take 1 and 2 through my tree?



>> Our dt-bindings for F1C100s are merged, we can now use them at our=20
>> device tree source - patch 3.
>>
>> Also this series add spi support and enables spi flash at Lichee-pi
>> Nano
>> in patch 4 ~ 7. This patches are based on Icenowy's work.
>>
>> Thanks!
>>
>> Mesih Kilinc (7):
>>   dt-bindings: timer: Add Allwinner suniv timer
>>   clocksource: sun4i: add a compatible for suniv
>>   ARM: dts: suniv: Add dt-binding headers for F1C100s
>>   dt-bindings: spi: Add Support for Allwinner F1C100s
>>   ARM: dts: suniv: Add SPI device-tree nodes
>>   ARM: dts: suniv: Add pinmux for SPI0 and SPI1 of F1C100s
>>   ARM: dts: f1c100s: Activate SPI flash on Lichee Pi Nano
>>
>>  .../devicetree/bindings/spi/spi-sun6i.txt          |  5 +-
>>  .../bindings/timer/allwinner,sun4i-timer.txt       |  4 +-
>>  arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  | 13 ++++++
>>  arch/arm/boot/dts/suniv-f1c100s.dtsi               | 53
>> +++++++++++++++++++---
>>  drivers/clocksource/timer-sun4i.c                  |  5 +-
>>  5 files changed, 70 insertions(+), 10 deletions(-)
>>
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
