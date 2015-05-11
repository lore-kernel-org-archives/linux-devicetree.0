From: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] imx27: dt: only map 1 Kbyte for fec registers
Date: Mon, 11 May 2015 23:25:08 +0200
Message-ID: <55511E34.5040908@gmail.com>
References: <1431204870-17233-1-git-send-email-tremyfr@gmail.com> <20150511120101.GA25495@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150511120101.GA25495@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On 11/05/15 14:01, Shawn Guo wrote:
> On Sat, May 09, 2015 at 10:54:30PM +0200, Philippe Reynes wrote:
>> According to the imx27 documentation, fec has a 1 Kbyte
>> memory space map, spitted in two regions of 512 bytes.
>> The first one for control/status registers, and the
>> second one for event/statistic registers. So, we don't
>> need to map 16 Kbyte for registers, 1 Kbyte is enough.
>>
>> Signed-off-by: Philippe Reynes<tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/imx27.dtsi |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
>> index 6951b66..56bb917 100644
>> --- a/arch/arm/boot/dts/imx27.dtsi
>> +++ b/arch/arm/boot/dts/imx27.dtsi
>> @@ -533,7 +533,7 @@
>>
>>   			fec: ethernet@1002b000 {
>>   				compatible = "fsl,imx27-fec";
>> -				reg =<0x1002b000 0x4000>;
>> +				reg =<0x1002b000 0x400>;
>
> No.  Per MCIMX27RM.pdf, Table 2-7. AIPI2 Memory Map, it should be 4KiB.

I agree, this table show that 4KiB is reserved for fec registers.
But, in paragraph 29.6.1, there is :
"The FEC implementation requires a 1-Kbyte memory map space"
So I've thought that 1 Kbye is enough for the register memory space.

I'm pleased to understand that we're both agree that 16 Kbyte is too large.

If you prefer 4 Kbyte, I'll send a v2 of this patch with this value.

> Shawn

Regards,
Philippe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
