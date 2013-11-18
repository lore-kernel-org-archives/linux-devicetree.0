From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: at91/dt: add ethernet phy to at91rm9200ek board
Date: Mon, 18 Nov 2013 09:39:23 +0100
Message-ID: <5289D23B.6090101@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com> <1377687819-10653-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377687819-10653-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/08/2013 13:03, Boris BREZILLON wrote:
> Add ethernet phy node in at91rm9200ek.dts.
> The reg register is not specified, as it may differ depending on the init
> process of the board:
> ADDR0/1 phy pins are connected to PA13/14 rm9200 pins. Which means the phy
> will take its address from these pins during the reset process.
>
> The macb driver will launch a full scan on the mdio bus to discover the phy
> address.
>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/at91rm9200ek.dts |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
> index d2d72c3..37b0880 100644
> --- a/arch/arm/boot/dts/at91rm9200ek.dts
> +++ b/arch/arm/boot/dts/at91rm9200ek.dts
> @@ -47,6 +47,11 @@
>   			macb0: ethernet@fffbc000 {
>   				phy-mode = "rmii";
>   				status = "okay";
> +
> +				phy0: ethernet-phy {
> +					interrupt-parent = <&pioC>;
> +					interrupts = <4 IRQ_TYPE_EDGE_FALLING>;

rm9200 pio controller does not support specific edge detection.
The line above should be replaced with:
				interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
or
				interrupts = <4 0>;

Nicolas, I know you were planning to push this patch for 3.14.
If you haven't done it yet (or if you changed your mind), I can send a 
new version including this fix.


> +				};
>   			};
>
>   			usb1: gadget@fffb0000 {
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
