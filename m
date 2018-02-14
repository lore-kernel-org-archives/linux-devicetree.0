From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 1/2] net: phy: dp83867: Add binding for the CLK_OUT
 pin muxing option
Date: Wed, 14 Feb 2018 15:33:57 -0500 (EST)
Message-ID: <20180214.153357.1060464426282681843.davem@davemloft.net>
References: <1518624432-15110-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518624432-15110-1-git-send-email-d.schultz@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: d.schultz@phytec.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, w.egorov@phytec.de
List-Id: devicetree@vger.kernel.org

From: Daniel Schultz <d.schultz@phytec.de>
Date: Wed, 14 Feb 2018 17:07:11 +0100

> From: Wadim Egorov <w.egorov@phytec.de>
> 
> The DP83867 has a muxing option for the CLK_OUT pin. It is possible
> to set CLK_OUT for different channels.
> Create a binding to select a specific clock for CLK_OUT pin.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
> Changes:
> 	v2:
> 	  Added check if clk_output_sel has a valid value
> 	  Only write the clock ouput register if a musing is desired
> 	v3:
> 	  -

Applied to net-next.
