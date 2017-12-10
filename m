From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 2/6] ARM: dts: imx7d-cl-som: add nodes for usbh, and usbotg2
Date: Sun, 10 Dec 2017 13:14:17 -0200
Message-ID: <CAOMZO5DKLT4YtzS9pxCU3O9ToCRUMXJhZZsQ71LhnOdORkYM5g@mail.gmail.com>
References: <20171205222707.11302-1-tyler@opensourcefoundries.com> <20171205222707.11302-3-tyler@opensourcefoundries.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171205222707.11302-3-tyler@opensourcefoundries.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tyler@opensourcefoundries.com
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 8:27 PM,  <tyler@opensourcefoundries.com> wrote:
> From: Tyler Baker <tyler@opensourcefoundries.com>
>
> Add device tree nodes for the USB hub, and USB OTG. i2c2 on this
> platform supports low state retention power state so lets use it.

Looks like the I2C2 fix should be a separate patch.
