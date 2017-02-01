From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 6/8] Documentation: dt: Add new compatible to STM32
 pinctrl driver bindings
Date: Wed, 1 Feb 2017 16:58:23 +0100
Message-ID: <abee01c1-da4f-97b4-258a-3ab937f620eb@st.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
 <1485533721-9019-7-git-send-email-alexandre.torgue@st.com>
 <20170201150609.cbhwon76m6igmhyh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170201150609.cbhwon76m6igmhyh@rob-hp-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, Patrice Chotard <patrice.chotard@st.com>, linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 02/01/2017 04:06 PM, Rob Herring wrote:
> On Fri, Jan 27, 2017 at 05:15:19PM +0100, Alexandre TORGUE wrote:
>> Add new compatible for stm32f469 MCU.
>>
>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>> index 25d9809..4f0487d 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>> @@ -9,7 +9,8 @@ Pin controller node:
>>  Required properies:
>>   - compatible: value should be one of the following:
>>     (a) "st,stm32f429-pinctrl"
>> -   (b) "st,stm32f746-pinctrl"
>> +   (b) "st,stm32f469-pinctrl"
>> +   (c) "st,stm32f746-pinctrl"
>
> Drop the a,b,c. Otherwise, you'll be changing a bunch of lines every
> time.

I completely agree.

Linus, Do i need to send a v2 for this patch ?

>
> With that,
>
> Acked-by: Rob Herring <robh@kernel.org>
>
>
>>   - #address-cells: The value of this property must be 1
>>   - #size-cells	: The value of this property must be 1
>>   - ranges	: defines mapping between pin controller node (parent) to
>> --
>> 1.9.1
>>
