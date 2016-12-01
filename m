From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH v2 4/9] clk: stm32f4: Add lcd-tft clock
Date: Thu, 1 Dec 2016 09:58:22 +0100
Message-ID: <ec824a37-b90c-05a1-a4cf-048fb66e8ae8@st.com>
References: <1479998749-20358-1-git-send-email-gabriel.fernandez@st.com>
 <1479998749-20358-5-git-send-email-gabriel.fernandez@st.com>
 <20161130205333.tiukcjbspuqmedgw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161130205333.tiukcjbspuqmedgw@rob-hp-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.thompson@linaro.org, radoslaw.pietrzyk@gmail.com, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, andrea.merello@gmail.com, Michael Turquette <mturquette@baylibre.com>, olivier.bideau@st.com, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, ludovic.barre@st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, amelie.delaunay@st.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviewing

On 11/30/2016 09:53 PM, Rob Herring wrote:
> On Thu, Nov 24, 2016 at 03:45:44PM +0100, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> This patch introduces lcd-tft clock for stm32f4 soc.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>> ---
>>   .../devicetree/bindings/clock/st,stm32-rcc.txt     |   1 +
>>   drivers/clk/clk-stm32f4.c                          | 118 +++++++++++++++++++++
>>   include/dt-bindings/clock/stm32f4-clock.h          |   3 +-
>>   3 files changed, 121 insertions(+), 1 deletion(-)
>
>> diff --git a/include/dt-bindings/clock/stm32f4-clock.h b/include/dt-bindings/clock/stm32f4-clock.h
>> index 56b8e10..1be4a3a 100644
>> --- a/include/dt-bindings/clock/stm32f4-clock.h
>> +++ b/include/dt-bindings/clock/stm32f4-clock.h
>> @@ -27,7 +27,8 @@
>>   #define CLK_RTC			5
>>   #define PLL_VCO_I2S		6
>>   #define PLL_VCO_SAI		7
>> +#define CLK_LCD			8
>>   
>> -#define END_PRIMARY_CLK		8
>> +#define END_PRIMARY_CLK		9
> Do you really need this? Having this change could cause compatibility
> problems between dtb and kernel versions.
>
> Please restructure the patch series and put all of the binding changes
> including this header into a single patch. Incrementally add s/w
> features, not h/w.
>
> Rob
Okay

Best Regards

Gabriel
