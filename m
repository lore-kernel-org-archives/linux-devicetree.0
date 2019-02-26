From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v3 0/5] Enable wm8524 on i.MX8MQ
Date: Tue, 26 Feb 2019 15:29:52 +0200
Message-ID: <CAEnQRZDk=eTOmaAK8YoHy63PomrpfUDJ59mL5ipqeJx8v5bRDQ@mail.gmail.com>
References: <20190226070742.30551-1-daniel.baluta@nxp.com> <CAOMZO5CpefU56xLaOUq0GRwWP9kcMPyZ2PWM38C9FuU-3k1MJA@mail.gmail.com>
 <CAEnQRZBRG4d59y3kteMaZMjfHWZ=FYL4dP+uRcthvXxqtmH7cw@mail.gmail.com> <CAOMZO5DTR8aLphJBCqR=oLOz5aZXuNfPVEgUk6K_YOdVD0UK+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5DTR8aLphJBCqR=oLOz5aZXuNfPVEgUk6K_YOdVD0UK+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-li
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 3:10 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Feb 26, 2019 at 10:05 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> > I get your point here. But for the moment it is identical with
> > "fsl,imx7d-sdma" so there is no need to add it now!
> >
> > See the discussion here, and comment from Lucas:
> >
> > https://lkml.org/lkml/2019/1/28/194
>
> Lucas' suggestion was not change the sdma driver code and I also agree with it.
>
> The SoC dts should still use:
>
> compatible = "fsl, imx8mq-sdma","fsl,imx7d-sdma";

Ok, makes sense. Will fix in next version.
