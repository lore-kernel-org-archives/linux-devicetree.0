From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 3/4] arm64: dts: imx8mq: Add opp-suspend property to
 OPP table
Date: Sat, 3 Aug 2019 10:12:10 +0200
Message-ID: <20190803081209.GB8870@X250.getinternet.no>
References: <20190709080015.43442-1-Anson.Huang@nxp.com>
 <20190709080015.43442-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190709080015.43442-3-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson.Huang@nxp.com
Cc: nm@ti.com, mark.rutland@arm.com, ping.bai@nxp.com, ccaione@baylibre.com, agx@sigxcpu.org, angus@akkea.ca, leonard.crestez@nxp.com, festevam@gmail.com, abel.vesa@nxp.com, andrew.smirnov@gmail.com, vireshk@kernel.org, Linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-pm@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2019 at 04:00:14PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add opp-suspend property to each OPP, the of opp core will
> select the OPP HW supported and with highest rate to be
> suspend opp, it will speed up the suspend/resume process.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
