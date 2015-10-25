From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: adc: mcp320x: Deprecated compatible strings with
 no vendor prefix
Date: Sun, 25 Oct 2015 12:36:37 +0000
Message-ID: <562CCCD5.4030307@kernel.org>
References: <1444827279-23163-1-git-send-email-javier@osg.samsung.com>
 <1444827279-23163-2-git-send-email-javier@osg.samsung.com>
 <20151014152726.GA29846@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151014152726.GA29846@deathstar>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Andrea Galbusera <gizero@gmail.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?S=c3=b8ren_Andersen?= <san@rosetechnology.dk>
List-Id: devicetree@vger.kernel.org

On 14/10/15 16:27, Michael Welling wrote:
> On Wed, Oct 14, 2015 at 02:54:38PM +0200, Javier Martinez Canillas wrote:
>> The Microchip Analog to Digital Converter (ADC) Device Tree binding
>> documents compatible strings with no vendor prefix. Since it should
>> compatible strings with also a vendor, add these to the binding doc
>> and mark the old ones as deprecated.
>>
>> The driver says that the device is from Microchip Technology which
>> is listed in Documentation/devicetree/bindings/vendor-prefixes.txt
>> so use the documented prefix.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>  .../devicetree/bindings/iio/adc/mcp320x.txt        | 30 +++++++++++++++-------
>>  1 file changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
>> index 2a1f3af30155..bcd3ac8e6e0c 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
>> +++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
>> @@ -10,16 +10,28 @@ must be specified.
>>  Required properties:
>>  	- compatible:  	Must be one of the following, depending on the
>>  			model:
>> -				"mcp3001"
>> -				"mcp3002"
>> -				"mcp3004"
>> -				"mcp3008"
>> -				"mcp3201"
>> -				"mcp3202"
>> -				"mcp3204"
>> -				"mcp3208"
>> -				"mcp3301"
>> +				"mcp3001" (DEPRECATED)
>> +				"mcp3002" (DEPRECATED)
>> +				"mcp3004" (DEPRECATED)
>> +				"mcp3008" (DEPRECATED)
>> +				"mcp3201" (DEPRECATED)
>> +				"mcp3202" (DEPRECATED)
>> +				"mcp3204" (DEPRECATED)
>> +				"mcp3208" (DEPRECATED)
>> +				"mcp3301" (DEPRECATED)
>>  
>> +				"microchip,mcp3001"
>> +				"microchip,mcp3002"
>> +				"microchip,mcp3004"
>> +				"microchip,mcp3008"
>> +				"microchip,mcp3201"
>> +				"microchip,mcp3202"
>> +				"microchip,mcp3204"
>> +				"microchip,mcp3208"
>> +				"microchip,mcp3301"
>> +
>> +			NOTE: The use of the compatibles with no vendor prefix
>> +			is deprecated and only listed because old DT use them.
>>
> 
> Acked-by: Michael Welling <mwelling@ieee.org>
Small point, Michael. Please add such acks below the the Author sign off.
Otherwise sometimes I miss them!  Added it now for this one.
>   
>>  Examples:
>>  spi_controller {
>> -- 
>> 2.4.3
>>
