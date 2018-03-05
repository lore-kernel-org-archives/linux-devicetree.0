From: Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [PATCH] arm: dts: stih4xx: Add missing #sound-dai-cells
Date: Mon, 5 Mar 2018 10:37:17 +0000
Message-ID: <5fca2bc1-1f8e-1760-9e6a-802661af0f7e@st.com>
References: <20180301202537.30571-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180301202537.30571-4-robh@kernel.org>
Content-Language: en-US
Content-ID: <5C95063CF29AD84AAA686F292D6182DE@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "arm@kernel.org" <arm@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob

On 03/01/2018 09:25 PM, Rob Herring wrote:
> dtc now gives the following warnings:
> 
> arch/arm/boot/dts/stih410-b2120.dtb: Warning (sound_dai_property): /soc/sound/simple-audio-card,dai-link@0/codec: Missing property '#sound-dai-cells' in node /soc/sti-display-subsystem/sti-hdmi@8d04000 or bad phandle (referred from sound-dai[0])
> arch/arm/boot/dts/stih407-b2120.dtb: Warning (sound_dai_property): /soc/sound/simple-audio-card,dai-link@0/codec: Missing property '#sound-dai-cells' in node /soc/sti-display-subsystem/sti-hdmi@8d04000 or bad phandle (referred from sound-dai[0])
> arch/arm/boot/dts/stih410-b2260.dtb: Warning (sound_dai_property): /soc/sound/simple-audio-card,dai-link@0/codec: Missing property '#sound-dai-cells' in node /soc/sti-display-subsystem/sti-hdmi@8d04000 or bad phandle (referred from sound-dai[0])
> 
> Add the missing #sound-dai-cells property.
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   arch/arm/boot/dts/stih407.dtsi | 1 +
>   arch/arm/boot/dts/stih410.dtsi | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih407.dtsi
> index 11fdecd9312e..b592ecbe6420 100644
> --- a/arch/arm/boot/dts/stih407.dtsi
> +++ b/arch/arm/boot/dts/stih407.dtsi
> @@ -107,6 +107,7 @@
>   				compatible = "st,stih407-hdmi";
>   				reg = <0x8d04000 0x1000>;
>   				reg-names = "hdmi-reg";
> +				#sound-dai-cells = <0>;
>   				interrupts = <GIC_SPI 106 IRQ_TYPE_NONE>;
>   				interrupt-names	= "irq";
>   				clock-names = "pix",
> diff --git a/arch/arm/boot/dts/stih410.dtsi b/arch/arm/boot/dts/stih410.dtsi
> index 68b5ff91d6a7..4bcdbbb70a31 100644
> --- a/arch/arm/boot/dts/stih410.dtsi
> +++ b/arch/arm/boot/dts/stih410.dtsi
> @@ -198,6 +198,7 @@
>   				compatible = "st,stih407-hdmi";
>   				reg = <0x8d04000 0x1000>;
>   				reg-names = "hdmi-reg";
> +				#sound-dai-cells = <0>;
>   				interrupts = <GIC_SPI 106 IRQ_TYPE_NONE>;
>   				interrupt-names	= "irq";
>   				clock-names = "pix",
> 

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Will you take this patch in your remotes/Rob_Herring/dtc-update branch ?
Or I can add this patch to my next STi pull-request.

Let me know.

Thanks

Patrice
