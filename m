From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: Re: [PATCH] ARM: dts: rockchip: add ethernet phy node for tinker board
Date: Sun, 23 Jun 2019 22:31:29 +0900
Message-ID: <8a006d47-a546-163f-0c3f-f35b0056ba3a@katsuster.net>
References: <20190621180017.29646-1-katsuhiro@katsuster.net>
 <1871177.hjLhdHVgcu@phil>
 <ccf5ad2c-bd56-2d77-4728-d7906045e302@katsuster.net>
 <20190622175508.GE8497@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190622175508.GE8497@lunn.ch>
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
To: Andrew Lunn <andrew@lunn.ch>, Jose Abreu <joabreu@synopsys.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Heiko, Andrew,

Thank you for comments. I found the commit that has regression:
   74371272f97f net: stmmac: Convert to phylink and remove phylib logic

So I'll report it to netdev and stmmac guys.

Best Regards,
---
Katsuhiro Suzuki


On 2019/06/23 2:55, Andrew Lunn wrote:
> On Sat, Jun 22, 2019 at 11:50:10PM +0900, Katsuhiro Suzuki wrote:
>> Hello,
> 
> Hi Katsuhiro
> 
> Please also report this to netdev, and the stmmac maintainers.
> 
> ./scripts/get_maintainer.pl -f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> Giuseppe Cavallaro <peppe.cavallaro@st.com> (supporter:STMMAC ETHERNET DRIVER)
> Alexandre Torgue <alexandre.torgue@st.com> (supporter:STMMAC ETHERNET DRIVER)
> Jose Abreu <joabreu@synopsys.com> (supporter:STMMAC ETHERNET DRIVER)
> "David S. Miller" <davem@davemloft.net> (odd fixer:NETWORKING DRIVERS)
> Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
> netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
> linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
> linux-kernel@vger.kernel.org (open list)
> 
>> I have not bisect commit of root cause yet... Is it better to bisect
>> and find problem instead of sending this patch?
> 
> My guess is that it is one of these three which broken it:
> 
> 74371272f97f net: stmmac: Convert to phylink and remove phylib logic
> eeef2f6b9f6e net: stmmac: Start adding phylink support
> 9ad372fc5aaf net: stmmac: Prepare to convert to phylink
> 
> 	     Andrew
> 
