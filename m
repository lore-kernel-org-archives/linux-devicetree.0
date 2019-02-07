From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clk: add G12A AO Clock and Reset Bindings
Date: Thu, 07 Feb 2019 21:10:50 +0100
Message-ID: <5C5C90CA.8050409@baylibre.com>
References: <20190204091331.9298-1-narmstrong@baylibre.com>      <20190204091331.9298-2-narmstrong@baylibre.com> <2f03298e4d1ca0aa08d683d6db14bc194607b974.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f03298e4d1ca0aa08d683d6db14bc194607b974.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Le 07/02/2019 16:10, Jerome Brunet a écrit :
> On Mon, 2019-02-04 at 10:13 +0100, Neil Armstrong wrote:
>> Add bindings for the Amlogic G12A AO Clock and Reset controllers.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../bindings/clock/amlogic,gxbb-aoclkc.txt    |  1 +
>>  include/dt-bindings/clock/g12a-aoclkc.h       | 43 +++++++++++++++++++
>>  include/dt-bindings/reset/g12a-aoclkc.h       | 18 ++++++++
>>  3 files changed, 62 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
>>  create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt 
>> b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
>> index 79511d7bb321..c41f0be5d438 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
>> @@ -10,6 +10,7 @@ Required Properties:
>>  	- GXL (S905X, S905D) : "amlogic,meson-gxl-aoclkc"
>>  	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
>>  	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
>> +	- G12A (S905X2, S905D2, S905Y2) : "amlogic,meson-g12a-aoclkc"
>>  	followed by the common "amlogic,meson-gx-aoclkc"
>>  - clocks: list of clock phandle, one for each entry clock-names.
>>  - clock-names: should contain the following:
>> diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-
>> bindings/clock/g12a-aoclkc.h
>> new file mode 100644
>> index 000000000000..997aca16c94f
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/g12a-aoclkc.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
>> +/*
>> + * Copyright (c) 2016 BayLibre, SAS
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + *
>> + * Copyright (c) 2018 Amlogic, inc.
>> + * Author: Qiufang Dai <qiufang.dai@amlogic.com>
>> + */
>> +
>> +#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
>> +#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
>> +
>> +#define CLKID_AO_AHB		0
>> +#define CLKID_AO_IR_IN		1
>> +#define CLKID_AO_I2C_M0		2
>> +#define CLKID_AO_I2C_S0		3
>> +#define CLKID_AO_UART		4
>> +#define CLKID_AO_PROD_I2C	5
>> +#define CLKID_AO_UART2		6
>> +#define CLKID_AO_IR_OUT		7
>> +#define CLKID_AO_SAR_ADC	8
>> +#define CLKID_AO_MAILBOX	9
>> +#define CLKID_AO_M3		10
>> +#define CLKID_AO_AHB_SRAM	11
>> +#define CLKID_AO_RTI		12
>> +#define CLKID_AO_M4_FCLK	13
>> +#define CLKID_AO_M4_HCLK	14
>> +#define CLKID_AO_CLK81		15
>> +#define CLKID_AO_SAR_ADC_SEL	16
>> +#define CLKID_AO_SAR_ADC_DIV	17
> 
> Do we need to export the internal part of these composite clock ?
> I know the other AO controller do it but it would be nice to avoid it, like
> for the EE controllers ... unless there is good reason of course.

Historically, we exposed everything for the AO controller,
we can follow the same scheme as the EE controller starting
from this one.
There is no strong reason to expose everything...

I'll res-pin a v2 with both issues fixed.

> 
> Same for the others below.
> 
>> +#define CLKID_AO_SAR_ADC_CLK	18
>> +#define CLKID_AO_CTS_OSCIN	19
>> +#define CLKID_AO_32K_PRE	20
>> +#define CLKID_AO_32K_DIV	21
>> +#define CLKID_AO_32K_SEL	22
>> +#define CLKID_AO_32K		23
>> +#define CLKID_AO_CEC_PRE	24
>> +#define CLKID_AO_CEC_DIV	25
>> +#define CLKID_AO_CEC_SEL	26
>> +#define CLKID_AO_CEC		27
>> +#define CLKID_AO_CTS_RTC_OSCIN	28
>> +
>> +#endif
>> diff --git a/include/dt-bindings/reset/g12a-aoclkc.h b/include/dt-
>> bindings/reset/g12a-aoclkc.h
>> new file mode 100644
>> index 000000000000..bd2e2337135c
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/g12a-aoclkc.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
>> +/*
>> + * Copyright (c) 2016 BayLibre, SAS
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + */
>> +
>> +#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_G12A_AOCLK
>> +#define DT_BINDINGS_RESET_AMLOGIC_MESON_G12A_AOCLK
>> +
>> +#define RESET_AO_IR_IN		0
>> +#define RESET_AO_UART		1
>> +#define RESET_AO_I2C_M		2
>> +#define RESET_AO_I2C_S		3
>> +#define RESET_AO_SAR_ADC	4
>> +#define RESET_AO_UART2		5
>> +#define RESET_AO_IR_OUT		6
>> +
>> +#endif
> 
> 
