From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/5] net: ethernet: stmmac: some fixes and optimization
Date: Thu, 3 Oct 2019 12:16:24 +0200
Message-ID: <7575369f-0f42-9afa-4212-bb82100a7a1b@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920053817.13754-1-christophe.roullier@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christophe Roullier <christophe.roullier@st.com>, robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Christophe

On 9/20/19 7:38 AM, Christophe Roullier wrote:
> Some improvements (manage syscfg as optional clock, update slew rate of
> ETH_MDIO pin, Enable gating of the MAC TX clock during TX low-power mode)
> Fix warning build message when W=1
> 
> Christophe Roullier (5):
>    net: ethernet: stmmac: Add support for syscfg clock
>    net: ethernet: stmmac: fix warning when w=1 option is used during
>      build
>    ARM: dts: stm32: remove syscfg clock on stm32mp157c ethernet
>    ARM: dts: stm32: adjust slew rate for Ethernet
>    ARM: dts: stm32: Enable gating of the MAC TX clock during TX low-power
>      mode on stm32mp157c
> 

DT patches will be applied on stm32-next after dwmac-stm32 patches merge 
in net-next.

>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi     |  9 +++-
>   arch/arm/boot/dts/stm32mp157c.dtsi            |  7 ++--
>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 42 ++++++++++++-------
>   3 files changed, 38 insertions(+), 20 deletions(-)
> 
