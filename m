From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 2/5] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Date: Tue, 24 Sep 2019 09:23:32 +0000
Message-ID: <AM5PR1001MB0994ABEF9C32BFB7BEA099B680840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-3-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917124246.11732-3-m.felsch@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, Support Opensource <Support.Opensource@diasemi.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 17 September 2019 13:43, Marco Felsch wrote:

> Add the documentation which describe the voltage selection gpio support.
> This property can be applied to each subnode within the 'regulators'
> node so each regulator can be configured differently.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/mfd/da9062.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> b/Documentation/devicetree/bindings/mfd/da9062.txt
> index edca653a5777..9d9820d8177d 100644
> --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> @@ -66,6 +66,15 @@ Sub-nodes:
>    details of individual regulator device can be found in:
>    Documentation/devicetree/bindings/regulator/regulator.txt
>=20
> +  Optional regulator device-specific properties:
> +  - dlg,vsel-sense-gpios : The GPIO reference which should be used by th=
e
> +    regulator to switch the voltage between active/suspend voltage setti=
ngs. If
> +    the signal is active the active-settings are applied else the suspen=
d
> +    settings are applied. Attention: Sharing the same gpio for other pur=
poses
> +    or across multiple regulators is possible but the gpio settings must=
 be the
> +    same. Also the gpio phandle must refer to to the dlg,da9062-gpio dev=
ice
> +    other gpios are not allowed and make no sense.
> +

Should we not use the binding names that are defined in 'gpio-regulator.yam=
l' as
these seem to be generic and would probably serve the purpose here?

>  - rtc : This node defines settings required for the Real-Time Clock asso=
ciated
>    with the DA9062. There are currently no entries in this binding, howev=
er
>    compatible =3D "dlg,da9062-rtc" should be added if a node is created.
> --
> 2.20.1
