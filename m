From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCHv3 8/8] ARM: configs: stm32: Add RTC support in
 STM32 defconfig
Date: Mon, 16 Jan 2017 15:37:09 +0100
Message-ID: <0e58dc4b-e7d7-e327-6f8d-35253216a496@st.com>
References: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
 <1483623809-29937-9-git-send-email-amelie.delaunay@st.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDZK35H6VQBRBMFV6PBQKGQE2OCTKVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1483623809-29937-9-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Am=C3=A9lie,

On 01/05/2017 02:43 PM, Amelie Delaunay wrote:
> This patch adds STM32 RTC support in stm32_defconfig file.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/arm/configs/stm32_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_de=
fconfig
> index be19e09..0acff9e 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -57,6 +57,8 @@ CONFIG_LEDS_CLASS=3Dy
>  CONFIG_LEDS_GPIO=3Dy
>  CONFIG_LEDS_TRIGGERS=3Dy
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_STM32=3Dy
>  CONFIG_DMADEVICES=3Dy
>  CONFIG_STM32_DMA=3Dy
>  # CONFIG_FILE_LOCKING is not set
>
Applied on stm32-defconfig-for-v4.11

thanks
Alex

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
