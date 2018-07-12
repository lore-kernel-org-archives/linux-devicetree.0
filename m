From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sll: add gpio clocks
Date: Thu, 12 Jul 2018 10:52:04 +0800
Message-ID: <20180712025203.GQ6959@dragon>
References: <1529649154-5724-1-git-send-email-Anson.Huang@nxp.com>
 <1529649154-5724-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529649154-5724-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, aisheng.dong@nxp.com, ping.bai@nxp.com, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 22, 2018 at 02:32:34PM +0800, Anson Huang wrote:
> i.MX6SLL has GPIO clock gates in CCM CCGR, add
> clock property for GPIO driver to make sure all
> GPIO banks work as expected.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

I tried to create a topic branch for this patch with dependent clk
branch merged in.  But it turns out to be difficult and not worth the
effort, because too many imx6sll patches need to be moved out from
imx/dt branch, and some imx6sll changes are mixed with other SoCs.
Let's apply this in next cycle.  Ping me when 4.19-rc1 is available.

Shawn
