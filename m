From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
Date: Thu, 29 Aug 2019 22:32:50 -0700
Message-ID: <20190830053250.D772A21897@mail.kernel.org>
References: <20190824152411.21757-1-sibis@codeaurora.org> <20190824152411.21757-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190824152411.21757-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Sibi Sankar (2019-08-24 08:24:10)
> Add SC7180 AOSS reset to the list of possible bindings.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--

Can you convert this binding to YAML/JSON schema? Would help to describe
the 'one of' requirement below in a more structured way.

>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt =
b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> index 510c748656ec5..3eb6a22ced4bc 100644
> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> @@ -8,8 +8,8 @@ Required properties:
>  - compatible:
>         Usage: required
>         Value type: <string>
> -       Definition: must be:
> -                   "qcom,sdm845-aoss-cc"
> +       Definition: must be one of:
