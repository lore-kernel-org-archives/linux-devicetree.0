From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH V4 0/8] net: ethernet: stmmac: add support for stm32mp1
Date: Thu, 24 May 2018 09:22:48 +0200
Message-ID: <d04d3859-0b0c-5328-82b3-23591021b62a@st.com>
References: <1527090479-5263-1-git-send-email-christophe.roullier@st.com>
 <20180523.160811.1425159248399846750.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180523.160811.1425159248399846750.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, christophe.roullier@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 05/23/2018 10:08 PM, David Miller wrote:
> From: Christophe Roullier <christophe.roullier@st.com>
> Date: Wed, 23 May 2018 17:47:51 +0200
> 
>> Patches to have Ethernet support on stm32mp1
>> Changelog:
>> Remark from Rob Herring
>> Move Documentation/devicetree/bindings/arm/stm32.txt in
>> Documentation/devicetree/bindings/arm/stm32/stm32.txt and create
>> Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
>>
>> Replace also in arch/arm/boot/dts/stm32mp157c.dtsi, syscfg: system-config@50020000
>> with syscfg: syscon@50020000syscfg: system-config@50020000
> 
> Probably the DTS file updates need to go in via the ARM tree, not
> mine.

Yes I will take them in my tree

> 
> Can you respin a net-next targetted series that has just the driver
> code and device tree binding updates?
> 
> Thank you!
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
