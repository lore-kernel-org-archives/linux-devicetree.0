From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa boards
Date: Fri, 28 Dec 2018 16:20:37 -0200
Message-ID: <CAOMZO5CuPr_BxMP_wjPuZNTCinHQ-cb08wPHr=Od_Qw_aafPTw@mail.gmail.com>
References: <1545144107-88378-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545144107-88378-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vok=C3=A1=C4=8D,

On Tue, Dec 18, 2018 at 12:42 PM Vok=C3=A1=C4=8D Michal <Michal.Vokac@ysoft=
.com> wrote:

> +&fec {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_enet>;
> +       phy-mode =3D "rgmii-id";
> +       phy-reset-gpios =3D <&gpio1 25 GPIO_ACTIVE_HIGH>;

Are you sure this is active high?

The FEC driver ignores the polarity of phy-reset-gpios and it assumes
the GPIO reset as active low.

If it really is active high, then you would need to pass the
"phy-reset-active-high" property.

> +/ {
> +       model =3D "Y Soft IOTA Draco i.MX6Solo board";
> +       compatible =3D "ysoft,imx6dl-yapp4-draco", "fsl,imx6dl";
> +
> +       cpus {
> +               /delete-node/ cpu@1;

Is this really needed? We don't usually do this on imx6solo dts board files=
.

Only one CPU will be brought up online on imx6solo anyway.

> +       };
> +
> +       memory@10000000 {

Need to pass "device_type =3D "memory";"

> +/ {
> +       model =3D "Y Soft IOTA Hydra i.MX6DualLite board";
> +       compatible =3D "ysoft,imx6dl-yapp4-hydra", "fsl,imx6dl";
> +
> +       memory@10000000 {

Need to pass "device_type =3D "memory";"

> +       memory@10000000 {

Need to pass "device_type =3D "memory";"
