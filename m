From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] clk: stm32h7: Add stm32h743 clock driver
Date: Mon, 3 Apr 2017 11:04:49 -0500
Message-ID: <CAL_JsqJYu+4puvB-WhaLVtjHASVOdY0acM2OxxMpZOvG9MAziQ@mail.gmail.com>
References: <1490778502-23651-1-git-send-email-gabriel.fernandez@st.com> <20170403143958.gi7vyhianzetnxz2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170403143958.gi7vyhianzetnxz2@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <daniel.thompson@linaro.org>, Andrea Merello <andrea.merello@gmail.com>, =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>, Lee Jones <lee.jones@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Ludovic Barre <ludovic.barre>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 3, 2017 at 9:39 AM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Mar 29, 2017 at 11:08:22AM +0200, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> This patch enables clocks for STM32H743 boards.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> Just for the MFD changes:
>> Acked-by: Lee Jones <lee.jones@linaro.org>
>>

>> +Required properties for pll node:
>> +- compatible: Should be:
>> +  "stm32h7-pll"
>
> stm,stm32h7-pll

Err, I meant st,stm32h7-pll.

>
> With that,
>
> Acked-by: Rob Herring <robh@kernel.org>
