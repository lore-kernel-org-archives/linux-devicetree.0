From: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 12/15] ARM: dts: ipq4019: Add qcom-ipq4019-ap.dk07.1-c2
 board file
Date: Wed, 7 Feb 2018 09:30:52 +0530
Message-ID: <54429a54-764e-c834-7da7-f78be63d1427@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
 <1517202689-14212-13-git-send-email-sricharan@codeaurora.org>
 <033a420e14f090258e4c8f14b7ba89a7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <033a420e14f090258e4c8f14b7ba89a7-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

<snip ..>

>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2017, The Linux Foundation. All rights reserved.
>> +
>> +#include "qcom-ipq4019-ap.dk07.1.dtsi"
>> +
>> +/ {
>> +    model = "Qualcomm Technologies, Inc. IPQ40xx/AP-DK07.1-C2";
> 
>  s/IPQ40xx/IPQ4019
> 
 ok

>> +
>> +    soc {
>> +        pcie0: pci@40000000 {
>> +            status = "disabled";
>> +        };
> 
>  We can disable in base dtsi itself.
> 

 hmm, as mentioned in the previous patch, feels better to enable
 it only in the board file specifically and not to touch this here
 and the common dtsi.

>> +
>> +        pinctrl@1000000 {
>> +            serial_1_pins: serial1_pinmux {
>> +                mux {
>> +                    pins = "gpio8", "gpio9";
>> +                    function = "blsp_uart1";
>> +                    bias-disable;
>> +                };
>> +            };
>> +
>> +            spi_0_pins: spi_0_pinmux {
>> +                mux {
>> +                    pins = "gpio13", "gpio14",
>> "gpio15";
>> +                    function = "blsp_spi0";
>> +                    bias-disable;
>> +                };
>> +                cs1 {
>> +                    pins = "gpio12";
>> +                    function = "gpio";
>> +                };
>> +                host_int1 {
>> +                    pins = "gpio10";
>> +                    function = "gpio";
>> +                    input;
>> +                };
>> +                cs2 {
>> +                    pins = "gpio45";
>> +                    function = "gpio";
>> +                };
>> +                host_int2 {
>> +                    pins = "gpio61";
>> +                    function = "gpio";
>> +                    input;
>> +                };
>> +                rst {
>> +                    pins = "gpio36";
>> +                    function = "gpio";
>> +                    output-high;
>> +                };
> 
>  Normally spi pins should contains spi protocol related pins
>  could you please explain what is the role of host_pin and rst
>  pins and which driver will use these.
> 

 hmm, the additional pins were required for zigbee connected as the
 spidev device. So the right probably is to have the additional
 pins required for the device populated under the spi's child node.
 
>> +            };
>> +        };
>> +
>> +        serial@78b0000 {
>> +            pinctrl-0 = <&serial_1_pins>;
>> +            pinctrl-names = "default";
>> +            status = "ok";
>> +        };
>> +
>> +        spi_0: spi@78b5000 { /* BLSP1 QUP1 */
>> +            pinctrl-0 = <&spi_0_pins>;
>> +            pinctrl-names = "default";
>> +            status = "ok";
> 
>  From pinmux, it looks like multiple gpio based cs are being
>  used so do we need to specify cs-gpios like dk01-c2.
> 

 ok, let me check.

Regards,
 Sricharan


-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
