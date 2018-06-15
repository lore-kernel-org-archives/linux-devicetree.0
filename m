From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl-sabreauto: Add sensors
Date: Fri, 15 Jun 2018 17:16:31 -0300
Message-ID: <CAOMZO5D0fBcwD+6SHor+mGvB=7m8WrTmi-QPTYWjMnQchVATOg@mail.gmail.com>
References: <b31ca3ff50566c193003614d0bbf5e0a0e95901c.1528390418.git.leonard.crestez@nxp.com>
 <CAOMZO5Czf1bO7vJZ1UG46DyVhzApqS82GFw+NFm_HN5tjD=xoQ@mail.gmail.com> <a20cc6a0c278cc2791c0bdfc30a79b022de396ef.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a20cc6a0c278cc2791c0bdfc30a79b022de396ef.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "slongerbeam@gmail.com" <slongerbeam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 7:17 AM, Leonard Crestez
<leonard.crestez@nxp.com> wrote:

> Should I also assign a label, like "isl29023: light-sensor@44"? I
> couldn't find any recommendation on this.
>
> There are no immediate uses for a label but this practice is very
> common. Having labels allows creating minor board variants with reduced
> churn in the base dts so it seems good.

In the case of this specific board we don't have board variants, so no
need to add a label.
