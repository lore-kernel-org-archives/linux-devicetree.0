From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v1 5/5] ARM: dts: qcom: Add APQ8084 serial port DT node
Date: Thu, 22 May 2014 11:32:28 -0500
Message-ID: <693A0E52-34CF-4A63-A8D0-A83780F969F0@codeaurora.org>
References: <1400775885-10296-1-git-send-email-gdjakov@mm-sol.com> <1400775885-10296-6-git-send-email-gdjakov@mm-sol.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400775885-10296-6-git-send-email-gdjakov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: Georgi Djakov <gdjakov@mm-sol.com>
Cc: mturquette@linaro.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On May 22, 2014, at 11:24 AM, Georgi Djakov <gdjakov@mm-sol.com> wrote:

> Add the necessary DT node to probe the serial driver on
> APQ8084 platforms.
>=20
> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
> ---
> arch/arm/boot/dts/qcom-apq8084.dtsi |    7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/=
qcom-apq8084.dtsi
> index 2dcd11e..c346549 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -185,5 +185,12 @@
> 			reg =3D <0xfc400000 0x4000>;
> 		};
>=20
> +		serial@f995e000 {

Mark it disabled in the soc.dtsi and =93ok=94 in the board.

> +			compatible =3D "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg =3D <0xf995e000 0x1000>;
> +			interrupts =3D <0 114 0x0>;
> +			clocks =3D <&gcc GCC_BLSP2_UART2_APPS_CLK>, <&gcc GCC_BLSP2_AHB_C=
LK>;
> +			clock-names =3D "core", "iface";
> +		};
> 	};
> };
> --=20
> 1.7.9.5
>=20

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

