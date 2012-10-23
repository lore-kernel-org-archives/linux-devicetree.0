From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: dt: evk-pro3: enable uart0 and uart2
Date: Tue, 23 Oct 2012 12:42:12 +0200
Message-ID: <20121023104212.GD18964@game.jcrosoft.org>
References: <1350986416-16246-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350986416-16246-1-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

	You will have to wait a few I prepare a patch series for pinctrl

	so most of the current drivers will support pinctrl and requere it

	this will availabe rc3 or rc4 max

	then I will merge more update and boards

Best Regards,
J.
On 12:00 Tue 23 Oct     , Fabio Porcedda wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/evk-pro3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/evk-pro3.dts b/arch/arm/boot/dts/evk-pro3.dts
> index ce959ee..96e50f5 100644
> --- a/arch/arm/boot/dts/evk-pro3.dts
> +++ b/arch/arm/boot/dts/evk-pro3.dts
> @@ -22,6 +22,14 @@
>  				status = "okay";
>  			};
>  
> +			usart0: serial@fffb0000 {
> +				status = "okay";
> +			};
> +
> +			usart2: serial@fffb8000 {
> +				status = "okay";
> +			};
> +
>  			usb1: gadget@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 5 0>;
>  				status = "okay";
> -- 
> 1.7.11.3
> 
