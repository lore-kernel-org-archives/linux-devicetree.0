From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 1/4] stmmac: create of compatible mdio bus for
 stmacc driver
Date: Tue, 08 Dec 2015 21:37:42 -0500 (EST)
Message-ID: <20151208.213742.651430572988328138.davem@davemloft.net>
References: <1449625269-46078-2-git-send-email-preid@electromag.com.au>
	<201512091033.svvb9HL7%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <201512091033.svvb9HL7%fengguang.wu@intel.com>
Sender: netdev-owner@vger.kernel.org
To: lkp@intel.com
Cc: preid@electromag.com.au, kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, peppe.cavallaro@st.com, vbridger@opensource.altera.com, devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: kbuild test robot <lkp@intel.com>
Date: Wed, 9 Dec 2015 10:15:17 +0800

> Hi Phil,
> 
> [auto build test ERROR on net-next/master]
> [also build test ERROR on v4.4-rc4 next-20151208]
> 
> url:    https://github.com/0day-ci/linux/commits/Phil-Reid/stmmac-create-of-compatible-mdio-bus-for-stmacc-driver/20151209-094242
> config: x86_64-randconfig-b0-12090825 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c: In function 'stmmac_mdio_register':
>>> drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:226:17: error: 'struct stmmac_mdio_bus_data' has no member named 'reset_gpio'
>        mdio_bus_data->reset_gpio = -1;
>                     ^

Yeah this member is only visible when CONFIG_OF.
