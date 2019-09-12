Return-Path: <SRS0=Ug/d=XH=ti.com=t-kristo@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: am33xx: Update GPIO number as per
 datasheet
References: <20190912014849.10684-1-ankur.tyagi@gallagher.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <f3dae7f3-58ab-c55c-86c9-8633bd7a7d85@ti.com>
Date: Thu, 12 Sep 2019 10:35:41 +0300
MIME-Version: 1.0
In-Reply-To: <20190912014849.10684-1-ankur.tyagi@gallagher.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ankur Tyagi <ankur.tyagi@gallagher.com>, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/09/2019 04:48, Ankur Tyagi wrote:
> Sitara technical reference manual numbers GPIO from 0-3 whereas
> in code GPIO are numbered from 1-4.
> 

You are right that TRM states these are 0-3, but just to change the 
numbering at this point seems unnecessary churn for the minor 
inconvenience it causes. Also, I think we have similar indexing issues 
all over the place, should we fix them all? At least am4 has exact same 
indexing issue for gpios. They have been historically called 1-4 since 
introduction to linux kernel some 6 years already (as hwmod data). :)

Also, your patches cause bisect break points, try to apply this patch 
only to kernel and try to compile and see what happens.... and you don't 
touch the DT side for these either which causes another compile breakage.

So, from my side, NAK for both patches, I can't see why we should do 
such a small change and cause so many problems... not to mention the 
compile issues.

Do you have some specific reason why you want these changed?

-Tero

> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>   include/dt-bindings/clock/am3.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/am3.h b/include/dt-bindings/clock/am3.h
> index 894951541276..980fdc05c3d0 100644
> --- a/include/dt-bindings/clock/am3.h
> +++ b/include/dt-bindings/clock/am3.h
> @@ -41,9 +41,9 @@
>   #define AM3_RNG_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x90)
>   #define AM3_AES_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x94)
>   #define AM3_SHAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xa0)
> -#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
> -#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
> -#define AM3_GPIO4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
> +#define AM3_GPIO1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
> +#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
> +#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
>   #define AM3_TPCC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xbc)
>   #define AM3_D_CAN0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc0)
>   #define AM3_D_CAN1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc4)
> @@ -69,7 +69,7 @@
>   #define AM3_L4_WKUP_CLKCTRL_OFFSET	0x4
>   #define AM3_L4_WKUP_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_WKUP_CLKCTRL_OFFSET)
>   #define AM3_CONTROL_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x4)
> -#define AM3_GPIO1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
> +#define AM3_GPIO0_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
>   #define AM3_L4_WKUP_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc)
>   #define AM3_DEBUGSS_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x14)
>   #define AM3_WKUP_M3_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb0)
> @@ -121,9 +121,9 @@
>   #define AM3_L4LS_TIMER3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x84)
>   #define AM3_L4LS_TIMER4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x88)
>   #define AM3_L4LS_RNG_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x90)
> -#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
> -#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
> -#define AM3_L4LS_GPIO4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
> +#define AM3_L4LS_GPIO1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
> +#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
> +#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
>   #define AM3_L4LS_D_CAN0_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc0)
>   #define AM3_L4LS_D_CAN1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc4)
>   #define AM3_L4LS_EPWMSS1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xcc)
> @@ -184,7 +184,7 @@
>   
>   /* l4_wkup clocks */
>   #define AM3_L4_WKUP_CONTROL_CLKCTRL	AM3_CLKCTRL_INDEX(0x4)
> -#define AM3_L4_WKUP_GPIO1_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
> +#define AM3_L4_WKUP_GPIO0_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
>   #define AM3_L4_WKUP_L4_WKUP_CLKCTRL	AM3_CLKCTRL_INDEX(0xc)
>   #define AM3_L4_WKUP_UART1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb4)
>   #define AM3_L4_WKUP_I2C1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb8)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
