From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6ull: update vdd_soc voltage for 900MHz
 operating point
Date: Tue, 25 Sep 2018 23:33:48 +0800
Message-ID: <20180925153345.GA22238@dragon>
References: <1536740009-32735-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536740009-32735-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 04:13:29PM +0800, Anson Huang wrote:
> Update VDD_SOC voltage to 1.25V for 900MHz operating point
> according to datasheet Rev. 1.3, 08/2018, 25mV is added to
> the minimum allowed values to cover power supply ripple.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
