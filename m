From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] ARM: imx_v6_v7_defconfig: select CONFIG_ARM_CPUIDLE
 by default
Date: Mon, 3 Sep 2018 09:17:38 +0800
Message-ID: <20180903011737.GA3850@dragon>
References: <1535518847-24417-1-git-send-email-Anson.Huang@nxp.com>
 <1535518847-24417-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535518847-24417-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 01:00:47PM +0800, Anson Huang wrote:
> Some i.MX platforms like i.MX7S/D uses generic ARM cpuidle
> driver and psci method to support cpuidle feature, select
> CONFIG_ARM_CPUIDLE by default for such platforms.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
