From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: net: Add Qualcomm ethqos binding
Date: Wed, 2 Jan 2019 20:07:07 +0530
Message-ID: <20190102143707.GN7581@vkoul-mobl>
References: <20190102091729.18582-1-vkoul@kernel.org>
 <20190102091729.18582-2-vkoul@kernel.org>
 <20190102140731.GI22737@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190102140731.GI22737@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02-01-19, 15:07, Andrew Lunn wrote:
> > +	mdio {
> > +		#address-cells = <0x1>;
> > +		#size-cells = <0x0>;
> > +		compatible = "snps,dwmac-mdio";
> > +		phy1: phy@1 {
> 
> phy@4 since reg = 0x4

Right, will fix this

-- 
~Vinod
