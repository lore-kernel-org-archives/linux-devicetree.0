From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx6ul: ccimx6ulsom: Add support for
 wireless SOM variant
Date: Fri, 16 Nov 2018 10:52:31 +0800
Message-ID: <20181116025230.GF5829@dragon>
References: <1541414622-18795-1-git-send-email-alex.gonzalez@digi.com>
 <1541414622-18795-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541414622-18795-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Gonzalez <alex.gonzalez@digi.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2018 at 11:43:42AM +0100, Alex Gonzalez wrote:
> The wireless variants of the ConnecCore 6UL SOM include a Qualcomm
> QCA6564 wireless chip with dual WiFi and Bluetooth.
> 
> Both the ConnectCore 6UL SBC Express and Pro boards fit a wireless SOM.
> 
> The Wifi is connected through the SDIO interface on usdhc1 and the
> Bluetooth is connected via uart1.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>

Applied, thanks.
