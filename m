From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: update rtc st,syscfg property on
 stm32h743
Date: Thu, 20 Sep 2018 14:53:38 +0200
Message-ID: <b7cadb6f-d17f-3be7-38f4-1104026ea745@st.com>
References: <1534931139-19817-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534931139-19817-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie

On 08/22/2018 11:45 AM, Amelie Delaunay wrote:
> To fit with latest rtc driver updates, rtc st,syscfg property must contain
> the control register offset of pwrcfg and the mask corresponding to the
> DBP (Disable Backup Protection) bit.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>   arch/arm/boot/dts/stm32h743.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 637beff..cbdd69c 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -472,7 +472,7 @@
>   			interrupt-parent = <&exti>;
>   			interrupts = <17 IRQ_TYPE_EDGE_RISING>;
>   			interrupt-names = "alarm";
> -			st,syscfg = <&pwrcfg>;
> +			st,syscfg = <&pwrcfg 0x00 0x100>;
>   			status = "disabled";
>   		};
>   
> 

Applied on stm32-next.

Thanks.
Alex
