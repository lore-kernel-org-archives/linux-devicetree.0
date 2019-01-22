From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sdm845: Update PIL region memory map
Date: Tue, 22 Jan 2019 10:58:51 -0800
Message-ID: <154818353130.20280.17905705223316470797@swboyd.mtv.corp.google.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-21 21:51:03)
> @@ -103,10 +138,30 @@
>                         no-map;
>                 };
> =20
> +               venus_mem: memory@95800000 {
> +                       reg =3D <0 0x95800000 0 0x500000>;
> +                       no-map;
> +               };
> +
> +               cdsp_mem: memory@95d00000 {
> +                       reg =3D <0 0x95d00000 0 0x800000>;
> +                       no-map;
> +               };
> +
>                 mba_region: memory@96500000 {
>                         reg =3D <0 0x96500000 0 0x200000>;
>                         no-map;
>                 };
> +
> +               slpi_mem: memory@96700000 {
> +                       reg =3D <0 0x96700000 0 0x1400000>;
> +                       no-map;
> +               };
> +
> +               spss_mem: memory@97b00000 {
> +                       reg =3D <0 0x97b00000 0 0x100000>;
> +                       no-map;
> +               };
>         };
> =20

What's the plan if certain configurations don't use all these carveouts?
Can we mark the reservation nodes as status =3D "disabled", or the reverse
and mark them as status =3D "ok" in all boards, and then reclaim the
memory for peripherals we don't care to use?
