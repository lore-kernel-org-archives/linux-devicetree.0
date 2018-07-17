From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] ARM: dts: imx6sl-evk: add missing GPIO iomux setting
Date: Tue, 17 Jul 2018 14:48:16 +0800
Message-ID: <20180717064815.GL4576@dragon>
References: <1531533238-8816-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531533238-8816-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Sat, Jul 14, 2018 at 09:53:58AM +0800, Anson Huang wrote:
> On i.MX6SL EVK board, the MX6SL_PAD_KEY_ROW5 pin is
> used as lcd 3v3 regulator control pin, need to make
> sure MX6SL_PAD_KEY_ROW5 is muxed as GPIO function
> for controlling lcd 3v3 regulator.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
