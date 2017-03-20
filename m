From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH 1/2] arc: axs10x: Add DT bindings for I2S audio playback
Date: Mon, 20 Mar 2017 14:02:00 +0000
Message-ID: <8b441b9d-bc26-091a-ac48-8594952759e8@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
 <1488481038.2684.14.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488481038.2684.14.camel@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vineet, Alexey, Rob,


On 02-03-2017 18:57, Alexey Brodkin wrote:
> Hi Jose,
>
> On Wed, 2017-02-22 at 18:19 +0000, Jose Abreu wrote:
>> This patch adds the necessary DT bindings to get HDMI audio
>> output in ARC AXS10x SDP. The bindings for I2S controller were
>> added as well as the bindings for simple audio card.
>>
>> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
>> Cc: Carlos Palminha <palminha@synopsys.com>
>> Cc: Alexey Brodkin <abrodkin@synopsys.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Vineet Gupta <vgupta@synopsys.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  arch/arc/boot/dts/axs10x_mb.dtsi | 22 ++++++++++++++++++----
>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
>> index d6c1bbc..9d882b1 100644
>> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
>> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
>> @@ -149,12 +149,13 @@
>>  			interrupts = <14>;
>>  		};
>>  
>> -		i2c@0x1e000 {
>> -			compatible = "snps,designware-i2c";
>> +		i2s: i2s@1e000 {
>> +			compatible = "snps,designware-i2s";
>>  			reg = <0x1e000 0x100>;
>> -			clock-frequency = <400000>;
>> -			clocks = <&i2cclk>;
>> +			clocks = <&i2sclk 0>;
>> +			clock-names = "i2sclk";
>>  			interrupts = <15>;
>> +			#sound-dai-cells = <0>;
>>  		};
>>  
>>  		i2c@0x1f000 {
>> @@ -174,6 +175,7 @@
>>  				adi,input-colorspace = "rgb";
>>  				adi,input-clock = "1x";
>>  				adi,clock-delay = <0x03>;
>> +				#sound-dai-cells = <0>;
>>  
>>  				ports {
>>  					#address-cells = <1>;
>> @@ -295,5 +297,17 @@
>>  				};
>>  			};
>>  		};
>> +
>> +		sound_playback {
>> +			compatible = "simple-audio-card";
>> +			simple-audio-card,name = "AXS10x HDMI Audio";
>> +			simple-audio-card,format = "i2s";
>> +			simple-audio-card,cpu {
>> +				sound-dai = <&i2s>;
>> +			};
>> +			simple-audio-card,codec {
>> +				sound-dai = <&adv7511>;
>> +			};
>> +		};
>>  	};
>>  };
> Just for the sake of history that's my mods to defconfig that allowed me
> to play .pcm via HDMI from axs103 board:
> -------------------------------->8-------------------------------
> diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
> index 30a3d4cf53d2..b11362a32e4e 100644
> --- a/arch/arc/configs/axs103_smp_defconfig
> +++ b/arch/arc/configs/axs103_smp_defconfig
> @@ -67,25 +67,29 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
>  CONFIG_MOUSE_SERIAL=y
>  CONFIG_MOUSE_SYNAPTICS_USB=y
>  # CONFIG_LEGACY_PTYS is not set
> -# CONFIG_DEVKMEM is not set
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  # CONFIG_HW_RANDOM is not set
> -CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  # CONFIG_HWMON is not set
> -CONFIG_DRM=m
> -CONFIG_DRM_I2C_ADV7511=m
> -CONFIG_DRM_ARCPGU=m
> -CONFIG_FB=y
> +CONFIG_DRM=y
> +CONFIG_DRM_I2C_ADV7511=y
> +CONFIG_DRM_I2C_ADV7511_AUDIO=y
> +CONFIG_DRM_ARCPGU=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_MONO is not set
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  # CONFIG_LOGO_LINUX_CLUT224 is not set
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +CONFIG_SND_SOC=y
> +CONFIG_SND_DESIGNWARE_I2S=y
> +CONFIG_SND_DESIGNWARE_PCM=y
> +CONFIG_SND_SIMPLE_CARD=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_USB_OHCI_HCD=y
> -------------------------------->8-------------------------------
>
> Anyways...
>
> Acked-by: Alexey Brodkin <abrodkin@synopsys.com>

Rob, can you please take a look at this patch and at 2/2?

Alexey, do you still maintain your ack in these patches? (I'm
asking because I remember you were having no video after patch
2/2 of this series). If so, Vineet, can you please pick this up
and patch 2/2 also?

Best regards,
Jose Miguel Abreu
