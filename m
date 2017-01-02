From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/8] ARM: dts: armada-388-clearfog: Utilize new DSA
 binding
Date: Mon, 2 Jan 2017 09:59:24 +0100
Message-ID: <0997385a-700c-bbcc-4194-77f641885cbd@baylibre.com>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
 <20170102022249.10657-4-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170102022249.10657-4-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 01/02/2017 03:22 AM, Florian Fainelli wrote:
> Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net:
> dsa: Document new binding"). The legacy binding node is kept included, but is
> marked disabled.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm/boot/dts/armada-388-clearfog.dts | 65 +++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
> index 71ce201c903e..35207aa1f4ec 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dts
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dts
> @@ -351,6 +351,8 @@
>  	};
>  
>  	dsa@0 {
> +		status = "okay";

I think you wanted "disabled" here !

> +
>  		compatible = "marvell,dsa";
>  		dsa,ethernet = <&eth1>;
>  		dsa,mii-bus = <&mdio>;
> @@ -444,3 +446,66 @@
>  		status = "disabled";
>  	};
>  };
[...]

Neil
