From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device tree bindings for vibrator
Date: Mon, 20 May 2019 07:21:49 -0700
Message-ID: <20190520142149.D56DA214AE@mail.kernel.org>
References: <20190516085018.2207-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516085018.2207-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, agross@kernel.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-05-16 01:50:18)
> @@ -306,6 +307,36 @@
>                                 input-enable;
>                         };
>                 };
> +
> +               vibrator_pin: vibrator {
> +                       pwm {
> +                               pins =3D "gpio27";
> +                               function =3D "gp1_clk";
> +
> +                               drive-strength =3D <6>;
> +                               bias-disable;
> +                       };
> +
> +                       enable {
> +                               pins =3D "gpio60";
> +                               function =3D "gpio";
> +                       };
> +               };
> +       };
> +
> +       vibrator@fd8c3450 {
> +               compatible =3D "qcom,msm8974-vibrator";
> +               reg =3D <0xfd8c3450 0x400>;

This is inside the multimedia clk controller. The resource reservation
mechanism should be complaining loudly here. Is the driver writing
directly into clk controller registers to adjust a duty cycle of the
camera's general purpose clk?

Can you add support for duty cycle to the qcom clk driver's RCGs and
then write a generic clk duty cycle vibrator driver that adjusts the
duty cycle of the clk? That would be better than reaching into the clk
controller registers to do this.
