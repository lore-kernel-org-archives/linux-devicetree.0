From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/7] dt-bindings: net: Add Qualcomm ethqos binding
Date: Wed, 2 Jan 2019 15:07:31 +0100
Message-ID: <20190102140731.GI22737@lunn.ch>
References: <20190102091729.18582-1-vkoul@kernel.org>
 <20190102091729.18582-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190102091729.18582-2-vkoul@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +	mdio {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy1: phy@1 {

phy@4 since reg = 0x4

> +			device_type = "ethernet-phy";
> +			reg = <0x4>;

Thanks,
	Andrew
