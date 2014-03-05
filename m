From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] dts: add support for MMC on socfpga boards
Date: Thu, 06 Mar 2014 01:30:36 +0300
Message-ID: <5317A58C.1080703@cogentembedded.com>
References: <20140305162350.GA3674@pollux.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140305162350.GA3674@pollux.denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, dinguyen@altera.com
List-Id: devicetree@vger.kernel.org

Hello.

On 03/05/2014 07:23 PM, Pavel Machek wrote:

> Add DTS binding for MMC on socfpga boards. Tested on Sockit.

> Signed-off-by: Pavel Machek <pavel@denx.de>

> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 537f1a5..cad7526 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -521,6 +521,23 @@
>   			reg-io-width = <4>;
>   		};
>
> +		mmc: dwmmc0@ff704000 {

    ePAPR standard [1] tells us in section 2.2.2:

The name of a node should be somewhat generic, reflecting the function of the 
device and not its 3 precise programming model.

     So, please name the node just "mmc@ff704000". You can choose whatever 
label you like.

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

WBR, Sergei
