From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] arc: axs10x: Add DT bindings for I2S audio playback
Date: Wed, 29 Mar 2017 14:38:03 +0100
Message-ID: <245dcd83-172b-0ea0-0e3b-b508c83f45fa@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
 <1488481038.2684.14.camel@synopsys.com>
 <8b441b9d-bc26-091a-ac48-8594952759e8@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8b441b9d-bc26-091a-ac48-8594952759e8-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vineet, Rob,


On 20-03-2017 14:02, Jose Abreu wrote:
> Hi Vineet, Alexey, Rob,
>
>
> On 02-03-2017 18:57, Alexey Brodkin wrote:
>> Hi Jose,
>>
>> On Wed, 2017-02-22 at 18:19 +0000, Jose Abreu wrote:
>>> This patch adds the necessary DT bindings to get HDMI audio
>>> output in ARC AXS10x SDP. The bindings for I2S controller were
>>> added as well as the bindings for simple audio card.
>>>
>>> Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> Cc: Carlos Palminha <palminha-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> Cc: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> ---
>>>  arch/arc/boot/dts/axs10x_mb.dtsi | 22 ++++++++++++++++++----
>>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
>>> index d6c1bbc..9d882b1 100644
>>> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
>>> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
>>> @@ -149,12 +149,13 @@
>>>  			interrupts = <14>;
>>>  		};
>>>  
>>> -		i2c@0x1e000 {
>>> -			compatible = "snps,designware-i2c";
>>> +		i2s: i2s@1e000 {
>>> +			compatible = "snps,designware-i2s";
>>>  			reg = <0x1e000 0x100>;
>>> -			clock-frequency = <400000>;
>>> -			clocks = <&i2cclk>;
>>> +			clocks = <&i2sclk 0>;
>>> +			clock-names = "i2sclk";
>>>  			interrupts = <15>;
>>> +			#sound-dai-cells = <0>;
>>>  		};
>>>  
>>>  		i2c@0x1f000 {
>>> @@ -174,6 +175,7 @@
>>>  				adi,input-colorspace = "rgb";
>>>  				adi,input-clock = "1x";
>>>  				adi,clock-delay = <0x03>;
>>> +				#sound-dai-cells = <0>;
>>>  
>>>  				ports {
>>>  					#address-cells = <1>;
>>> @@ -295,5 +297,17 @@
>>>  				};
>>>  			};
>>>  		};
>>> +
>>> +		sound_playback {
>>> +			compatible = "simple-audio-card";
>>> +			simple-audio-card,name = "AXS10x HDMI Audio";
>>> +			simple-audio-card,format = "i2s";
>>> +			simple-audio-card,cpu {
>>> +				sound-dai = <&i2s>;
>>> +			};
>>> +			simple-audio-card,codec {
>>> +				sound-dai = <&adv7511>;
>>> +			};
>>> +		};
>>>  	};
>>>  };
>> Just for the sake of history that's my mods to defconfig that allowed me
>> to play .pcm via HDMI from axs103 board:
>> -------------------------------->8-------------------------------
>> diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
>> index 30a3d4cf53d2..b11362a32e4e 100644
>> --- a/arch/arc/configs/axs103_smp_defconfig
>> +++ b/arch/arc/configs/axs103_smp_defconfig
>> @@ -67,25 +67,29 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
>>  CONFIG_MOUSE_SERIAL=y
>>  CONFIG_MOUSE_SYNAPTICS_USB=y
>>  # CONFIG_LEGACY_PTYS is not set
>> -# CONFIG_DEVKMEM is not set
>>  CONFIG_SERIAL_8250=y
>>  CONFIG_SERIAL_8250_CONSOLE=y
>>  CONFIG_SERIAL_8250_DW=y
>>  CONFIG_SERIAL_OF_PLATFORM=y
>>  # CONFIG_HW_RANDOM is not set
>> -CONFIG_I2C=y
>>  CONFIG_I2C_CHARDEV=y
>>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>>  # CONFIG_HWMON is not set
>> -CONFIG_DRM=m
>> -CONFIG_DRM_I2C_ADV7511=m
>> -CONFIG_DRM_ARCPGU=m
>> -CONFIG_FB=y
>> +CONFIG_DRM=y
>> +CONFIG_DRM_I2C_ADV7511=y
>> +CONFIG_DRM_I2C_ADV7511_AUDIO=y
>> +CONFIG_DRM_ARCPGU=y
>>  CONFIG_FRAMEBUFFER_CONSOLE=y
>>  CONFIG_LOGO=y
>>  # CONFIG_LOGO_LINUX_MONO is not set
>>  # CONFIG_LOGO_LINUX_VGA16 is not set
>>  # CONFIG_LOGO_LINUX_CLUT224 is not set
>> +CONFIG_SOUND=y
>> +CONFIG_SND=y
>> +CONFIG_SND_SOC=y
>> +CONFIG_SND_DESIGNWARE_I2S=y
>> +CONFIG_SND_DESIGNWARE_PCM=y
>> +CONFIG_SND_SIMPLE_CARD=y
>>  CONFIG_USB_EHCI_HCD=y
>>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>>  CONFIG_USB_OHCI_HCD=y
>> -------------------------------->8-------------------------------
>>
>> Anyways...
>>
>> Acked-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Rob, can you please take a look at this patch and at 2/2?
>
> Alexey, do you still maintain your ack in these patches? (I'm
> asking because I remember you were having no video after patch
> 2/2 of this series). If so, Vineet, can you please pick this up
> and patch 2/2 also?
>
> Best regards,
> Jose Miguel Abreu
>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=yaVFU4TjGY0gVF8El1uKcisy6TPsyCl9uN7Wsis-qhY&m=05dGD6sUxxlAGDQnPi7nAbNEBEAQb-u7BnZFDdL6TwI&s=NSYlH7VAuvW7bJx6m50UgCpZmyvijw__WBWmn39sh6Y&e= 

Gentle ping :)

Best regards,
Jose Miguel Abreu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
