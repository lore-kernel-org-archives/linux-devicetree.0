From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/7] ARM: imx: add mmdc ipg clock operation for mmdc
Date: Mon, 10 Sep 2018 08:17:25 +0800
Message-ID: <20180910001722.GA21218@dragon>
References: <1535701998-20443-1-git-send-email-Anson.Huang@nxp.com>
 <1535701998-20443-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1535701998-20443-2-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: mark.rutland@arm.com, aisheng.dong@nxp.com, shengjiu.wang@nxp.com, ping.bai@nxp.com, devicetree@vger.kernel.org, sboyd@kernel.org, s.hauer@pengutronix.de, linux-clk@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, colin.didier@devialet.com, robh+dt@kernel.org, clement.peron@devialet.com, Linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, michael@amarulasolutions.com, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, matteo.lisi@engicam.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 31, 2018 at 03:53:12PM +0800, Anson Huang wrote:
> i.MX6 SoCs have MMDC ipg clock for registers access, to make
> sure MMDC registers access successfully, add optional clock
> enable for MMDC driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied this one, thanks.
