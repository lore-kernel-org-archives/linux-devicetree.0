From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 13/16] arm64: dts: add LED nodes for hi6220-hikey
Date: Mon, 4 Apr 2016 00:16:50 -0500
Message-ID: <20160404051650.GT17806@rob-hp-laptop>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
 <1459589383-16914-14-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459589383-16914-14-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: xuwei5@hisilicon.com, mark.rutland@arm.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, arnd.bergmann@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kong.kongxinwei@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 02, 2016 at 05:29:40PM +0800, Guodong Xu wrote:
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 41 ++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index c4f560a..28bc646 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -63,6 +63,47 @@
>  			status = "ok";
>  		};
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		user_led4 {

Don't use underscores in node names: user-led4

> +			label = "user_led4";

We need to make sure the node names and labels are aligned with other 
boards. There's some discussion about this for the new db600 board.

This looks closer to what we should have than what we have for 
db410c currently.

Rob
