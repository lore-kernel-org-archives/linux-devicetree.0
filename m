From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 7/7] devicetree: bindings: Document PM8921/8058 PMICs
Date: Tue, 11 Feb 2014 09:29:37 +0000
Message-ID: <20140211092937.GG32042@lee--X1>
References: <1389206270-3728-1-git-send-email-sboyd@codeaurora.org>
 <1389206270-3728-8-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389206270-3728-8-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> PM8921 and PM8058 are PMICs found paired with MSM8960 and MSM8660
> devices respectively. They contain subdevices such as keypads,
> RTCs, regulators, clocks, etc.
>=20
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8xxx.txt        | 63 ++++++++++++=
++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8xxx=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt b/=
Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
> new file mode 100644
> index 000000000000..e3fe625ffd58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
> @@ -0,0 +1,63 @@

<snip>

> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>

Either provide an example or a comment to see the description of
#interrupt-cells=20

> +	Definition: specifies the interrupt that indicates a subdevice
> +		    has generated an interrupt (summary interrupt). The
> +		    format of the specifier is defined by the binding document
> +		    describing the node's interrupt parent.
> +
> +- #interrupt-cells:
> +	Usage: required
> +	Value type : <u32>
> +	Definition: must be 2. Specifies the number of cells needed to enco=
de
> +		    an interrupt source. The 1st cell contains the interrupt
> +		    number. The 2nd cell is the trigger type and level flags
> +		    encoded as follows:
> +
> +			1 =3D low-to-high edge triggered
> +			2 =3D high-to-low edge triggered
> +			4 =3D active high level-sensitive
> +			8 =3D active low level-sensitive

Actually I'd prefer if you used the definitions in:
  dt-bindings/interrupt-controller/irq.h

> +- interrupt-controller:
> +	Usage: required
> +	Value type: <empty>
> +	Definition: identifies this node as an interrupt controller
> +
> +EXAMPLE
> +
> +	pmicintc: pmic@0 {
> +		compatible =3D "qcom,pm8921";
> +		interrupts =3D <104 8>;

As above.

> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pwrkey {
> +			compatible =3D "qcom,pm8921-pwrkey";
> +			interrupt-parent =3D <&pmicintc>;
> +			interrupts =3D <50 1>, <51 1>;

As above.

> +		};
> +	};
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum,
> hosted by The Linux Foundation

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
