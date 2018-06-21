From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH V3 1/3] watchdog: stm32: add pclk feature for stm32mp1
Date: Thu, 21 Jun 2018 09:25:18 +0200
Message-ID: <618bcde6-0a41-9341-c55c-6e1d0ee8e51d@st.com>
References: <1529502698-13263-1-git-send-email-ludovic.Barre@st.com>
 <1529502698-13263-2-git-send-email-ludovic.Barre@st.com>
 <20180620191409.GA29934@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620191409.GA29934@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org



On 06/20/2018 09:14 PM, Rob Herring wrote:
> On Wed, Jun 20, 2018 at 03:51:36PM +0200, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> This patch adds config data to manage specific properties by
>> compatible. Adds stm32mp1 config which requires pclk clock.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>> ---
>>   .../devicetree/bindings/watchdog/st,stm32-iwdg.txt |  21 +++-
> 
> Please split bindings to separate patch.

OK

> 
>>   drivers/watchdog/stm32_iwdg.c                      | 116 +++++++++++++--------
>>   2 files changed, 91 insertions(+), 46 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>> index cc13b10a..f07f6d89 100644
>> --- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>> @@ -2,18 +2,31 @@ STM32 Independent WatchDoG (IWDG)
>>   ---------------------------------
>>   
>>   Required properties:
>> -- compatible: "st,stm32-iwdg"
>> -- reg: physical base address and length of the registers set for the device
>> -- clocks: must contain a single entry describing the clock input
>> +- compatible: Should be either "st,stm32-iwdg" or "st,stm32mp1-iwdg"
> 
> Please format one per line.

OK

> 
>> +- reg: Physical base address and length of the registers set for the device
>> +- clocks: Reference to the clock entry lsi. Additional pclk clock entry
>> +  is required only for st,stm32mp1-iwdg.
>> +- clock-names: Name of the clocks used.
>> +  "lsi" for st,stm32-iwdg
>> +  "pclk", "lsi" for st,stm32mp1-iwdg
> 
> Put lsi 1st so it is always index 0.

OK

> 
>>   
>>   Optional Properties:
>>   - timeout-sec: Watchdog timeout value in seconds.
>>   
>> -Example:
>> +Examples:
>>   
>>   iwdg: watchdog@40003000 {
>>   	compatible = "st,stm32-iwdg";
>>   	reg = <0x40003000 0x400>;
>>   	clocks = <&clk_lsi>;
>> +	clock-names = "lsi";
>> +	timeout-sec = <32>;
>> +};
>> +
>> +iwdg: iwdg@5a002000 {
> 
> watchdog@...

sorry, I forget this occurrence.

> 
> Do we really need 2 example just to show 2 clocks?

No, I could keep only one

> 
>> +	compatible = "st,stm32mp1-iwdg";
>> +	reg = <0x5a002000 0x400>;
>> +	clocks = <&rcc IWDG2>, <&clk_lsi>;
>> +	clock-names = "pclk", "lsi";
>>   	timeout-sec = <32>;
>>   };
