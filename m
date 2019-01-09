Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] clk: imx: Add clock driver support for imx8mm
In-Reply-To: <1546938317-23203-3-git-send-email-ping.bai@nxp.com>
From: Stephen Boyd <sboyd@kernel.org>
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com> <1546938317-23203-3-git-send-email-ping.bai@nxp.com>
Message-ID: <154706594997.15366.8932514505305165638@swboyd.mtv.corp.google.com>
Date: Wed, 09 Jan 2019 12:32:29 -0800
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Jacky Bai (2019-01-08 01:01:04)
> +
> +static int imx8mm_clocks_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       void __iomem *base;
> +       int ret =3D 0;

Please don't assign ret here. Just let it be assigned later on.

> +
> +       clks[IMX8MM_CLK_DUMMY] =3D imx_clk_fixed("dummy", 0);
> +       clks[IMX8MM_CLK_24M] =3D of_clk_get_by_name(np, "osc_24m");
> +       clks[IMX8MM_CLK_32K] =3D of_clk_get_by_name(np, "osc_32k"); /* Ch=
eck more */
> +       clks[IMX8MM_CLK_EXT1] =3D of_clk_get_by_name(np, "clk_ext1");
> +       clks[IMX8MM_CLK_EXT2] =3D of_clk_get_by_name(np, "clk_ext2");
> +       clks[IMX8MM_CLK_EXT3] =3D of_clk_get_by_name(np, "clk_ext3");
> +       clks[IMX8MM_CLK_EXT4] =3D of_clk_get_by_name(np, "clk_ext4");
> +
> +       np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
> +       base =3D of_iomap(np, 0);
> +       if (WARN_ON(!base))
> +               return -ENOMEM;

Why do we need to reach into some other node to get the memory region to
map?

> +
> +       clks[IMX8MM_AUDIO_PLL1_REF_SEL] =3D imx_clk_mux("audio_pll1_ref_s=
el", base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +       clks[IMX8MM_AUDIO_PLL2_REF_SEL] =3D imx_clk_mux("audio_pll2_ref_s=
el", base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +       clks[IMX8MM_VIDEO_PLL1_REF_SEL] =3D imx_clk_mux("video_pll1_ref_s=
el", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +       clks[IMX8MM_DRAM_PLL_REF_SEL] =3D imx_clk_mux("dram_pll_ref_sel",=
 base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
[...]
> +       clks[IMX8MM_SYS_PLL2_333M] =3D imx_clk_fixed_factor("sys_pll2_333=
m", "sys_pll2_out", 1, 3);
> +       clks[IMX8MM_SYS_PLL2_500M] =3D imx_clk_fixed_factor("sys_pll2_500=
m", "sys_pll2_out", 1, 2);
> +       clks[IMX8MM_SYS_PLL2_1000M] =3D imx_clk_fixed_factor("sys_pll2_10=
00m", "sys_pll2_out", 1, 1);
> +
> +       np =3D dev->of_node;
> +       base =3D of_iomap(np, 0);
> +       if (WARN_ON(!base))
> +               return -ENOMEM;

This can surely use the platform device APIs to map and retrieve memory
regions.

> +
[...]
> +
> +       imx_check_clocks(clks, ARRAY_SIZE(clks));
> +
> +       clk_data.clks =3D clks;
> +       clk_data.clk_num =3D ARRAY_SIZE(clks);
> +       ret =3D of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data=
);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to register clks for i.MX8MM\n");
> +               return -EINVAL;
> +       }
> +
> +       imx_register_uart_clocks(uart_clks);
> +
> +       pr_info("i.MX8MM clock driver init done\n");

Please no "I"m alive" messages.

> +
> +       return 0;
> +}
> +
