From: David Miller <davem@davemloft.net>
Subject: Re: [PATCHv4 5/6] net: stmmac: socfpga: Use shared System Manager
 driver
Date: Thu, 14 Feb 2019 13:56:14 -0800 (PST)
Message-ID: <20190214.135614.1795866372655163721.davem@davemloft.net>
References: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
        <1550177058-1860-6-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550177058-1860-6-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, olof@lixom.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: thor.thayer@linux.intel.com
Date: Thu, 14 Feb 2019 14:44:17 -0600

> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> The ARM64 System Manager requires a different method of reading
> the System Manager than ARM32. A new System Manager driver was
> created to steer ARM32 System Manager calls to regmap_mmio and
> ARM64 System Manager calls to the new access method.
> 
> Convert from syscon to the shared System Manager driver so that
> both ARM64 and ARM32 are supported.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>

Acked-by: David S. Miller <davem@davemloft.net>
