From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 2/3] ARM: dts: imx7ulp: add mmdc support
Date: Wed, 27 Feb 2019 22:57:24 -0300
Message-ID: <CAOMZO5BXCgj+uqA0xoOFYo3GxbN_HfbFyfQFmNRa4_AHL3nx0g@mail.gmail.com>
References: <1551316741-7848-1-git-send-email-Anson.Huang@nxp.com>
 <1551316741-7848-2-git-send-email-Anson.Huang@nxp.com> <CAOMZO5DQM0-rBbWuWa7dZw8es1NbY8DwCGmU4_ZJ2FdFEXYC6Q@mail.gmail.com>
 <DB3PR0402MB391672641C4829C18DA0DB36F5750@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB391672641C4829C18DA0DB36F5750@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Feb 27, 2019 at 10:54 PM Anson Huang <anson.huang@nxp.com> wrote:

> If so, should I change other i.MX6 SoCs with single MMDC node as well?
> Remove them as well?

Only imx6qp needs the mmdc label.

I can send a patch removing it from the other i.MX SoCs, so don't need
to worry about it in your series.

Thanks
