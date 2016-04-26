From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: lpc32xx: ea3250: add NAND partitions device
 node
Date: Tue, 26 Apr 2016 21:36:47 +0300
Message-ID: <571FB53F.1050407@mleia.com>
References: <1461631050-10479-1-git-send-email-vz@mleia.com>
 <1461631050-10479-3-git-send-email-vz@mleia.com>
 <1461689925.9433.14.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461689925.9433.14.camel@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On 26.04.2016 19:58, Sylvain Lemieux wrote:
> Hi Vladimir,
> 
> On Tue, 2016-04-26 at 03:37 +0300, Vladimir Zapolskiy wrote:
>> To declare MTD OF partitions NAND controller device node should have
>> a special 'partitions' subnode, the change removes a debug message
>> from mtd/ofpart on boot:
>>
>>   nxp_lpc3220_slc: 'partitions' subnode not found on /ahb/flash@20020000.
>>   Trying to parse direct subnodes as partitions.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/ea3250.dts | 41 ++++++++++++++++++++++-------------------
>>  1 file changed, 22 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/ea3250.dts b/arch/arm/boot/dts/ea3250.dts
>> index 7cf815a..58bcda9 100644
>> --- a/arch/arm/boot/dts/ea3250.dts
>> +++ b/arch/arm/boot/dts/ea3250.dts
>> @@ -213,8 +213,6 @@
>>  
>>  /* 128MB Flash via SLC NAND controller */
>>  &slc {
>> -	#address-cells = <1>;
>> -	#size-cells = <1>;
>>  	status = "okay";
>>  
>>  	nxp,wdr-clks = <14>;
>> @@ -228,26 +226,31 @@
>>  	nand-on-flash-bbt;
>>  	gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
>>  
>> -	mtd0@00000000 {
>> -		label = "ea3250-boot";
>> -		reg = <0x00000000 0x00080000>;
>> -		read-only;
>> -	};
>> +	partitions {
> 
> You may want to add the compatible property to the partitions here:
> +		compatible = "fixed-partitions";
> 
> Refer to commit e488ca9f8d4f62c2dc36bfa5c32f68e7f05ab381 for details.
> 
> This suggestion is also valid for patch #6.
> 
> Note:
> This change was required to use the "partitions" subnode
> on my custom LPC3250 board definition.

I agree, will fix it shortly, thank you!

>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>>  
> ...


--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
