From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: freescale: add MMDC
 binding doc
Date: Wed, 27 Feb 2019 16:47:52 -0300
Message-ID: <CAOMZO5BtjCDw4Vd2DpJdw7iamK694EpvGxsVZ7Me_guesoqqaw@mail.gmail.com>
References: <1551261844-23983-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551261844-23983-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Feb 27, 2019 at 7:08 AM Anson Huang <anson.huang@nxp.com> wrote:

> +Example :
> +       mmdc0: mmdc@21b0000 { /* MMDC0 */

Node names should be generic, so:

memory-controller@21b0000
