From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mm-evk: Enable audio codec wm8524
Date: Tue, 23 Apr 2019 09:22:48 +0300
Message-ID: <CAEnQRZD5506EdkO5ESwWe+=J-uEeZw9m47_XNj8DUHy4Hck78g@mail.gmail.com>
References: <20190422193542.2853-1-daniel.baluta@nxp.com> <20190422193542.2853-3-daniel.baluta@nxp.com>
 <20190423051738.tmyto7nvm4w5zt4r@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423051738.tmyto7nvm4w5zt4r@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Marco,

On Tue, Apr 23, 2019 at 8:19 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi Daniel,
>
> On 19-04-22 19:36, Daniel Baluta wrote:
> > i.MX8MM has one wm8524 audio codec connected with
> > SAI3 digital audio interface.
> >
> > This patch uses simple-card machine driver in order
> > to enable wm8524 codec.
> >
> > We need to set:
> >       * SAI3 pinctrl configuration
> >       * clock hierarchy
> >       * codec node
> >       * simple-card configuration
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 48 ++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > index 2d5d89475b76..207b13266a96 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > @@ -37,6 +37,35 @@
> >               gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > +
> > +     wm8524: audio-codec {
> > +             #sound-dai-cells = <0>;
> > +             compatible = "wlf,wm8524";
> > +             wlf,mute-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
>
> I would mux the gpio where I use them.

I'm not sure I understand this. Can you provide an example.
>
> > +     };
> > +
> > +     sound-wm8524 {
> > +             compatible = "simple-audio-card";
> > +             simple-audio-card,name = "wm8524-audio";
> > +             simple-audio-card,format = "i2s";
> > +             simple-audio-card,frame-master = <&cpudai>;
> > +             simple-audio-card,bitclock-master = <&cpudai>;
> > +             simple-audio-card,widgets =
> > +                     "Line", "Left Line Out Jack",
> > +                     "Line", "Right Line Out Jack";
> > +             simple-audio-card,routing =
> > +                     "Left Line Out Jack", "LINEVOUTL",
> > +                     "Right Line Out Jack", "LINEVOUTR";
> > +
> > +             cpudai: simple-audio-card,cpu {
> > +                     sound-dai = <&sai3>;
> > +             };
> > +
> > +             link_codec: simple-audio-card,codec {
>
> Can you drop that phandle?

I see your point here. But for symmetry and consistency with
imx8mm-evk I would prefer
to keep it like that.

https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/tree/arch/arm64/boot/dts/freescale/imx8mq-evk.dts?h=for-next#n59
