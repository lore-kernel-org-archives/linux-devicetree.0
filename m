From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 3/6] phy: meson: add USB2 PHY support for Meson8b and
 GXBB
Date: Tue, 20 Sep 2016 10:31:08 +0530
Message-ID: <57E0C294.50502@ti.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-4-martin.blumenstingl@googlemail.com>
 <m2a8faxy72.fsf@baylibre.com> <57DCC3CF.9090409@ti.com>
 <m2wpi7hmdt.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <m2wpi7hmdt.fsf@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, johnyoun@synopsys.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, will.deacon@arm.com, catalin.marinas@arm.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org



On Monday 19 September 2016 10:12 PM, Kevin Hilman wrote:
> Kishon Vijay Abraham I <kishon@ti.com> writes:
> 
>> Hi Kevin,
>>
>> On Wednesday 14 September 2016 09:36 PM, Kevin Hilman wrote:
>>> Kishon,
>>>
>>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>>
>>>> This is a new driver for the USB PHY found in Meson8b and GXBB SoCs.
>>>>
>>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>>>
>>> Will you be picking this up for v4.9?
>>
>> It's already late for 4.9. Generally send pull request to Greg around -rc6.
>> This can go only in 4.10.
> 
> That's fine.
> 
> Does that mean you have it queued someplace?  I don't see it in any of
> your branches.

I haven't queued so far. I'll create a testing branch to queue pending patches.

Thanks
Kishon
