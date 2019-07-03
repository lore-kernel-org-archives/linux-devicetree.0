From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Wed, 3 Jul 2019 22:22:32 +0200
Message-ID: <f25dedfc-d961-f278-3e55-9f0574557f84@gmail.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-6-mka@chromium.org>
 <e7fa2c8c-d53e-2480-d239-e2c0b362dc4f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e7fa2c8c-d53e-2480-d239-e2c0b362dc4f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 03.07.2019 22:13, Heiner Kallweit wrote:
> On 03.07.2019 21:37, Matthias Kaehlcke wrote:
>> The LED behavior of some Realtek PHYs is configurable. Add the
>> property 'realtek,led-modes' to specify the configuration of the
>> LEDs.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Changes in v2:
>> - patch added to the series
>> ---
>>  .../devicetree/bindings/net/realtek.txt         |  9 +++++++++
>>  include/dt-bindings/net/realtek.h               | 17 +++++++++++++++++
>>  2 files changed, 26 insertions(+)
>>  create mode 100644 include/dt-bindings/net/realtek.h
>>
>> diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
>> index 71d386c78269..40b0d6f9ee21 100644
>> --- a/Documentation/devicetree/bindings/net/realtek.txt
>> +++ b/Documentation/devicetree/bindings/net/realtek.txt
>> @@ -9,6 +9,12 @@ Optional properties:
>>  
>>  	SSC is only available on some Realtek PHYs (e.g. RTL8211E).
>>  
>> +- realtek,led-modes: LED mode configuration.
>> +
>> +	A 0..3 element vector, with each element configuring the operating
>> +	mode of an LED. Omitted LEDs are turned off. Allowed values are
>> +	defined in "include/dt-bindings/net/realtek.h".
>> +
>>  Example:
>>  
>>  mdio0 {
>> @@ -20,5 +26,8 @@ mdio0 {
>>  		reg = <1>;
>>  		realtek,eee-led-mode-disable;
>>  		realtek,enable-ssc;
>> +		realtek,led-modes = <RTL8211E_LINK_ACTIVITY
>> +				     RTL8211E_LINK_100
>> +				     RTL8211E_LINK_1000>;
>>  	};
>>  };
>> diff --git a/include/dt-bindings/net/realtek.h b/include/dt-bindings/net/realtek.h
>> new file mode 100644
>> index 000000000000..8d64f58d58f8
>> --- /dev/null
>> +++ b/include/dt-bindings/net/realtek.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _DT_BINDINGS_REALTEK_H
>> +#define _DT_BINDINGS_REALTEK_H
>> +
>> +/* LED modes for RTL8211E PHY */
>> +
>> +#define RTL8211E_LINK_10		1
>> +#define RTL8211E_LINK_100		2
>> +#define RTL8211E_LINK_1000		4
>> +#define RTL8211E_LINK_10_100		3
>> +#define RTL8211E_LINK_10_1000		5
>> +#define RTL8211E_LINK_100_1000		6
>> +#define RTL8211E_LINK_10_100_1000	7
>> +
>> +#define RTL8211E_LINK_ACTIVITY		(1 << 16)
> 
> I don't see where this is used.
> 
Clear now, disregard my comment.

>> +
>> +#endif
>>
> 
