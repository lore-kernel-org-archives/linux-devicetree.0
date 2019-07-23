From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from unit name
Date: Tue, 23 Jul 2019 07:51:02 -0700
Message-ID: <5d371ed6.1c69fb81.1ea1c.47f1@mx.google.com>
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-6-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722123422.4571-6-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-07-22 05:34:22)
> Unit name is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>=20
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name=
 should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_ad=
dress_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name=
 should not have leading "0x"
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
