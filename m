From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v3] ARM: dts: imx: Add support for Advantech DMS-BA16
Date: Fri, 9 Feb 2018 11:00:53 +0800
Message-ID: <20180209030052.GK31910@dragon>
References: <20180206191704.7933-1-yungching0725@gmail.com>
 <20180208090345.GH31910@dragon>
 <CACGtqyz-Af6GijOrWYpAM9xvRjUfftA_M1aayf5q+xU1-x8kYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACGtqyz-Af6GijOrWYpAM9xvRjUfftA_M1aayf5q+xU1-x8kYQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yung-Ching LIN <yungching0725@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 08, 2018 at 11:24:53AM -0800, Yung-Ching LIN wrote:
> Will correct the USB_OTG_ID pinmux setting in the v4.
> Do you mind if I redefine reg_usb_otg_vbus node since we just started
> using OTG host/device mode on this board ?

Not at all.  Feel free to change it.

Shawn
