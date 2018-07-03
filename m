From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] ARM: dts: imx6: correct anatop regulators range
Date: Tue, 3 Jul 2018 14:39:43 +0800
Message-ID: <20180703063942.GK4348@dragon>
References: <1530497076-15509-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530497076-15509-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, l.stach@pengutronix.de, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 02, 2018 at 10:04:36AM +0800, Anson Huang wrote:
> According to i.MX6 datasheet, the LDO_1P1's typical
> programming operating range is 1.0V to 1.2V, and
> the LDO_2P5's typical programming operating range
> is 2.25V to 2.75V, correct LDO_1P1 and LDO_2P5's
> regulator range settings for i.MX6 SoCs.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
