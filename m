From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx8mm: Add SAI nodes
Date: Thu, 16 May 2019 15:33:19 -0300
Message-ID: <CAOMZO5Avmjf9GpGWBbMJrOxWdvdBTyXMoOPQw_uOQHhCayuHtg@mail.gmail.com>
References: <20190515144210.25596-1-daniel.baluta@nxp.com> <20190515144210.25596-2-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515144210.25596-2-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Wed, May 15, 2019 at 11:42 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> i.MX8MM has 5 SAI instances with the following base
> addresses according to RM.
>
> SAI1 base address: 3001_0000h
> SAI2 base address: 3002_0000h
> SAI3 base address: 3003_0000h
> SAI5 base address: 3005_0000h
> SAI6 base address: 3006_0000h

No SAI4?

I know the RM does not show the SAI4 in the memory map, but the clock
driver does show a SAI4 clock gate.

So it seems we have a contradiction in the reference manual. Could you
please double check with the internal folks?
