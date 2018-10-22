Return-Path: <SRS0=jsFN=NC=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20181022054031.14027-1-peter.chen@nxp.com> <20181022054031.14027-5-peter.chen@nxp.com>
 <2f67fca8-5a50-641e-9e56-6a5a701a2f70@kontron.de>
In-Reply-To: <2f67fca8-5a50-641e-9e56-6a5a701a2f70@kontron.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 22 Oct 2018 11:59:18 -0300
Message-ID: <CAOMZO5BsT40T+BH35Wx6fZwJDad+QAqTy9jyJK0bvBJFa0QO8w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Content-Type: text/plain; charset="UTF-8"
To: frieder.schrempf@kontron.de
Cc: Peter Chen <peter.chen@nxp.com>, USB list <linux-usb@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 22, 2018 at 11:55 AM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:

> I think you forgot to improve this description. Maybe something like this:
>
> pinctrl-names: Names for optional pin modes for "default", "host" or
>                 "device". In case of HSIC-mode "idle" and "active" pin
>                 modes are mandatory. In this case the "idle" state needs
>                 to pull down the data and strobe pin and the "active"
>                 state needs to pull up the strobe pin.

Correct, and the dts example is also missing.
