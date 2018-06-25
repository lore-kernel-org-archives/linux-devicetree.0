From: "Katsuhiro Suzuki" <suzuki.katsuhiro@socionext.com>
Subject: Re: [PATCH 1/2] arm64: dts: uniphier: add headphone detect gpio for LD20 global board
Date: Mon, 25 Jun 2018 11:59:11 +0900
Message-ID: <001a01d40c30$7e3d3110$7ab79330$@socionext.com>
References: <20180619041153.6668-1-suzuki.katsuhiro@socionext.com> <CAK7LNATB-oa+K47z+egfV2iSKoD3x2tyMNXQp1ukS2f1Yek54g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATB-oa+K47z+egfV2iSKoD3x2tyMNXQp1ukS2f1Yek54g@mail.gmail.com>
Content-Language: ja
Sender: linux-kernel-owner@vger.kernel.org
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>, =?UTF-8?B?U3V6dWtpLCBLYXRzdWhpcm8v6Yi05pyoIOWLneWNmg==?= <suzuki.katsuhiro@socionext.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Yamada-san,

> -----Original Message-----
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> Sent: Saturday, June 23, 2018 12:47 PM
> To: Suzuki, Katsuhiro/鈴木 勝博 <suzuki.katsuhiro@socionext.com>
> Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>; DTML
> <devicetree@vger.kernel.org>; Masami Hiramatsu <masami.hiramatsu@linaro.org>;
> Jassi Brar <jaswinder.singh@linaro.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH 1/2] arm64: dts: uniphier: add headphone detect gpio for LD20
> global board
> 
> 2018-06-19 13:11 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> > This patch adds GPIO for headphone detection on LD20 global board.
> >
> > Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> > ---
> >  arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> > index 6a074a20c924..38b75998e2dd 100644
> > --- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> > +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> > @@ -60,6 +60,7 @@
> >                         &i2s_port4
> >                         &spdif_port0
> >                         &comp_spdif_port0>;
> > +               hp-det-gpio = <&gpio UNIPHIER_GPIO_PORT(15, 0) GPIO_ACTIVE_LOW>;
> 
> 
> When you use irq-capable gpio pin (XIRQ0),
> please write like follows for consistency.
> 
> 
>              hp-det-gpio = <&gpio UNIPHIER_GPIO_IRQ(0) GPIO_ACTIVE_LOW>;
> 
> 
> See uniphier-ld20-ref.dts for example.

Thank you for reviewing!

I'll fix it and post v2.

Regards,
--
Katsuhiro Suzuki


> 
> 
> 
> >         };
> >
> >         spdif-out {
> > --
> > 2.17.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada
