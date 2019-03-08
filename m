From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: imx8mq-evk: Enable wm8524 codec
Date: Fri, 8 Mar 2019 07:32:45 -0300
Message-ID: <CAOMZO5COQNvpbdxG808aRSfMhMHznorPzoCD-Kp7rB6e8jz4Ng@mail.gmail.com>
References: <20190227063737.24445-1-daniel.baluta@nxp.com> <20190227063737.24445-6-daniel.baluta@nxp.com>
 <CAOMZO5AY--Q7FDwK-k8u=mkR-9bxz0XWXN3HNZb4Pb+MESZ6Dg@mail.gmail.com> <CAEnQRZCyUG33SbwhPkE95tuaBdJ7Lo9WbVfJz06ZB1-X9ZbKww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZCyUG33SbwhPkE95tuaBdJ7Lo9WbVfJz06ZB1-X9ZbKww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-li
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, Mar 1, 2019 at 12:53 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:

> They are used by simple-card.c machine driver.
>
> asoc_simple_card_parse_clk
> -> /* Parse dai->sysclk come from "clocks = <&xxx>" */
> clk = devm_get_clk_from_child(dev, node, NULL);

The simple-card looks for the "clocks" properties inside the
simple-card node, not inside the codec node, right?
