From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 06/14] dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power domain
Date: Mon, 19 Aug 2019 10:59:36 -0700
Message-ID: <5d5ae389.1c69fb81.cb730.3225@mx.google.com>
References: <20190725104144.22924-7-niklas.cassel@linaro.org> <20190819100957.17095-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819100957.17095-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Nishanth Menon <nm@ti.com>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Niklas Cassel (2019-08-19 03:09:57)
> +
> +soc {
> +....
> +       cprpd: cpr@b018000 {

Maybe node name should be 'avs' for the industry standard adaptive
voltage scaling acronym?


> +               compatible =3D "qcom,qcs404-cpr", "qcom,cpr";
> +               reg =3D <0x0b018000 0x1000>;
> +               ....
> +               vdd-apc-supply =3D <&pms405_s3>;
> +               #power-domain-cells =3D <0>;
