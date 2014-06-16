From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] ARM: dts: berlin2q.dtsi: set L2CC tag and data latency
 as 2 cycles
Date: Mon, 16 Jun 2014 13:24:45 +0200
Message-ID: <539ED3FD.1090201@gmail.com>
References: <1402565920-5636-1-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402565920-5636-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, alexandre.belloni@free-electrons.com, antoine.tenart@free-electrons.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/12/2014 11:38 AM, Jisheng Zhang wrote:
> For all BG2Q SoCs, 2 cycles is the best/correct value
>
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Applied to berlin/dt with following fixed patch title:
   "ARM: dts: berlin2q: set L2CC tag and data latency to 2 cycles"

Thanks!

> ---
>   arch/arm/boot/dts/berlin2q.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index 635a16a..3f95dc5 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -90,6 +90,8 @@
>   			compatible = "arm,pl310-cache";
>   			reg = <0xac0000 0x1000>;
>   			cache-level = <2>;
> +			arm,data-latency = <2 2 2>;
> +			arm,tag-latency = <2 2 2>;
>   		};
>
>   		scu: snoop-control-unit@ad0000 {
>
