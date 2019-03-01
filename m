From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: imx8mq-evk: Enable wm8524 codec
Date: Fri, 1 Mar 2019 17:53:47 +0200
Message-ID: <CAEnQRZCyUG33SbwhPkE95tuaBdJ7Lo9WbVfJz06ZB1-X9ZbKww@mail.gmail.com>
References: <20190227063737.24445-1-daniel.baluta@nxp.com> <20190227063737.24445-6-daniel.baluta@nxp.com>
 <CAOMZO5AY--Q7FDwK-k8u=mkR-9bxz0XWXN3HNZb4Pb+MESZ6Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AY--Q7FDwK-k8u=mkR-9bxz0XWXN3HNZb4Pb+MESZ6Dg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-li
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 11:09 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Feb 27, 2019 at 3:38 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> > +
> > +       wm8524: audio-codec-0 {
>
> This -0 is not needed as we have a single codec on this board.

Ok, will fix.

>
> > +               #sound-dai-cells = <0>;
> > +               compatible = "wlf,wm8524";
> > +               clocks = <&clk IMX8MQ_CLK_SAI2_ROOT>;
> > +               clock-names = "mclk";
>
> The clocks and clock-names properties can be removed, right?
>
> I don't see them defined in the binding doc and the codec driver does
> not call clk_get(), so there is a mismatch.

They are used by simple-card.c machine driver.

asoc_simple_card_parse_clk
-> /* Parse dai->sysclk come from "clocks = <&xxx>" */
clk = devm_get_clk_from_child(dev, node, NULL);

>
> Also, I still think this one and the previous patch could be made into
> a single patch that adds audio support for the board.

Ok.
