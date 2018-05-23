From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: DTS: imx53: Add support for imx53 HSC/DDC boards
 from K+P
Date: Wed, 23 May 2018 10:56:13 -0300
Message-ID: <CAOMZO5DoLwEmQz5BQHDLk8sBq7mDH_UxBjRA0RGKb+PunMYu-Q@mail.gmail.com>
References: <20180509153428.1440-1-lukma@denx.de> <CAOMZO5AexXNEGVoXa9K_GAm+aFLNRQOXOhF_SdKAjV1qmuD2nA@mail.gmail.com>
 <20180519140202.3449e3c1@jawa>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180519140202.3449e3c1@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Lukasz,

On Sat, May 19, 2018 at 9:02 AM, Lukasz Majewski <lukma@denx.de> wrote:

> After removing imx53-kp-ddc and imx53-kp-common iomux subnodes I do see
> following errors in the dmesg (v4.17-rc5):
>
> imx53-pinctrl 53fa8000.iomuxc: function 'iomuxc' not supported
> imx53-pinctrl 53fa8000.iomuxc: invalid function iomuxc in map table

Could you please investigate this error?

I have just tried the following change on a imx53-qsb:
http://code.bulix.org/ik01yu-339697

and it works as expected:
# dmesg  | grep iomux
[    0.100046] imx53-pinctrl 53fa8000.iomuxc: initialized IMX pinctrl driver
