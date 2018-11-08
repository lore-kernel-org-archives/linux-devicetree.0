From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7d-sdb: add rev-a board support
Date: Thu, 8 Nov 2018 13:37:43 -0200
Message-ID: <CAOMZO5CPZKqJdTPzZDw=19HW_YCg_JGvLpw9i3iKsi+EJF-yNg@mail.gmail.com>
References: <1541567625-11812-1-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5AL03yy6Vj_eC=h7scSDnuja1G8rsWER+r7w3FEVaceDg@mail.gmail.com>
 <DB3PR0402MB3916B318947B803BC5ADF4A6F5C50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAOMZO5DiTbEsVXTCfE8fJ=4+yU4oXR1gex7Bj-k=FowKHWJaxw@mail.gmail.com> <DB3PR0402MB3916B027A9C724D349C7969EF5C50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916B027A9C724D349C7969EF5C50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Thu, Nov 8, 2018 at 12:30 AM Anson Huang <anson.huang@nxp.com> wrote:

> Thanks for pointing out this issue, I made a mistake when doing the search in git repo..
> So, if we have to assert a GPIO, there is no common way in pinctrl driver? Have to
> do it in driver itself? Like this case, we have to assert the GPIO in fec driver?

You could pass "phy-supply" property  and model it as gpio controlled regulator.
