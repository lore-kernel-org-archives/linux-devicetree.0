From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RESEND PATCH V2] ARM: dts: introduce the sama5d2 ptc ek board
Date: Fri, 8 Dec 2017 16:57:38 +0100
Message-ID: <20171208155738.GA15660@piout.net>
References: <20171206065844.27689-1-ludovic.desroches@microchip.com>
 <20171207082453.10593-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171207082453.10593-1-ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/12/2017 at 09:24:53 +0100, Ludovic Desroches wrote:
> Add the official SAMA5D2 Peripheral Touch Controller Evaluation
> Kit board.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> ---
> Resend: Put SPDX-License-Identifier at the beginning of the file.
> 
> Changes:
> - v2:
>   - remove memory node
>   - use SPDX-License-Identifier
> 
>  arch/arm/boot/dts/Makefile                |   1 +
>  arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts | 401 ++++++++++++++++++++++++++++++
>  2 files changed, 402 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
