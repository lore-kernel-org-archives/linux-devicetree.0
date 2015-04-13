From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH] ARM: socfpga: dts: Add a ciu clock node for sdmmc
Date: Mon, 13 Apr 2015 10:05:53 -0500
Message-ID: <552BDB51.70903@opensource.altera.com>
References: <1428699386-2622-1-git-send-email-dinguyen@opensource.altera.com>
 <73wq1g30ua.fsf@unicorn.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <73wq1g30ua.fsf-OEaqT8BN2ezyNQ+pvSAQRlGJkx2dXHkms0AfqQuZ5sE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, setka-3PjVBYxTQDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Steffen,

On 04/13/2015 03:10 AM, Steffen Trumtrar wrote:
> 
> Hi!
> 
> dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org writes:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> The CIU(Card Interface Unit) clock is used by the dw_mmc IP to clock an SD
>> card. The ciu_clk is the sdmmc_clk passed through a fixed divider of 4. This patch
>> adds the ciu_clk node and makes the sdmmc_clk it's parent.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/socfpga.dtsi | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>> index d9176e6..25418ee 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -451,6 +451,14 @@
>>  						clk-phase = <0 135>;
>>  					};
>>  
>> +					ciu_clk: ciu_clk {
>> +						#clock-cells = <0>;
>> +						compatible = "altr,socfpga-gate-clk";
>> +						clocks = <&sdmmc_clk>;
>> +						clk-gate = <0xa0 8>;
>> +						fixed-divider = <4>;
>> +					};
>> +
> 
> Hm, is this correct? The clk-gate at 0xa0 is for the SDMMC_CLK, no?
> Also, maybe the clock should be named "sdmmc_clk_divided" like in the
> datasheet, so it is easier to find.
> 

Well, I didn't want to go down the path of defining a new clock that is
just a fork of the sdmmc_clk, so I just defined it as a gate-clock. I
think ultimately the gating of the sdmmc_clk is being done.

I can rename it to sdmmc_clk_divided.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
