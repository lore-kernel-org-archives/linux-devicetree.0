From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Mon, 10 Jun 2019 09:48:04 -0700
Message-ID: <20190610164805.18D15206C3@mail.kernel.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <1559754961-26783-6-git-send-email-sricharan@codeaurora.org> <20190608034835.GH24059@builder> <048a25c0-3a2c-3906-84d4-5eb67f3ce2ef@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <048a25c0-3a2c-3906-84d4-5eb67f3ce2ef@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Sricharan R (2019-06-10 08:45:22)
> On 6/8/2019 9:18 AM, Bjorn Andersson wrote:
> > On Wed 05 Jun 10:16 PDT 2019, Sricharan R wrote:
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/d=
ts/qcom/ipq6018.dtsi
> >> new file mode 100644
> >> index 0000000..79cccdd
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> >> +                    compatible =3D "fixed-clock";
> >> +                    clock-frequency =3D <32000>;
> >> +                    #clock-cells =3D <0>;
> >> +            };
> >> +
> >> +            xo: xo {
> >> +                    compatible =3D "fixed-clock";
> >> +                    clock-frequency =3D <24000000>;
> >> +                    #clock-cells =3D <0>;
> >> +            };
> >> +
> >> +            bias_pll_cc_clk {
> >=20
> > Please give this a label and reference it from the node that uses it
> > (regardless of the implementation matching by clock name).
> >=20
>  ok, in that case, so might have to remove these for now, till we add
>  the corresponding users.

Yes, please remove them. They don't look like board clks, instead
they're SoC level details that need to be created by some clk driver
like GCC.

>=20
> >> +                    compatible =3D "fixed-clock";
> >> +                    clock-frequency =3D <300000000>;
> >> +                    #clock-cells =3D <0>;
> >> +            };
> >> +
> >> +            bias_pll_nss_noc_clk {
> >> +                    compatible =3D "fixed-clock";
> >> +                    clock-frequency =3D <416500000>;
> >> +                    #clock-cells =3D <0>;
> >> +            };
> >> +
