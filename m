From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Document the i.MX50 IOMUXC binding
Date: Fri, 8 Feb 2019 09:57:04 -0200
Message-ID: <CAOMZO5ABy+uDXMhQy95vuY8Yz2a8Wr0Q0+fUq=2Xkm2NSCdQGQ@mail.gmail.com>
References: <20190129165530.7606-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129165530.7606-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Dong Aisheng <dong.aisheng@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Tue, Jan 29, 2019 at 2:55 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> AFAICS from the i.MX50 Reference Manual, the i.MX50 IOMUXC works the
> same as the one in i.MX51, so I copied fsl,imx51-pinctrl.txt and changed
> the text to imx50.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Cc: Dong Aisheng <dong.aisheng@linaro.org>
> Cc: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

> +Required properties:
> +- compatible: "fsl,imx50-iomuxc"
> +- fsl,pins: two integers array, represents a group of pins mux and confi=
g
> +  setting. The format is fsl,pins =3D <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID =
is a
> +  pin working on a specific function, CONFIG is the pad setting value li=
ke
> +  pull-up for this pin. Please refer to imx50 datasheet for the valid pa=
d

Nit: It is the i.MX50 Reference Manual, not its datasheet that
describes the pad settings values.

I noticed that all the bindings say datasheet though, so I will send a
patch to fix this.
