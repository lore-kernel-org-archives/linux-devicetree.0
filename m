From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/13] Documentation: add BCM6348 pincontroller binding documentation
Date: Mon, 22 Aug 2016 15:17:19 +0200
Message-ID: <CACRpkdYaGqru-b-1wV=E2DtJMK4KZm_y1+gurnYG49mS4t1=fw@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com> <1471604025-21575-5-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1471604025-21575-5-git-send-email-jonas.gorski@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:

> Add binding documentation for the pincontrol core found in BCM6348 SoCs.
>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

(...)
> +pinctrl: pin-controller@fffe0080 {
> +       compatible = "brcm,bcm6348-pinctrl";
> +       reg = <0xfffe0080 0x8>,
> +             <0xfffe0088 0x8>,
> +             <0xfffe0098 0x4>;
> +       reg-names = "dirout", "dat", "mode";
> +
> +       gpio-controller;
> +       #gpio-cells = <2>;
> +};

So I would prefer if you create a syscon with two
children: the pin controller and the GPIO(s) as
separate devices using "syscon", "mfd-simple" as
compatible on the top node.

Yours,
Linus Walleij
