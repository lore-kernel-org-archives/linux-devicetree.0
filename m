From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Wed, 20 Nov 2013 21:03:06 +0200
Message-ID: <528D076A.8070806@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com> <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com> <20131120182102.GK14627@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120182102.GK14627-HVbc7XotTAhnXn40ka+A6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/20/2013 08:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> +				the chip select signal.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +- ti,cs-wsetup:		write setup width, ns
>> +				Time between the beginning of a memory cycle
>> +				and the activation of write strobe.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +- ti,cs-wstrobe:	write strobe width, ns
>> +				Time between the activation and deactivation of
>> +				the write strobe.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +- ti,cs-whold:		write hold width, ns
>> +				Time between the deactivation of the write
>> +				strobe and the end of the cycle (which may be
>> +				either an address change or the deactivation of
>> +				the chip select signal.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +If any of the above parameters are absent, current parameter value will be taken
>> +from the corresponding HW reg.
>> +
>> +The name for cs node must be in format csN, where N is the cs number.
> 
> this is wired we should use reg instead to represent the cs as done for SPI
> or a an other property
> 
> Best Regards,
> J.
> 

Ok, I will add new property cs-chipselect like following :

ti,cs-chipselect:	number of chipselect. Indicates on the
			aemif driver which chipselect is used
			for accessing the memory.
			For compatibles "ti,davinci-aemif" and 
			"ti,keystone-aemif" it can be in range [0-3].
			For compatible "ti,omap-L138-aemif" range is [2-5].

Is it OK?

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
