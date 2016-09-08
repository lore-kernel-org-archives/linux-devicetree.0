From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/7] clk: gxbb: expose USB clocks
Date: Thu, 08 Sep 2016 12:24:44 -0700
Message-ID: <m2eg4ujitf.fsf@baylibre.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
        <20160904213152.25837-2-martin.blumenstingl@googlemail.com>
        <20160907212836.GC12510@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160907212836.GC12510@codeaurora.org> (Stephen Boyd's message
        of "Wed, 7 Sep 2016 14:28:36 -0700")
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, johnyoun@synopsys.com, kishon@ti.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, will.deacon@arm.com, catalin.marinas@arm.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 09/04, Martin Blumenstingl wrote:
>> USB0_DDR_BRIDGE and USB1_DDR_BRIDGE1 are needed for the related
>> dwc2 usb controller. USB, USB0 and USB1 are needed for the PHYs.
>> Expose these clocks to DT and comment out in clk driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>
> Assuming authorship is resolved:
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

After some clarification from Jerome (Martin is the primary author),
I've applied this, with the SoB order swapped.

Kevin
