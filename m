From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: replace gpio-key,wakeup with
 wakeup-source for sam9260ek
Date: Mon, 14 Nov 2016 15:51:14 +0000
Message-ID: <313991a8-f1e4-4e58-5b36-0dac3c0ad1cd@arm.com>
References: <1479138250-17780-2-git-send-email-sudeep.holla@arm.com>
 <55e95acc-d30f-432e-90d6-f96bad69ac3d@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55e95acc-d30f-432e-90d6-f96bad69ac3d-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/11/16 15:45, Nicolas Ferre wrote:
> Le 14/11/2016 à 16:44, Sudeep Holla a écrit :
>> Though the keyboard driver for GPIO buttons(gpio-keys) will continue to
>> check for/support the legacy "gpio-key,wakeup" boolean property to
>> enable gpio buttons as wakeup source, "wakeup-source" is the new
>> standard binding.
>>
>> This patch replaces the legacy "gpio-key,wakeup" with the unified
>> "wakeup-source" property in order to avoid any further copy-paste
>> duplication.
>>
>> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
>> Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/at91sam9260ek.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Hi,
>>
>> Inspite of getting rid of most of the legacy property almost a year ago,
>> addition of new platforms have brought this back and over time it's
>> now found again in few places. Just get rid of them *again*
>>
>> Regards,
>> Sudeep
>
> Sorry for this Sudeep and thanks for the patch.
>

No problem, in fact you reminded me to post them :)

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
