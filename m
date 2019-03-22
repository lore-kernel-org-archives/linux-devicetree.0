From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/5] ARM: dts: imx50: Add PHY node for usbotg and adjust
 clocks
Date: Fri, 22 Mar 2019 09:41:21 +0800
Message-ID: <20190322014120.GS12513@dragon>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
 <20190319152421.16179-4-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190319152421.16179-4-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 04:24:18PM +0100, Jonathan Neuschäfer wrote:
> Even though the ChipIdea USB controller binding[1] doesn't specify the
> properties that reference a PHY as required, the Linux driver
> requires[2] such a reference.
> 
> The clock situation is like on i.MX53: The USB controller is clocked
> from IMX5_CLK_USBOH3_GATE and the PHY from IMX5_CLK_USB_PHY1_GATE.
> 
> [1]: Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> [2]: Search for EINVAL in drivers/usb/chipidea/ci_hdrc_imx.c
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thanks.
