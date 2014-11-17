From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8 10/13] ARM: dts: berlin: add BG2Q nodes for USB support
Date: Mon, 17 Nov 2014 21:26:25 +0300
Message-ID: <546A3DD1.8020209@cogentembedded.com>
References: <1416231347-27193-1-git-send-email-antoine.tenart@free-electrons.com> <1416231347-27193-11-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416231347-27193-11-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/17/2014 04:35 PM, Antoine Tenart wrote:

> Adds nodes describing the Marvell Berlin BG2Q USB PHY and USB. The BG2Q
> SoC has 3 USB host controller, compatible with ChipIdea.

> Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   arch/arm/boot/dts/berlin2q.dtsi | 55 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)

> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index 2de8d6f8973c..834142bdfbb1 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
[...]
> @@ -457,5 +511,6 @@
>   				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>   			};
>   		};
> +

    Random whitespace change?

>   	};
>   };
>

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
