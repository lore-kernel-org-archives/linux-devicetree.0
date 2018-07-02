From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] bindings: add clocks optional binding for imx gpio
Date: Mon, 2 Jul 2018 10:54:06 -0300
Message-ID: <CAOMZO5Bw8u_rkY9iow=ypDvG4+9OE77b8hDneOxFHxNO54m9Aw@mail.gmail.com>
References: <1530243004-10529-1-git-send-email-Anson.Huang@nxp.com> <CACRpkdbbbbO-94i-ZTSunzuUQcJ8dQpuPHBYODrvdWQyuri7yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbbbbO-94i-ZTSunzuUQcJ8dQpuPHBYODrvdWQyuri7yw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 2, 2018 at 10:45 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jun 29, 2018 at 5:34 AM Anson Huang <Anson.Huang@nxp.com> wrote:
>
>> Some i.MX SoCs have GPIO clock gate in CCM, accessing
>> GPIO registers needs to enable GPIO clock gate first,
>> i.MX GPIO driver will enable clock gate if there is
>> clock property in GPIO node of dtb, add optional property
>> to i.MX GPIO binding doc.
>>
>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>
> Make sense since the gpio-mxc driver already supports this :)
>
>> +Optional properties:
>> +- clocks: the clocks used by gpio bank
>
> Should the text be "the clock for clocking the GPIO silicon"
> I guess that is what it is. And singularis?
>
> Does it hurt to give the clock a name? Like the common
> "pclk" for peripheral clock or something similar that other
> i.MX silicon uses?
>
> Fabio: can we have your ACK on this too.

In case a respin will be made for this one I would suggest to add the
name of the SoCs that need to pass the GPIO clock like imx6ul, imx6sll
in the commit log.

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
