From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/2] Enable ADC support on STM32H7
Date: Thu, 27 Jul 2017 09:28:39 +0200
Message-ID: <d3ac7f0c-4164-769c-8f78-0bde425774bf@st.com>
References: <1499789590-13021-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499789590-13021-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice,

On 07/11/2017 06:13 PM, Fabrice Gasnier wrote:
> This patchset adds ADC device-tree nodes to STM32H7 SoC and
> enables ADC1 by default on stm32h743i-eval board.
> 
> Fabrice Gasnier (2):
>    ARM: dts: stm32: add ADC support on stm32h7
>    ARM: dts: stm32: enable ADC on stm32h743i-eval board
> 
>   arch/arm/boot/dts/stm32h743.dtsi      | 53 +++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32h743i-eval.dts | 18 ++++++++++++
>   2 files changed, 71 insertions(+)
> 
Series applied on stm32-dt-for-v4.14 branch.

Thanks
Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
