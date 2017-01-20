From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 2/4] clk: gxbb: add the SAR ADC clocks and expose them
Date: Fri, 20 Jan 2017 07:46:00 -0800
Message-ID: <m27f5p4tvr.fsf@baylibre.com>
References: <20170115224221.15510-1-martin.blumenstingl@googlemail.com>
        <20170119145822.26239-1-martin.blumenstingl@googlemail.com>
        <20170119145822.26239-3-martin.blumenstingl@googlemail.com>
        <20170119191332.GA7829@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170119191332.GA7829@codeaurora.org> (Stephen Boyd's message of
        "Thu, 19 Jan 2017 11:13:32 -0800")
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, carlo@caione.org, catalin.marinas@arm.com, will.deacon@arm.com, mturquette@baylibre.com, narmstrong@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 01/19, Martin Blumenstingl wrote:
>> The HHI_SAR_CLK_CNTL contains three SAR ADC specific clocks:
>> - a mux clock to choose between different ADC reference clocks (this is
>>   2-bit wide, but the datasheet only lists the parents for the first
>>   bit)
>> - a divider for the input/reference clock
>> - a gate which enables the ADC clock
>> 
>> Additionally this exposes the ADC core clock (CLKID_SAR_ADC) and
>> CLKID_SANA (which seems to enable the analog inputs, but unfortunately
>> there is no documentation for this - we just mimic what the vendor
>> driver does).
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>
> This should go through arm-soc along with the other patch to dts.

Applied to v4.11/dt64 of the amlogic tree.

Kevin
