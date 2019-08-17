From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 10/14] dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
Date: Fri, 16 Aug 2019 23:14:13 -0700
Message-ID: <5d579b36.1c69fb81.85eba.ff51@mx.google.com>
References: <20190725104144.22924-1-niklas.cassel@linaro.org> <20190725104144.22924-11-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725104144.22924-11-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Niklas Cassel (2019-07-25 03:41:38)
> +       cpr@b018000 {
> +               compatible =3D "qcom,qcs404-cpr", "qcom,cpr";
> +               reg =3D <0x0b018000 0x1000>;
> +               interrupts =3D <0 15 IRQ_TYPE_EDGE_RISING>;
> +               clocks =3D <&xo_board>;
> +               clock-names =3D "ref";
> +               vdd-apc-supply =3D <&pms405_s3>;
> +               #power-domain-cells =3D <0>;
> +               operating-points-v2 =3D <&cpr_opp_table>;
> +               acc-syscon =3D <&tcsr>;
> +
> +               nvmem-cells =3D <&cpr_efuse_quot_offset1>,
> +                       <&cpr_efuse_quot_offset2>,
> +                       <&cpr_efuse_quot_offset3>,
> +                       <&cpr_efuse_init_voltage1>,
> +                       <&cpr_efuse_init_voltage2>,
> +                       <&cpr_efuse_init_voltage3>,
> +                       <&cpr_efuse_quot1>,
> +                       <&cpr_efuse_quot2>,
> +                       <&cpr_efuse_quot3>,
> +                       <&cpr_efuse_ring1>,
> +                       <&cpr_efuse_ring2>,
> +                       <&cpr_efuse_ring3>,
> +                       <&cpr_efuse_revision>;
> +               nvmem-cell-names =3D "cpr_quotient_offset1",
> +                       "cpr_quotient_offset2",
> +                       "cpr_quotient_offset3",
> +                       "cpr_init_voltage1",
> +                       "cpr_init_voltage2",
> +                       "cpr_init_voltage3",
> +                       "cpr_quotient1",
> +                       "cpr_quotient2",
> +                       "cpr_quotient3",
> +                       "cpr_ring_osc1",
> +                       "cpr_ring_osc2",
> +                       "cpr_ring_osc3",
> +                       "cpr_fuse_revision";
> +
> +               qcom,cpr-timer-delay-us =3D <5000>;
> +               qcom,cpr-timer-cons-up =3D <0>;
> +               qcom,cpr-timer-cons-down =3D <2>;
> +               qcom,cpr-up-threshold =3D <1>;
> +               qcom,cpr-down-threshold =3D <3>;
> +               qcom,cpr-idle-clocks =3D <15>;
> +               qcom,cpr-gcnt-us =3D <1>;
> +               qcom,vdd-apc-step-up-limit =3D <1>;
> +               qcom,vdd-apc-step-down-limit =3D <1>;

Are any of these qcom,* properties going to change for a particular SoC?
They look like SoC config data that should just go into the driver and
change based on the SoC compatible string.
