From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: imx8mq: add DCSS node
Date: Mon, 23 Sep 2019 14:53:07 -0300
Message-ID: <CAOMZO5C7d6ovHSyaXNWD4NmTNF-r8jw1tCLxNuh1BmD4JReMjQ@mail.gmail.com>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
 <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
 <CAOMZO5AOVfBpz2Azh65iT_W3CBZUxf9KnqA=kdow7XWd4j--Qg@mail.gmail.com> <45ad0ec1bfd5af4f46efd7d24c627822ac17fdbf.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <45ad0ec1bfd5af4f46efd7d24c627822ac17fdbf.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Laurentiu Palcu <laurentiu.palcu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 2:01 PM Lucas Stach <l.stach@pengutronix.de> wrote:

> No, they are not. Those are imx-irqsteer IRQs, this controller has 0
> irq cells, so the description in this patch is correct.

Good point, thanks!
