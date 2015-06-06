From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v3 0/2] reset driver for NXP LPC18xx family
Date: Sat, 06 Jun 2015 02:52:12 -0300
Message-ID: <55728A8C.10207@vanguardiasur.com.ar>
References: <1430863827-21898-1-git-send-email-manabian@gmail.com> <1431003665.3014.36.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431003665.3014.36.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/07/2015 10:01 AM, Philipp Zabel wrote:
> Am Mittwoch, den 06.05.2015, 00:10 +0200 schrieb Joachim Eastwood:
>> This patch set adds a reset driver for NXP LPC18xx/43xx devices.
>>
>> Changes in v3:
>> * add patch descriptions
>> * change parameter name in to_rgu_data macro to avoid a potential
>>   issue if code is changed.
>>
>> Changes in v2:
>> * clean up header includes
>> * prefix M0 reset defines with LPC43XX
>> * fix comment about M0 reset lines
>> * reorganize reset call chains
>> * add reset number table to dt doc
>>
>> There are no dependencies in this patch set. The DTS changes will
>> be sent separately to arm-soc once this patch set goes upstream.
>>
>> Base support for the NXP LPC18xx family can be found here:
>> http://marc.info/?l=linux-arm-kernel&m=143016894704253&w=2
>>
>> Joachim Eastwood (2):
>>   reset: add driver for lpc18xx rgu
>>   doc: dt: add documentation for lpc1850-rgu reset driver
> 
> Applied both, thanks.
> 

Philipp,

Any chance we can have the reset controllers' tree to linux-next?

Thanks!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
