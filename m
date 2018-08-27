From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7s: remove snvs_poweroff node
Date: Mon, 27 Aug 2018 09:52:50 +0800
Message-ID: <20180827015249.GF29208@dragon>
References: <1533534005-18736-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1533534005-18736-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 06, 2018 at 01:40:05PM +0800, Anson Huang wrote:
> System poweroff is already supported by PSCI on i.MX7D,
> remove "snvs_poweroff" node to avoid below debug message
> from syscon-poweroff driver:
> 
> [    1.831414] syscon-poweroff 30370000.snvs:snvs-poweroff: pm_power_off already claimed (ptrval) psci_sys_poweroff
> [    1.841707] syscon-poweroff: probe of 30370000.snvs:snvs-poweroff failed with error -16
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
