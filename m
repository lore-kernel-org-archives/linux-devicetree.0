From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv3 1/2] ARM: dts: socfpga: Fix SD card detect
Date: Tue, 21 Oct 2014 13:48:39 -0500
Message-ID: <5446AA87.8070307@opensource.altera.com>
References: <1413908111-28165-1-git-send-email-dinguyen@opensource.altera.com> <1413908111-28165-2-git-send-email-dinguyen@opensource.altera.com> <20141021171033.GK10262@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141021171033.GK10262-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/21/2014 12:10 PM, Steffen Trumtrar wrote:
> Hi!
> 
> On Tue, Oct 21, 2014 at 11:15:10AM -0500, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> Without this patch, the booting the SOCFPGA platform would hang at the
>> SDMMC driver loading. The issue, debugged by Doug Anderson, turned out
>> to be that the GPIO bank used by the SD card-detect was not set to
>> status="okay".
>>
>> Suggested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
>> v3: Correctly degugged the issue to be a gpio node not having status="okay"
>> ---
>>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>> index d7296a5..03a3745 100644
>> --- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>> @@ -37,6 +37,12 @@
>>  		 */
>>  		ethernet0 = &gmac1;
>>  	};
>> +
>> +	soc {
>> +		gpio@ff709000 {
>> +			status = "okay";
>> +		};
>> +	};
>>  };
>>  
> 
> Looks weird. Don't you need to enable the GPIO bank instead:
> 
> 	&gpio1 {
> 		status = "okay";
> 	}
> 

No, this will not work as gpio1 is already a node inside gpio@ff709000.
The reason for this was that the Designware GPIO IP can support 1, 2 or
3 gpio ports of varying widths. [1][2]

Dinh

[1]
http://article.gmane.org/gmane.linux.drivers.devicetree/72771/match=dw+apb+gpio
[2] http://article.gmane.org/gmane.linux.kernel/1671576/match=dw+apb+gpio

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
