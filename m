From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 14/17] arm: boot: dts: Add PLX Technology OX810SE dtsi
Date: Thu, 3 Mar 2016 14:39:02 +0100
Message-ID: <56D83E76.3020705@baylibre.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457005210-18485-15-git-send-email-narmstrong@baylibre.com>
 <2983013.zAxmIfv4bz@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2983013.zAxmIfv4bz@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/03/2016 01:15 PM, Arnd Bergmann wrote:
> On Thursday 03 March 2016 12:40:07 Neil Armstrong wrote:
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +		serial1 = &uart1;
>> +		serial2 = &uart2;
>> +		serial3 = &uart3;
>> +		gpio0 = &gpio0;
>> +		gpio1 = &gpio1;
>> +	};
>>
> Please put the aliases in the per-board file and list only the
> devices that are actually connected (in case of uart)
Done.

> 
>> +			uart0: uart@200000 {
> 
> Make this serial@200000, to follow the standard naming convention
Done.

> 
>> +
>> +				reset: reset-controller {
>> +					compatible = "plxtech,nas782x-reset";
>> +					#reset-cells = <1>;
>> +				};
>> +
>> +				stdclk: stdclk {
>> +					compatible = "plxtech,ox810se-stdclk", "plxtech,nas782x-stdclk";
>> +					#clock-cells = <1>;
>> +				};
>> +			};
> 
> Please change the compatible strings to have no 'x' wildcards in them, but
> instead use a specific model.
Ok, I switched to only oxsemi,ox810se-* strings.
> 
> Regarding the vendor prefixes, my understanding is that "ox810se" was the name
> of the chip from Oxford Semiconductor, while nas7820 is a product name from
> PLX. I think it would be logical to use "oxford" as the vendor prefix
> for anything with a ox810se or ox820 ID in it rather than plxtech.
Ok, I switched to oxsemi but keeped plxtech and added oxsemi in the vendor prefixes.

> 
> Note that both of them are now historic, as PLX itself got bought by
> Avago and they seem to be discontinuing both the PLX and Oxfor brand
> names.
Yes, it's kind of a mess. The ox820 has been rebranded to plx7821, but not the ox810...
> 
> 	Arnd
> 

Thanks,
Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
