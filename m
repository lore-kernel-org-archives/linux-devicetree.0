From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom: msm8974: add interrupt controller properties
Date: Mon, 07 Jan 2019 15:51:47 -0800
Message-ID: <154690510733.15366.11047294617451125580@swboyd.mtv.corp.google.com>
References: <20190107021145.6370-1-masneyb@onstation.org> <20190107021145.6370-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-6-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-06 18:11:45)
> -                                    <0 0xde 0 IRQ_TYPE_NONE>,
> -                                    <0 0xdf 0 IRQ_TYPE_NONE>,
> -                                    <0 0xe0 0 IRQ_TYPE_NONE>,
> -                                    <0 0xe1 0 IRQ_TYPE_NONE>,
> -                                    <0 0xe2 0 IRQ_TYPE_NONE>,
> -                                    <0 0xe3 0 IRQ_TYPE_NONE>;
> +                       interrupt-parent =3D <&spmi_bus>;

If I'm reading of_irq_find_parent() correctly, we don't need to specify
this? It becomes implicit because spmi_bus has the interrupt-cells
property and this is a child node of that.

> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> =20
>                         boost_bypass_n_pin: boost-bypass {
>                                 pins =3D "gpio21";
