From: Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [PATCH 2/8] net: ethernet: stmmac: update to support all PHY
 config for stm32mp157c.
Date: Thu, 14 Feb 2019 14:48:32 +0000
Message-ID: <04801425-ae14-3bfe-4eaf-2f3d552093cb@st.com>
References: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
 <1550126763-22669-3-git-send-email-christophe.roullier@st.com>
 <20190214134040.GA5699@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190214134040.GA5699@lunn.ch>
Content-Language: en-US
Content-ID: <DAE59BFA02BDE64A9D0E85A4A9EF177E@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh@kernel.org" <robh@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2/14/19 2:40 PM, Andrew Lunn wrote:
>   On Thu, Feb 14, 2019 at 07:45:57AM +0100, Christophe Roullier wrote:
>> @@ -131,19 +185,19 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>>   	case PHY_INTERFACE_MODE_RGMII:
>>   		val = SYSCFG_PMCR_ETH_SEL_RGMII;
>> -		if (dwmac->int_phyclk)
>> +		if (dwmac->eth_clk_sel_reg)
>>   			val |= SYSCFG_PMCR_ETH_CLK_SEL;
>>   		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
>>   		break;
> 
> Hi Christophe
> 
> This code should handle all 4 PHY_INTERFACE_MODE_RGMII* values.
> 
>       Andrew
> 

Hi Andrew,

For RGMII we are supporting 3 modes:
    - normal mode (with PHY with quartz)
    - Phy wo crystal and phy is clocking with PLL to 25Mhz.
    - other mode where we used PLL from RCC (125Mhz) to clock Ethernet 
IP (save one pin "ETH_CK125")

In driver source code I put table to sum-up all configs supported for 
each phy mode:
+ * Below table summarizes the clock requirement and clock sources for
+ * supported phy interface modes.
+ * 
__________________________________________________________________________
+ *|PHY_MODE | Normal | PHY wo crystal|   PHY wo crystal   |No 125Mhz 
from PHY|
+ *|         |        |      25MHz    |        50MHz       | 
      |
+ * 
---------------------------------------------------------------------------
+ *|  MII    |	 -   |     eth-ck    |	      n/a	  |	  n/a        |
+ *|         |        |		     |                    |		     |
+ * 
---------------------------------------------------------------------------
+ *|  GMII   |	 -   |     eth-ck    |	      n/a	  |	  n/a        |
+ *|         |        |               |                    |		     |
+ * 
---------------------------------------------------------------------------
+ *| RGMII   |	 -   |     eth-ck    |	      n/a	  |  eth-ck (no pin) |
+ *|         |        |               |                    | 
st,eth_clk_sel  |
+ * 
---------------------------------------------------------------------------
+ *| RMII    |	 -   |     eth-ck    |	    eth-ck        |	  n/a        |
+ *|         |        |		     | st,eth_ref_clk_sel |		     |
+ * 
---------------------------------------------------------------------------

Regards,

Christophe
