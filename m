From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
Date: Fri, 16 Aug 2019 21:10:04 -0700
Message-ID: <20190817041005.C56FD21019@mail.kernel.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <72bce036fa8cba3db6e5ba82249837ee46e9c077.1564091601.git.amit.kucheria@linaro.org> <20190816213648.GA10244@bogus> <CAP245DVUKRxvU3wWygOFtZuwbvCxfW=wUH=xArOKmYiRZf+EXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP245DVUKRxvU3wWygOFtZuwbvCxfW=wUH=xArOKmYiRZf+EXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, Linux PM list <linux-pm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-08-16 15:02:08)
>=20
> Depending on the version of the tsens IP, there can be 1 (upper/lower
> threshold), 2 (upper/lower + critical threshold) or 3 (upper/lower +
> critical + zero degree) interrupts. This patch series only introduces
> support for a single interrupt (upper/lower).
>=20
> I used the names tsens0, tsens1 to encapsulate the controller instance
> since some SoCs have 1 controller, others have two. So we'll end up
> with something like the following in DT:
>=20
> tsens0: thermal-sensor@c263000 {
>                         compatible =3D "qcom,sdm845-tsens", "qcom,tsens-v=
2";
>                         reg =3D <0 0x0c263000 0 0x1ff>, /* TM */
>                               <0 0x0c222000 0 0x1ff>; /* SROT */
>                         #qcom,sensors =3D <13>;
>                         interrupts =3D <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-names =3D "tsens0", "tsens0-critical";
>                         #thermal-sensor-cells =3D <1>;
> };
>=20
> tsens1: thermal-sensor@c265000 {
>                         compatible =3D "qcom,sdm845-tsens", "qcom,tsens-v=
2";
>                         reg =3D <0 0x0c265000 0 0x1ff>, /* TM */
>                               <0 0x0c223000 0 0x1ff>; /* SROT */
>                         #qcom,sensors =3D <8>;
>                         interrupts =3D <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-names =3D "tsens1", "tsens1-critical";
>                         #thermal-sensor-cells =3D <1>;
> }
>=20
> Does that work?
>=20

Can you convert this binding to YAML? Then it looks like we can enforce
the number of interrupts based on the compatible string.
