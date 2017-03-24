From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 4/7] arm: dts: r7s72100: Add pin controller node
Date: Fri, 24 Mar 2017 18:32:47 +0300
Message-ID: <f9481bea-2e22-2b9c-e592-a0a843d3331e@cogentembedded.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1490368934-12494-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 03/24/2017 06:22 PM, Jacopo Mondi wrote:

> Add pin controller node with 12 gpio controller sub-nodes to
> r7s72100 dtsi.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 80 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index b8aa256..83e8f27 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -180,6 +180,86 @@
>  		};
>  	};
>
> +	pinctrl: pinctrl@fcfe3000 {

    I suggest to call it "pin-controller@...", no need to reduce.

[...]

MBR, Sergei
