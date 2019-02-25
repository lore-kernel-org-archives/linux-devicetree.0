From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 0/5 v2] Enable wm8524 on i.MX8MQ
Date: Mon, 25 Feb 2019 16:12:40 +0200
Message-ID: <CAEnQRZDviDcZPJ2cP8_g6v67=T212G5KZosvEMqMeGGE9NL30g@mail.gmail.com>
References: <20190225132617.10987-1-daniel.baluta@nxp.com> <CAGUNXRQdETxnJGP9uQs91mn1w9qJrh4PhZz72bwEh63hrKCX7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGUNXRQdETxnJGP9uQs91mn1w9qJrh4PhZz72bwEh63hrKCX7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Spencer <spencercw@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "baruch@tkos.co.il" <baruch@tkos.co.il>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, linux-arm-kernel@list
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2019 at 4:02 PM Chris Spencer <spencercw@gmail.com> wrote:
>
> Hi Daniel,
>
> On Mon, 25 Feb 2019 at 13:26, Daniel Baluta <daniel.baluta@nxp.com> wrote:
> >   arm64: dts: imx8mq: Add SDMA nodes
> >   arm64: dts: imx8mq: Add SAI2 node
> >   arm64: dts: imx8qm: Add SAI pinctrl configuration
> >   arm64: dts: imx8qm: Enable SAI2 for wm8524 codec
> >   arm64: dts: imx8qm: Enable wm8524 codec
>
> imx8qm ought to be imx8mq here by the looks of it.

Hi Chris,

You are right :), will fix with v3. Will send v3 tomorrow to allow some
time for more feedback.

Thanks!
