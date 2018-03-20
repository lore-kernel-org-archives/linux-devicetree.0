From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 13/13] ARM: dts: ipq8074: Enable few peripherals for hk01 board
Date: Tue, 20 Mar 2018 00:35:45 -0700
Message-ID: <152153134562.254778.8560281830236357589@swboyd.mtv.corp.google.com>
References: <1521518336-5467-1-git-send-email-sricharan@codeaurora.org>
 <1521518336-5467-14-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521518336-5467-14-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: absahu@codeaurora.org, andy.gross@linaro.org, bjorn.andersson@linaro.org, catalin.marinas@arm.com, david.brown@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux@armlinux.org.uk, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, robh@kernel.org, sboyd@codeaurora.org, will.deacon@arm.com
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting Sricharan R (2018-03-19 20:58:56)
> +                        };
> +               };
> +
> +               serial@78b1000 {
> +                        pinctrl-0 = <&hsuart_pins>;
> +                        pinctrl-names = "default";
> +                        status = "ok";
> +               };
> +
> +               i2c_0@78b6000 {

Node should just be called i2c?

> +                        pinctrl-0 = <&i2c_0_pins>;
> +                        pinctrl-names = "default";
> +                        status = "ok";
> +               };
> +
