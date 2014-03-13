From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: mvebu: Add the Core Divider clock to Armada
 38x SoCs
Date: Thu, 13 Mar 2014 23:55:29 +0300
Message-ID: <53221B41.2030001@cogentembedded.com>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar> <1394739542-30017-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394739542-30017-4-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 03/13/2014 10:38 PM, Ezequiel Garcia wrote:

> From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> The Armada 38x SoC family has a clock provider called "Core Divider",
> derived from the fixed 2 GHz main PLL clock. This is similar to the
> one on A370, A375 and AXP.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   arch/arm/boot/dts/armada-38x.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index 38fc3a0..76cc27e 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -337,6 +337,14 @@
>   				compatible = "marvell,orion-mdio";
>   				reg = <0x72004 0x4>;
>   			};
> +
> +			coredivclk: corediv-clock@e4250 {

    I would suggest naming the device just "clock@e4250" on the same grounds 
of having the generic device names.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
