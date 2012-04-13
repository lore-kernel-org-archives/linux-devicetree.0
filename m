From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: pinctrl-imx: add imx pinctrl core driver
Date: Sat, 14 Apr 2012 02:17:13 +0800
Message-ID: <CAA+hA=QaD=wzJoeNUxDqwAJ1grBiPxSKY+_cwYgNMBuaF4OJ6w@mail.gmail.com>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334333915-1174-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, s.hauer@pengutronix.de, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 14, 2012 at 12:18 AM, Dong Aisheng <b29396@freescale.com> w=
rote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
>
> The driver has mux and config support while the gpio is still
> not supported.
> For select input setting, the driver will handle it internally
> and do not need user to take care of it.
>
> The pinctrl-imx core driver will parse the dts file and dynamically
> create the pinmux functions and groups.
>
> Each IMX SoC pinctrl driver should register pins with a pin register =
map
> including mux register and config register and select input map to co=
re
> for proper operations.
>
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> ---
> =A0.../bindings/pinctrl/fsl,imx6q-pinctrl.txt =A0 =A0 =A0 =A0 | =A020=
1 ++++++
> =A0drivers/pinctrl/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A04 +
> =A0drivers/pinctrl/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A01 +
> =A0drivers/pinctrl/pinctrl-imx.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0716 ++++++++++++++++++++
> =A0drivers/pinctrl/pinctrl-imx.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0117 ++++
> =A05 files changed, 1039 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,i=
mx6q-pinctrl.txt
> =A0create mode 100644 drivers/pinctrl/pinctrl-imx.c
> =A0create mode 100644 drivers/pinctrl/pinctrl-imx.h
>
=2E........
> +static int __devinit imx_pmx_parse_functions(struct device_node *np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct imx_pinctrl_info=
 *info, u32 index)
> +{
> + =A0 =A0 =A0 struct device_node *child;
> + =A0 =A0 =A0 struct imx_pmx_func *func;
> + =A0 =A0 =A0 struct imx_pin_group *grp;
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 static u32 grp_index;
> + =A0 =A0 =A0 u32 i =3D 0;
> +
> + =A0 =A0 =A0 dev_dbg(info->dev, "parse function(%d): %s\n", index, n=
p->name);
> +
> + =A0 =A0 =A0 func =3D &info->functions[index];
> +
> + =A0 =A0 =A0 /* Initialise function */
> + =A0 =A0 =A0 func->name =3D np->name;
> + =A0 =A0 =A0 func->num_groups =3D of_get_child_count(np);
The driver depends on another dt patch which seems missed the 3.4 kerne=
l.
[PATCH V3 1/1] dt: add of_get_child_count helper function
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-February/084=
327.html
I just sent out the mail to check with Rob.

Regards
Dong Aisheng
