From: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add initial support for cm-fx6
Date: Sun, 27 Oct 2013 16:24:08 +0200
Message-ID: <526D2208.9020404@compulab.co.il>
References: <1381848564-29839-1-git-send-email-valentin@compulab.co.il> <20131021050610.GA9716@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131021050610.GA9716-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/21/2013 08:06 AM, Shawn Guo wrote:
> On Tue, Oct 15, 2013 at 05:49:24PM +0300, Valentin Raevsky wrote:
>> Add initial support for cm-fx6 module.
>>
>> cm-fx6 is a module based on mx6q SoC with the following features:
>> - Up to 4GB of DDR3
>> - 1 LCD/DVI output port
>> - 1 HDMI output port
>> - 2 LVDS LCD ports
>> - Gigabit Ethernet
>> - Analog Audio
>> - CAN
>> - SATA
>> - NAND
>> - PCIE
>>
>> This patch allows to boot up the module, configures the serial console,
>> the Ethernet adapter and the hearbeat led.
>>
>> Signed-off-by: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/cm-fx6.dts |   51 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/cm-fx6.dts
>
> Please name the file with 'imx6q-' prefix, and add dtb target into
> arch/arm/boot/dts/Makefile.

thatnks, got it. will be in v2.

>
>>
>> diff --git a/arch/arm/boot/dts/cm-fx6.dts b/arch/arm/boot/dts/cm-fx6.dts
>> new file mode 100644
>> index 0000000..1080215
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/cm-fx6.dts
>> @@ -0,0 +1,51 @@
>> +/*
>> + * Copyright 2013 CompuLab Ltd.
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>> +
>> +/dts-v1/;
>> +#include "imx6q.dtsi"
>> +
>> +/ {
>> +	model = "CompuLab CM-FX6";
>> +	compatible = "compulab,cm-fx6", "fsl,imx6q";
>> +
>> +	memory {
>> +		reg = <0x10000000 0x80000000>;
>> +	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		debug-led {
>> +			label = "Heartbeat";
>> +			gpios = <&gpio2 31 0>;
>> +			linux,default-trigger = "heartbeat";
>> +		};
>> +	};
>> +};
>> +
>> +&gpmi {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
>> +	status = "okay";
>> +};
>> +
>> +&fec {
>
> Please sort the nodes alphabetically in label names.

got it. will be in v2.

>
> Shawn
>
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_enet_1>;
>> +	phy-mode = "rgmii";
>> +	status = "okay";
>> +};
>> +
>> +&uart4 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_uart4_1>;
>> +	status = "okay";
>> +};
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
