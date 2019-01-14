From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Mon, 14 Jan 2019 14:30:52 -0800
Message-ID: <154750505285.169631.15400388488161882052@swboyd.mtv.corp.google.com>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org> <20190106080915.4493-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-06 00:09:09)
> Add binding for the QMP based side-channel communication mechanism to
> the AOSS, which is used to control resources not exposed through the
> RPMh interface.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

one nit below.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt=
 b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> new file mode 100644
> index 000000000000..9b0d9785efe0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -0,0 +1,57 @@
> +=3D EXAMPLE
> +
> +The following example represents the AOSS side-channel message RAM and t=
he
> +mechanism exposing the power-domains, as found in SDM845.
> +
> +  aoss_qmp: qmp@c300000 {
> +          compatible =3D "qcom,sdm845-aoss-qmp";
> +          reg =3D <0x0c300000 0x100000>;
> +          interrupts =3D <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> +          mboxes =3D <&apss_shared 0>;
> +
> +         #power-domain-cells =3D <1>;

This is weirdly tabbed out.
