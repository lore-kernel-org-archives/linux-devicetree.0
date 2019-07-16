From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [v4,1/2] rtc/fsl: add FTM alarm driver as the wakeup
 source
Date: Tue, 16 Jul 2019 03:49:22 +0000
Message-ID: <DB7PR04MB449094EC27851F3DE0BA5BA08FCE0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190715101520.22562-1-biwen.li@nxp.com>
 <20190715145637.GG4732@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715145637.GG4732@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiaobo Xie <xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Caution: EXT Email
>=20
> On 15/07/2019 18:15:19+0800, Biwen Li wrote:
> > +     device_init_wakeup(&pdev->dev, true);
> > +     rtc->rtc_dev =3D devm_rtc_device_register(&pdev->dev, "ftm-alarm"=
,
> > +
> &ftm_rtc_ops,
> > +
> THIS_MODULE);
>=20
> To be clear, I want you to not use devm_rtc_device_register and use
> devm_rtc_allocate_device and rtc_register_device.
I will correct it in v5.
>=20
> > +     if (IS_ERR(rtc->rtc_dev)) {
> > +             dev_err(&pdev->dev, "can't register rtc device\n");
> > +             return PTR_ERR(rtc->rtc_dev);
> > +     }
> > +
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7Cc5b1382ed1fb493cf69
> f08d7093513b2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 6987995881848030&amp;sdata=3DT71z2Rjw%2FZL444U8C1ow3WcoyDYl76Mq
> niLIupXbXtI%3D&amp;reserved=3D0
