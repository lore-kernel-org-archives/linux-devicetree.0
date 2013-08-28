From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Wed, 28 Aug 2013 23:49:12 +0400
Message-ID: <521E5438.90109@cogentembedded.com>
References: <20130828113459.48ecbb34@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828113459.48ecbb34@armhf>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hello.

On 08/28/2013 01:34 PM, Jean-Francois Moine wrote:

> This patch adds the nodes to instantiate the audio devices of the Dove
> boards.

> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
>   arch/arm/boot/dts/dove.dtsi                  | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index 499abad..78227e2 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -573,6 +573,24 @@
>   					phy-handle = <&ethphy>;
>   				};
>   			};
> +
> +			i2s0: audio-controller@b0000 {

     According to ePAPR [1] the node should be called "sound", not 
"audio-controller".

> +				compatible = "marvell,mvebu-audio";
> +				reg = <0xb0000 0x2210>;
> +				interrupts = <19>, <20>;
> +				clocks = <&gate_clk 12>;
> +				clock-names = "internal";
> +				status = "disabled";
> +			};
> +
> +			i2s1: audio-controller@b4000 {

    Same comment.

> +				compatible = "marvell,mvebu-audio";
> +				reg = <0xb4000 0x2210>;
> +				interrupts = <21>, <22>;
> +				clocks = <&gate_clk 13>;
> +				clock-names = "internal";
> +				status = "disabled";
> +			};

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

WBR, Sergei
