From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm845: remove macro from unit name
Date: Wed, 24 Jul 2019 07:11:41 -0700
Message-ID: <5d38671e.1c69fb81.1f6f4.a5a1@mx.google.com>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-5-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724044906.12007-5-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-07-23 21:49:05)
> Unit name is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>=20
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_fo=
rmat): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should no=
t have leading "0x"
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_fo=
rmat): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should no=
t have leading 0s
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
