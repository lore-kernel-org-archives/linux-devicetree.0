From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 08/14] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date: Fri, 22 Feb 2019 10:12:33 -0800
Message-ID: <155085915374.77512.3766517034394591147@swboyd.mtv.corp.google.com>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1548700381-22376-9-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548700381-22376-9-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, david.brown@linaro.org, enric.balletbo@collabora.com, heiko@sntech.de, horms+renesas@verge.net.au, jagan@amarulasolutions.com, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, olof@lixom.net, robh+dt@kernel.org, sibis@codeaurora.org, will.deacon@arm.com
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-01-28 10:32:55)
> When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
> to keep the software model of the clock in line with reality, the
> framework transverses the clock tree and disables those clocks that
> were enabled by the firmware but have not been enabled by any device
> driver.
>=20
> If CPUFREQ is enabled, early during the system boot, it might attempt
> to change the CPU frequency ("set_rate"). If the HFPLL is selected as
> a provider, it will then change the rate for this clock.
>=20
> As boot continues, clk_disable_unused_subtree will run. Since it wont
> find a valid counter (enable_count) for a clock that is actually
> enabled it will attempt to disable it which will cause the CPU to
> stop. Notice that in this driver, calls to check whether the clock is
> enabled are routed via the is_enabled callback which queries the
> hardware.
>=20
> The following commit, rather than marking the clock critical and
> forcing the clock to be always enabled, addresses the above scenario
> making sure the clock is not disabled but it continues to rely on the
> firmware to enable the clock.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/clk/qcom/hfpll.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index 0ffed0d..9d92f5d 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -58,6 +58,7 @@ static int qcom_hfpll_probe(struct platform_device *pde=
v)
>                 .parent_names =3D (const char *[]){ "xo" },
>                 .num_parents =3D 1,
>                 .ops =3D &clk_ops_hfpll,
> +               .flags =3D CLK_IGNORE_UNUSED,

Please put some sort of similar comment in the code so we can find it
without git history digging.
