From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 2/8] ARM: dts: armada-38x: Utilize new DSA binding
Date: Tue, 03 Jan 2017 17:14:08 +0100
Message-ID: <87inpwf7e7.fsf@free-electrons.com>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
 <20170102022249.10657-3-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170102022249.10657-3-f.fainelli@gmail.com> (Florian Fainelli's
 message of "Sun, 1 Jan 2017 18:22:43 -0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Florian,

You should use the board name in the topic, ie:
"ARM: dts: armada-385-linksys: Utilize new DSA binding"

Thanks,

Gregory


 On lun., janv. 02 2017, Florian Fainelli <f.fainelli@gmail.com> wrote:

> Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net: dsa:
> Document new binding"). The legacy binding node is kept included, but is marked
> disabled.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm/boot/dts/armada-385-linksys.dtsi | 52 ++++++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
> index 8f0e508f64ae..20d5e8b00f2d 100644
> --- a/arch/arm/boot/dts/armada-385-linksys.dtsi
> +++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
> @@ -103,8 +103,56 @@
>  				};
>  			};
>  
> -			mdio {
> +			mdio@72004 {
>  				status = "okay";
> +
> +				switch@0 {
> +					compatible = "marvell,mv88e6095";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;
> +
> +					ports {
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						port@0 {
> +							reg = <0>;
> +							label = "lan4";
> +						};
> +
> +						port@1 {
> +							reg = <1>;
> +							label = "lan3";
> +						};
> +
> +						port@2 {
> +							reg = <2>;
> +							label = "lan2";
> +						};
> +
> +						port@3 {
> +							reg = <3>;
> +							label = "lan1";
> +						};
> +
> +						port@4 {
> +							reg = <4>;
> +							label = "wan";
> +						};
> +
> +						port@5 {
> +							reg = <5>;
> +							label = "cpu";
> +							ethernet = <&eth2>;
> +
> +							fixed-link {
> +								speed = <1000>;
> +								full-duplex;
> +							};
> +						};
> +					};
> +				};
>  			};
>  
>  			sata@a8000 {
> @@ -261,6 +309,8 @@
>  	};
>  
>  	dsa@0 {
> +		status = "disabled";
> +
>  		compatible = "marvell,dsa";
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> -- 
> 2.9.3
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
