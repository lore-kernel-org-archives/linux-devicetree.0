From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: add xHCI & usb phy for
 mt8173
Date: Mon, 20 Jul 2015 22:51:13 +0800
Message-ID: <1437403873.15139.5.camel@mtksdaap41>
References: <1436348468-4126-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1436348468-4126-6-git-send-email-chunfeng.yun@mediatek.com>
	 <CAGS+omDfUv0KW8K45rLoN8qUV2Q_vgWFK_X4Ojb6K55G9tiehA@mail.gmail.com>
	 <1437403179.11518.10.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437403179.11518.10.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: chunfeng yun <chunfeng.yun@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org


Hi Daniel, Chunfeng,


On Mon, 2015-07-20 at 22:39 +0800, chunfeng yun wrote:
> Hi,
> 
> On Tue, 2015-07-14 at 18:12 +0800, Daniel Kurtz wrote:
<...>
> > > +
> > > +       usb_p1_vbus: fixedregulator@0 {
> > 
> > Why @0 ?
> It is the first fixed regulator, so set it to 0 as a index.
> I will remove it later

Since this name should be unique, I think we should use gpio number as
address for fixedregulator in case we need other fixedregulators. So
this could be:

	usb_p1_vbus: fixedregulator@130 {

Also, we should sort according to the address(gpio number) for these
nodes. Does this make sense?

Joe.C

> > 
> > > +               compatible = "regulator-fixed";
> > > +               regulator-name = "usb_vbus";
> > > +               regulator-min-microvolt = <5000000>;
> > > +               regulator-max-microvolt = <5000000>;
> > > +               gpio = <&pio 130 GPIO_ACTIVE_HIGH>;
> > > +               enable-active-high;
> > > +       };
