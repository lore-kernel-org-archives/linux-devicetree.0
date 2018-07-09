From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] bindings: add clocks optional binding for imx gpio
Date: Mon, 9 Jul 2018 15:03:17 +0200
Message-ID: <CACRpkdbE25NeZ_GuJOxSsC90Wog2LGmYuACydEUB7qx-CO2orw@mail.gmail.com>
References: <1530580694-8649-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530580694-8649-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 3, 2018 at 3:22 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Some i.MX SoCs have GPIO clock gate in CCM, accessing
> GPIO registers needs to enable GPIO clock gate first,
> i.MX GPIO driver will enable clock gate if there is
> clock property in GPIO node of dtb, add optional property
> to i.MX GPIO binding doc.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch applied as pretty uncontroversial.

Yours,
Linus Walleij
