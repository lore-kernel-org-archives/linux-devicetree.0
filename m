From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/5] mfd: qcom-spmi-pmic: use devm_mfd_add_devices instead of devm_of_platform_populate
Date: Mon, 07 Jan 2019 13:41:30 -0800
Message-ID: <154689729020.15366.16314952173889307636@swboyd.mtv.corp.google.com>
References: <20190107021145.6370-1-masneyb@onstation.org> <20190107021145.6370-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-06 18:11:42)
> +       },
> +       {
> +               .name =3D "pm8941-regulators",
> +               .of_compatible =3D "qcom,pm8941-regulators",
> +       },
> +};
> +
>  static int pmic_spmi_probe(struct spmi_device *sdev)
>  {
>         struct regmap *regmap;
> @@ -136,7 +191,9 @@ static int pmic_spmi_probe(struct spmi_device *sdev)
>         if (sdev->usid % 2 =3D=3D 0)
>                 pmic_spmi_show_revid(regmap, &sdev->dev);
> =20
> -       return devm_of_platform_populate(&sdev->dev);
> +       return devm_mfd_add_devices(&sdev->dev, PLATFORM_DEVID_AUTO,
> +                                   pmic_spmi_cells,
> +                                   ARRAY_SIZE(pmic_spmi_cells), NULL, 0,=
 NULL);

Now this seems worse. We have gotten by without having to explicitly
list all the devices that are inside the PMIC as mfd cells. But now, to
avoid creating the irqs before the hierarchy is installed, we have to
undo all of that and rely on the difference in behavior of
of_platform_populate() and mfd_add_devices(). That's pretty obscure to
figure out.

I'd prefer we drop this patch and keep disassociating virqs and
reassociating them in the gpio driver. Then we can remove the interrupts
properties in all the DTS files and finally remove the disassociate and
reassociating code in the gpio driver when all the DT files are cleaned
up. It makes things less confusing that way and doesn't require updates
to this driver.
