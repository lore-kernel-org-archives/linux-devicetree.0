From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/6] arm64: dts: fsl: ls1028a: Add Felix switch
 port DT node
Date: Fri, 21 Jun 2019 18:49:40 +0200
Message-ID: <20190621164940.GL31306@lunn.ch>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
 <1561131532-14860-5-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561131532-14860-5-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, netdev@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, Allan Nielsen <Allan.Nielsen@microsemi.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 06:38:50PM +0300, Claudiu Manoil wrote:
> The switch device features 6 ports, 4 with external links
> and 2 internally facing to the ls1028a SoC and connected via
> fixed links to 2 internal enetc ethernet controller ports.

Hi Claudiu

> +			switch@0,5 {
> +				compatible = "mscc,felix-switch";
> +				reg = <0x000500 0 0 0 0>;
> +
> +				ethernet-ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					/* external ports */
> +					switch_port0: port@0 {
> +						reg = <0>;
> +					};
> +					switch_port1: port@1 {
> +						reg = <1>;
> +					};
> +					switch_port2: port@2 {
> +						reg = <2>;
> +					};
> +					switch_port3: port@3 {
> +						reg = <3>;
> +					};
> +					/* internal to-cpu ports */
> +					port@4 {
> +						reg = <4>;
> +						fixed-link {
> +							speed = <1000>;
> +							full-duplex;
> +						};
> +					};
> +					port@5 {
> +						reg = <5>;
> +						fixed-link {
> +							speed = <1000>;
> +							full-duplex;
> +						};
> +					};
> +				};
> +			};

This sounds like a DSA setup, where you have SoC ports connected to
the switch. With DSA, the CPU ports of the switch are special. We
don't create netdev's for them, the binding explicitly list which SoC
interface they are bound to, etc.

What model are you using here? I'm just trying to understand the setup
to ensure it is consistent with the swichdev model.

   Thanks
	Andrew
