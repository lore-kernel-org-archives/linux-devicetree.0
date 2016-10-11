From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 5/6] clk: stm32f469: Add QSPI clock
Date: Tue, 11 Oct 2016 11:17:16 +0200
Message-ID: <61b117b7-1a30-f433-872a-c9087ba41fc1@st.com>
References: <1475245509-6487-1-git-send-email-gabriel.fernandez@st.com>
 <1475245509-6487-6-git-send-email-gabriel.fernandez@st.com>
 <20161008205003.GB17455@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161008205003.GB17455@rob-hp-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, amelie.delaunay@st.com, Alexandre Torgue <alexandre.torgue@st.com>, olivier.bideau@st.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, ludovic.barre@st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviewing

On 10/08/2016 10:50 PM, Rob Herring wrote:
> On Fri, Sep 30, 2016 at 04:25:08PM +0200, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> This patch adds the QSPI clock for stm32f469 discovery board.
>> The gate mapping is a little bit different from stm32f429 soc.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>> ---
>>   .../devicetree/bindings/clock/st,stm32-rcc.txt     |   4 +-
>>   drivers/clk/clk-stm32f4.c                          | 173 ++++++++++++++++++---
>>   2 files changed, 158 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
>> index fee3205..eace3de 100644
>> --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
>> @@ -8,7 +8,9 @@ Please also refer to clock-bindings.txt in this directory for common clock
>>   controller binding usage.
>>   
>>   Required properties:
>> -- compatible: Should be "st,stm32f42xx-rcc"
>> +- compatible: Should be:
>> +  "st,stm32f42xx-rcc"
>> +  "st,stm32f46xx-rcc"
> Generally, we don't use wildcards in compatible strings. I know there's
> lots of part numbers of stm32 parts which I guess are often same die
> with different fusing or package. Your compatible strings should be at
> least specific enough to identify parts that are really different die.
okay i will propose "st,stm32f469-rcc" if no one is against.

BR

Gabriel

>
>>   - reg: should be register base and length as documented in the
>>     datasheet
>>   - #clock-cells: 2, device nodes should specify the clock in their "clocks"
