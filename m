From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] clk: imx8mq: set correct parent for usb ctrl clocks
Date: Tue, 23 Jul 2019 13:53:52 +0800
Message-ID: <20190723055351.GP3738@dragon>
References: <20190710111917.6615-1-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190710111917.6615-1-jun.li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jun.li@nxp.com
Cc: mark.rutland@arm.com, peter.chen@nxp.com, agx@sigxcpu.org, ping.bai@nxp.com, Anson.Huang@nxp.com, ccaione@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de, angus@akkea.ca, linux-clk@vger.kernel.org, abel.vesa@nxp.com, andrew.smirnov@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 07:19:16PM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Per latest imx8mq datasheet of CCM, the parent of usb1_ctrl_root_clk
> and usb2_ctrl_root_clk is usb_bus.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Applied both, thanks.
