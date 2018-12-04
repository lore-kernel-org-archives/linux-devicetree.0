Return-Path: <SRS0=RJyR=ON=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20181127092824.22756-1-peter.chen@nxp.com> <20181127092824.22756-5-peter.chen@nxp.com>
 <CAOMZO5CV9Hk5ORnmjOLSZv5bk61nc2Ljq_4vKvRvAvO_F=Fzxg@mail.gmail.com>
 <VI1PR04MB5327E51B366724706028E07E8BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <a081eb16-920a-0ff4-2ae7-7c9efd28668a@kontron.de>
In-Reply-To: <a081eb16-920a-0ff4-2ae7-7c9efd28668a@kontron.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Dec 2018 18:01:32 -0200
Message-ID: <CAOMZO5BdzvSNovd15jcijGBMzS_G+5xnmyNBXMH7S3cmwCfKMA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Content-Type: text/plain; charset="UTF-8"
To: frieder.schrempf@kontron.de
Cc: Peter Chen <peter.chen@nxp.com>, USB list <linux-usb@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>
List-ID: <devicetree@vger.kernel.org>

Hi Frieder,

On Tue, Dec 4, 2018 at 12:31 PM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:

> There are many other optional properties for this driver and a lot of
> them are not in the given example. Maybe we should just keep the
> pinctrls for HSIC-mode out of the example, too?

I am just trying to make life easier for those who want to use HSIC
support with chipidea.

Can we just add a real dts snippet example of your board into the
binding document?
