From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun8i: Add dts for Orange Pi
 2 SBC
Date: Mon, 28 Mar 2016 14:36:31 +0200
Message-ID: <56F9254F.9040306@redhat.com>
References: <1458728225-6922-1-git-send-email-hdegoede@redhat.com>
 <20160325125342.2b4b6c9ec2e4922b51687ad3@free.fr>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBV6K4S3QKGQEHHI4IAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160325125342.2b4b6c9ec2e4922b51687ad3-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 25-03-16 12:53, Jean-Francois Moine wrote:
> On Wed, 23 Mar 2016 11:17:05 +0100
> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
>> The Orange Pi 2 is a SBC based on the Allwinner H3 SoC with a uSD slot,
>> 4 USB ports connected via a USB-2 hub, a 10/100M ethernet port using the
>> SoC's integrated PHY, Wifi via a RTL8189ETV sdio wifi chip, USB OTG, HDMI,
>> a TRRS headphone jack for stereo out and composite out, a microphone,
>> an IR receiver, a CSI connector, 2 LEDs, a 3 pin UART header
>> and a 40-pin GPIO header.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/Makefile                |   1 +
>>   arch/arm/boot/dts/sun8i-h3-orangepi-2.dts | 186 ++++++++++++++++++++++++++++++
>>   2 files changed, 187 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> 	[snip]
>> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
>> new file mode 100644
>> index 0000000..f93f5d1
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> 	[snip]
>> +&mmc0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
>> +	vmmc-supply = <&reg_vcc3v3>;
>> +	bus-width = <4>;
>> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
>> +	cd-inverted;
>> +	status = "okay";
>> +};
>> +
>> +&mmc1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc1_pins_a>;
>> +	vmmc-supply = <&reg_vcc3v3>;
>
> While still 3.3V, the power of the mmc1 if supplied by an other
> regulator.

I do not have schematics for the OPi 2, on the OPi plus schematic the
2 share a regulator. But even if it is another fixed 3.3V regulator,
there is little use in modelling it as a separate regulator when we
cannot control it.

Regards,

Hans
