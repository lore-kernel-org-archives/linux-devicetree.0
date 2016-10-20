From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH v2 1/6] clk: stm32f4: Add LSI & LSE clocks
Date: Thu, 20 Oct 2016 18:05:15 +0200
Message-ID: <2e6e123e-4bb8-951c-9d49-4cb5480c37fd@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <1476436699-21879-2-git-send-email-gabriel.fernandez@st.com>
 <20161019202433.GA8871@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20161019202433.GA8871@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

Hi Stephen,


On 10/19/2016 10:24 PM, Stephen Boyd wrote:
> On 10/14, gabriel.fernandez@st.com wrote:
>> @@ -292,8 +298,110 @@ static int stm32f4_rcc_lookup_clk_idx(u8 primary, u8 secondary)
>>   	return clks[i];
>>   }
>>   
>> +static struct regmap *pdrm;
> This can't be part of the stm32_rgate structure?
Finally i prefer not, because i need also to disable power domain write 
protection in the patch 4 (clk: stm32f4: Add RTC clock).
its will complicate the code.

BR

Gabriel

