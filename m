From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 08/10] ARM: shmobile: armadillo800eva dts: Use generic
 names for device nodes
Date: Mon, 27 Apr 2015 16:05:08 +0300
Message-ID: <553E3404.6020601@cogentembedded.com>
References: <1430139334-15272-1-git-send-email-geert+renesas@glider.be> <1430139334-15272-9-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430139334-15272-9-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04/27/2015 03:55 PM, Geert Uytterhoeven wrote:

> wm8978 -> codec

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> index 9bd0cb439f448d03..2e31d8c01cbf6a74 100644
> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> @@ -208,7 +208,7 @@
>   		gpios = <&pfc 166 GPIO_ACTIVE_LOW>;
>   	};
>
> -	wm8978: wm8978@1a {
> +	wm8978: codec@1a {

     Perhaps sound-codec?

[...]

WBR, Sergei

