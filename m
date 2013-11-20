From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH 7/9] ARM: at91/dt: add i2c devices connected to at91rm9200ek
 board
Date: Wed, 20 Nov 2013 17:17:06 +0100
Message-ID: <528CE082.2000400@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com> <1377688107-10830-1-git-send-email-b.brezillon@overkiz.com> <20131120150132.GG14627@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131120150132.GG14627@ns203013.ovh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Joachim Eastwood <manabian@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 20/11/2013 16:01, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 13:08 Wed 28 Aug     , Boris BREZILLON wrote:
>> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
>> ---
>>   arch/arm/boot/dts/at91rm9200ek.dts |   12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
>> index b3e7425..fd2601a 100644
>> --- a/arch/arm/boot/dts/at91rm9200ek.dts
>> +++ b/arch/arm/boot/dts/at91rm9200ek.dts
>> @@ -147,6 +147,18 @@
>>   		};
>>   	};
>>   
>> +	i2c@0 {
>> +		status = "okay";
>> +
>> +		ics1523@26 {
>> +			reg = <0x26>;
>> +		};
>> +
>> +		dac3550@4d {
>> +			reg = <0x4d>;
> missing compatible

I can't find any matching compatible for these devices.
Do you know what should be used ?

>> +		};
>> +	};
>> +
>>   	leds {
>>   		compatible = "gpio-leds";
>>   
>> -- 
>> 1.7.9.5
>>
