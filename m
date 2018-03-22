From: David Miller <davem@davemloft.net>
Subject: Re: [RFC PATCH] net: stmmac: dwmac-sun8i: sun8i_syscon_reg_field
 can be static
Date: Thu, 22 Mar 2018 15:07:46 -0400 (EDT)
Message-ID: <20180322.150746.1491738155292875468.davem@davemloft.net>
References: <20180317092857.4396-7-wens@csie.org>
 <20180322074217.GA7358@ivytown2.lkp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180322074217.GA7358@ivytown2.lkp.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lkp@intel.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, maxime.ripard@bootlin.com, netdev@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, broonie@kernel.org, kbuild-all@01.org, clabbe.montjoie@gmail.com, peppe.cavallaro@st.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org

From: kbuild test robot <lkp@intel.com>
Date: Thu, 22 Mar 2018 15:42:18 +0800

> 
> Fixes: e3c10deef23c ("net: stmmac: dwmac-sun8i: Use regmap_field for syscon register access")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>

This commit ID and this symbol are both not present in any of my trees.

Please avoid using SHA1 IDs which don't actually exist in an upstream
tree.  When I see a "Fixes: " tag like this, I expect that it is for a
change in my tree.
