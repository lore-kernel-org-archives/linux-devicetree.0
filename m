From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/4] clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
Date: Tue, 05 Feb 2019 14:16:41 -0800
Message-ID: <154940500172.169292.7462110370898212066@swboyd.mtv.corp.google.com>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org> <1548866171-30341-1-git-send-email-jhugo@codeaurora.org> <154940436246.169292.7591382350282828249@swboyd.mtv.corp.google.com> <54750df0-245c-74ab-2a33-ce1588f3e38e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54750df0-245c-74ab-2a33-ce1588f3e38e@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>, bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-02-05 14:12:00)
> On 2/5/2019 3:06 PM, Stephen Boyd wrote:
> > Quoting Jeffrey Hugo (2019-01-30 08:36:11)
> > [..]
> >> +};
> >> +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
> >> +
> >> +static int mmcc_msm8998_probe(struct platform_device *pdev)
> >> +{
> >> +       struct device *dev =3D &pdev->dev;
> >> +       int i, ret;
> >> +       struct regmap *regmap;
> >> +       struct clk *c;
> >> +
> >> +       c =3D devm_clk_get(dev, "xo");
> >> +       if (!IS_ERR(c))
> >> +               dummy_xo_init.parent_names =3D
> >> +                                       (const char *[]){__clk_get_nam=
e(c)};
> >> +       else
> >> +               return PTR_ERR(c);
> >> +
> >> +       c =3D devm_clk_get(dev, "gpll0");
> >> +       if (!IS_ERR(c))
> >> +               dummy_gpll0_init.parent_names =3D
> >> +                                       (const char *[]){__clk_get_nam=
e(c)};
> >> +       else
> >> +               return PTR_ERR(c);
> >=20
> > Urgh, my parent mapping series can't come be merged fast enough it
> > seems!
>=20
> Sorry, I'm not familiar with the context.  Something I should incorporate?
>=20

https://lkml.kernel.org/r/20190129061021.94775-1-sboyd@kernel.org
