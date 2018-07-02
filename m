From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] bindings: add clocks optional binding for imx gpio
Date: Mon, 2 Jul 2018 15:45:39 +0200
Message-ID: <CACRpkdbbbbO-94i-ZTSunzuUQcJ8dQpuPHBYODrvdWQyuri7yw@mail.gmail.com>
References: <1530243004-10529-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530243004-10529-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2018 at 5:34 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Some i.MX SoCs have GPIO clock gate in CCM, accessing
> GPIO registers needs to enable GPIO clock gate first,
> i.MX GPIO driver will enable clock gate if there is
> clock property in GPIO node of dtb, add optional property
> to i.MX GPIO binding doc.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Make sense since the gpio-mxc driver already supports this :)

> +Optional properties:
> +- clocks: the clocks used by gpio bank

Should the text be "the clock for clocking the GPIO silicon"
I guess that is what it is. And singularis?

Does it hurt to give the clock a name? Like the common
"pclk" for peripheral clock or something similar that other
i.MX silicon uses?

Fabio: can we have your ACK on this too.

Yours,
Linus Walleij
