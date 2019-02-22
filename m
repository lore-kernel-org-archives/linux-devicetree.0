From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 02/14] mbox: qcom: add APCS child device for QCS404
Date: Fri, 22 Feb 2019 10:09:17 -0800
Message-ID: <155085895764.77512.15118138971189768976@swboyd.mtv.corp.google.com>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1548700381-22376-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548700381-22376-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, david.brown@linaro.org, enric.balletbo@collabora.com, heiko@sntech.de, horms+renesas@verge.net.au, jagan@amarulasolutions.com, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, olof@lixom.net, robh+dt@kernel.org, sibis@codeaurora.org, will.deacon@arm.com
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-01-28 10:32:49)
> There is clock controller functionality in the APCS hardware block of
> qcs404 devices similar to msm8916.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qc=
om-apcs-ipc-mailbox.c
> index 3cf2937..0d64aa5 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -97,16 +97,21 @@ static int qcom_apcs_ipc_probe(struct platform_device=
 *pdev)
>                 return ret;
>         }
> =20
> -       if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global"))=
 {
> -               apcs->clk =3D platform_device_register_data(&pdev->dev,
> -                                                         "qcom-apcs-msm8=
916-clk",
> -                                                         -1, NULL, 0);
> -               if (IS_ERR(apcs->clk))
> -                       dev_err(&pdev->dev, "failed to register APCS clk\=
n");
> -       }
> -
>         platform_set_drvdata(pdev, apcs);
> =20
> +       if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") =
||
> +           of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global"))
> +               goto register_clk;

This goto is weird style, but I'm not the maintainer here. Maybe just do
an if condition with the body of the if inside like normally is done and
suffer the indenting pain?
