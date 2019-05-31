From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: imx8mm-evk: Enable audio codec wm8524
Date: Fri, 31 May 2019 15:28:33 +0800
Message-ID: <20190531072832.GC23453@dragon>
References: <20190515144210.25596-1-daniel.baluta@nxp.com>
 <20190515144210.25596-3-daniel.baluta@nxp.com>
 <CAOMZO5A6Gv5k3up0AtKrhQPyMLMe_8SXift68KEP2J+j8D_cJg@mail.gmail.com>
 <CAOMZO5BTqwnun6d7G1vcHUu_Rs+xfvgxTzamWnBPy76W7eeF_A@mail.gmail.com>
 <CAEnQRZD98TKduVLshGrBANRB6NT7Se6CXD0cgd5XRYa6grAo4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEnQRZD98TKduVLshGrBANRB6NT7Se6CXD0cgd5XRYa6grAo4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 10:10:43AM +0300, Daniel Baluta wrote:
> On Mon, May 20, 2019 at 10:33 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > On Thu, May 16, 2019 at 3:35 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > On Wed, May 15, 2019 at 11:42 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
> > >
> > > > +               simple-audio-card,codec {
> > > > +                       sound-dai = <&wm8524>;
> > > > +                       clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
> > >
> > > IMX8MM_CLK_SAI3_ROOT is the internal clock that drives the SAI3
> > > interface, not an external clock that feeds the codec.
> > >
> > > It seems you should remove this 'clocks' entry.
> >
> > Just checked the schematics and the SAI3_MCLK pin clocks the codec, so
> > the representation is correct:
> >
> > Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Shawn,
> 
> Can you have a look?

I cannot apply this one, because there are '=20' in the patch content.

Shawn
