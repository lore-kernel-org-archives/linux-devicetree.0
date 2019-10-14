From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 1/3] arm64: dts: imx8mm-evk: Adjust i2c nodes
 following alphabetical sort
Date: Mon, 14 Oct 2019 21:16:59 +0800
Message-ID: <20191014131654.GW12262@dragon>
References: <1570497955-19481-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1570497955-19481-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, leonard.crestez@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2019 at 09:25:53AM +0800, Anson Huang wrote:
> The iomuxc node is being put at end of file because of its huge
> pinctrl data. I2C devices should be placed in alphabetical sort.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied all, thanks.
