From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2] ARM: dts: socfpga: add specific compatible strings for
 boards
Date: Tue, 8 Nov 2016 14:53:08 -0600
Message-ID: <17b93c4e-eb42-0bc1-07d7-98d52a3f057f@kernel.org>
References: <20161101205652.26384-1-dinguyen@kernel.org>
 <20161101222352.GA6328@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161101222352.GA6328@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/01/2016 05:23 PM, Olof Johansson wrote:
> On Tue, Nov 01, 2016 at 03:56:52PM -0500, Dinh Nguyen wrote:
>> Add a more specific board compatible entry for all of the SOCFPGA
>> Cyclone 5 based boards.
>>

[snip]

>>  / {
>>  	model = "Altera SOCFPGA Cyclone V SoC Development Kit";
>> -	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
>> +	compatible = "altr,socdk", "altr,socfpga-cyclone5", "altr,socfpga";
> 
> This looks a little too generic, what if there's another dk with another
> SoC down the road?
> 

Right...I'll change it to "altr,socfpga-cyclone5-socdk",

>>  	chosen {
>>  		bootargs = "earlyprintk";
>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>> index 02e22f5..c5623a7 100644
>> --- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>> @@ -19,7 +19,7 @@
>>  
>>  / {
>>  	model = "Terasic SoCkit";
>> -	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
>> +	compatible = "terasic,sockit", "altr,socfpga-cyclone5", "altr,socfpga";
> 
> Same thing here, this seems a bit on the generic side.
> 

perhaps "terasic,socfpga-cyclone5-sockit" ?

Thanks for reviewing.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
