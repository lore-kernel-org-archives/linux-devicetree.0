From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCHv2] clk: add imx8 clk defines
Date: Thu, 11 Jul 2019 13:09:17 +0300
Message-ID: <CAEnQRZBmcRLZKKAj5Nr9=SZTrbr3u-KdvRzg3StY=sY+06psdQ@mail.gmail.com>
References: <20190619074000.30852-1-oliver.graute@gmail.com>
 <20190711082039.zze4t22rvlgdxzow@fsr-ub1664-175> <20190711085725.GA1385@optiplex>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190711085725.GA1385@optiplex>
Sender: linux-kernel-owner@vger.kernel.org
To: Oliver Graute <oliver.graute@gmail.com>
Cc: Abel Vesa <abel.vesa@nxp.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2019 at 12:19 PM Oliver Graute <oliver.graute@gmail.com> wrote:
>
> On 11/07/19, Abel Vesa wrote:
> > On 19-06-19 09:39:52, Oliver Graute wrote:
> > > From: Oliver Graute <oliver.graute@kococonnector.com>
> > >
> > > added header defines for imx8qm clock
> > >
> > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> >
> > Again, this seems to be taken from some vendor tree, so please keep the
> > original author.
>
> yes the header defines is from NXP vendor tree. One of orginal authors is
>
> Author: Anson Huang <Anson.Huang@nxp.com>
> Date:   Thu Jan 19 03:53:31 2017 +0800
>     MLK-13911-3 ARM64: dts: imx8qm: add dtsi
>     Add i.MX8QM dtsi support.
>     https://github.com/ADVANTECH-Corp/linux-imx6.git
>
> Whats is the right way to attribute him?

git commit --amend author="Anson Huang <Anson.Huang@nxp.com>"

Also, modify commit body and add
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Then add your Signed-off-by.

thanks,
Daniel.
