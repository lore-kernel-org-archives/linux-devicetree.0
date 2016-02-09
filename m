From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [rtc-linux] [PATCH V7 5/8] gpio: add DT binding doc for gpio of
 PMIC max77620/max20024
Date: Tue, 9 Feb 2016 14:29:03 +0000
Message-ID: <20160209142903.GE24522@x1>
References: <1454171931-27752-1-git-send-email-ldewangan@nvidia.com>
 <1454171931-27752-6-git-send-email-ldewangan@nvidia.com>
 <CACRpkdYNBHvefR_qdjZ7hWr=cFzhv1gEgb5jBCrqHdWzNWgV6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYNBHvefR_qdjZ7hWr=cFzhv1gEgb5jBCrqHdWzNWgV6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, vreddytalla@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, 05 Feb 2016, Linus Walleij wrote:

> On Sat, Jan 30, 2016 at 5:38 PM, Laxman Dewangan <ldewangan@nvidia.co=
m> wrote:
>=20
> > Maxim Semiconductor's PMIC MAX77620/MAX20024 has 8 GPIO pins
> > which act as GPIO as well as special function mode.
> >
> > Add DT binding document to support these pins in GPIO
> > mode via GPIO framework.
> >
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Lee can merge this too.

Ths set needs a re-work anyway.

Laxman, just apply your collected Acks and re-submit when you're
ready.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
