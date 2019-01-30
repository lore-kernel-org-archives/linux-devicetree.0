From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: qcs404: Add PCIe related nodes
Date: Wed, 30 Jan 2019 11:24:12 -0800
Message-ID: <154887625299.169292.6293540451460425008@swboyd.mtv.corp.google.com>
References: <20190125234509.26419-1-bjorn.andersson@linaro.org> <20190125234509.26419-8-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125234509.26419-8-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, David Brown <david.brown@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-25 15:45:09)
> @@ -771,6 +788,56 @@
>                                 status =3D "disabled";
>                         };
>                 };
> +
> +               pcie: pci@10000000 {
> +                       compatible =3D "qcom,pcie-qcs404", "snps,dw-pcie";
> +                       reg =3D  <0x10000000 0xf1d

Nitpick: Can you format these like <0x10000000 0xf1d>, <0x10000f20 0xa8>, e=
tc?

> +                               0x10000f20 0xa8
> +                               0x07780000 0x2000
> +                               0x10001000 0x2000>;
> +                       reg-names =3D "dbi", "elbi", "parf", "config";
> +                       device_type =3D "pci";
> +                       linux,pci-domain =3D <0>;
> +                       bus-range =3D <0x00 0xff>;
> +                       num-lanes =3D <1>;
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +
> +                       ranges =3D <0x81000000 0 0          0x10003000 0 =
0x00010000   /* I/O */

Same for this one? It's nice to know what the size of the cells are.

> +                                 0x82000000 0 0x10013000 0x10013000 0 0x=
007ed000>; /* memory */
> +
