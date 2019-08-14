From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 22/22] arm64: dts: qcom: sm8150: Add APSS shared mailbox
Date: Wed, 14 Aug 2019 10:17:42 -0700
Message-ID: <20190814171743.C38C4206C1@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-23-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-23-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:12)
> @@ -338,6 +339,16 @@
>                         #interrupt-cells =3D <2>;
>                 };
> =20
> +               aoss_qmp: qmp@c300000 {

Node name of 'clock-controller', or 'power-controller'?

> +                       compatible =3D "qcom,sm8150-aoss-qmp";
> +                       reg =3D <0x0c300000 0x100000>;
> +                       interrupts =3D <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> +                       mboxes =3D <&apss_shared 0>;
