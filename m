From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH  7/8] ARM: dts: stm32: Add Ethernet support on stm32h7
 SOC and activate it for eval and disco boards
Date: Thu, 14 Feb 2019 14:44:14 +0100
Message-ID: <20190214134414.GB5699@lunn.ch>
References: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
 <1550126763-22669-8-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550126763-22669-8-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 07:46:02AM +0100, Christophe Roullier wrote:
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy1: ethernet-phy@1 {
> +			reg = <0>;
> +		};

The reg value should be the same as ethernet-phy@X.

    Andrew
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy1: ethernet-phy@1 {
> +			reg = <0>;
> +		};

Here as well.

     Andrew
