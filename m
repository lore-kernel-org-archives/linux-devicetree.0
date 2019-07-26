From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: fix -Wall W=1 compilation warnings for
 can1_sleep pinctrl
Date: Fri, 26 Jul 2019 18:27:01 +0200
Message-ID: <8cb628b9-dbbf-98d6-e09a-2ecc082315d4@st.com>
References: <1561972686-23281-1-git-send-email-erwan.leray@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1561972686-23281-1-git-send-email-erwan.leray@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Erwan Le Ray <erwan.leray@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, bich.hemon@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Erwan		

On 7/1/19 11:18 AM, Erwan Le Ray wrote:
> Fix compilations warnings detected by -Wall W=1 compilation option:
> - node has a unit name, but no reg property
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> index 140a983..ce98fd8 100644
> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> @@ -427,7 +427,7 @@
>   				};
>   			};
>   
> -			m_can1_sleep_pins_a: m_can1-sleep@0 {
> +			m_can1_sleep_pins_a: m_can1-sleep-0 {
>   				pins {
>   					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
>   						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
> 

Thanks for cleaning the STM32 DT. Applied on stm32-next. Note that I 
changed commit title to indicate which STM32 platform is targeted by 
this patch.

Regards
Alex
