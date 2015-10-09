From: Shengjiu Wang <shengjiu.wang@freescale.com>
Subject: Re: [PATCH V2 1/2] clk: imx6: Add SPDIF_GCLK clock in clock tree
Date: Fri, 9 Oct 2015 17:15:30 +0800
Message-ID: <20151009091528.GA25804@shlinux2>
References: <cover.1442310569.git.shengjiu.wang@freescale.com>
 <113f1cecf1d83c6b96fd23ab9d7a73d1923e0d21.1442310569.git.shengjiu.wang@freescale.com>
 <20150923153340.GK3529@tiger> <20150924054321.GA32196@shlinux2>
 <20150924115737.GM3529@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150924115737.GM3529@tiger>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 04:57:37AM -0700, Shawn Guo wrote:
> On Thu, Sep 24, 2015 at 01:43:24PM +0800, Shengjiu Wang wrote:
> > On Wed, Sep 23, 2015 at 08:33:41AM -0700, Shawn Guo wrote:
> > > On Tue, Sep 15, 2015 at 06:01:01PM +0800, Shengjiu Wang wrote:
> > > > As spdif driver will register SPDIF clock to regmap, regmap will do
> > > > clk_prepare in init function, so SPDIF clock is prepared in probe, then its
> > > > root clock (pll clock) is prepared also, which cause the arm can't enter
> > > > low power mode.
> > > 
> > > Can you help me understand why ARM cannot enter low power mode when pll
> > > clock is prepared?
> > > 
> > > Shawn
> > Hi Shawn
> > 
> >    In i.mx clock framework, when pll clk is prepared, it will be powerup. when
> > enterring low power idle mode, the powerdown bit is checked, when pll is not
> > powerdown state, chip will not enter low power idle mode.
> 
> So this is not a SPDIF specific problem, and any device driver preparing
> its clock that is a child of pll clock will run into this problem,
> right?  If so, we should purchase a more generic solution than such
> device specific one.
> 
> Shawn
Hi shawn

SPDIF_GCLK is also spdif's clock, it use a same enable bit with SPDIF_ROOT_CLK,
We didn't separate them in clock tree before.

I can't find a generic solution. But anyway if there is a solution or not, I
think we'd better to separate them.

best regards
wang shengjiu
