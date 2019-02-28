From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: memory-controllers: freescale: add
 MMDC binding doc
Date: Thu, 28 Feb 2019 15:26:25 -0300
Message-ID: <CAOMZO5C6UOG5aW2EiUMNqMjsQRqqotDWvtA=EBwctYicxXJ1yw@mail.gmail.com>
References: <1551321831-11597-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551321831-11597-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Feb 27, 2019 at 11:48 PM Anson Huang <anson.huang@nxp.com> wrote:

> +Required properties :
> +- compatible : should be one of following:
> +       for i.MX6Q/i.MX6DL:
> +       - "fsl,imx6q-mmdc";

You missed the entry for imx6qp.
