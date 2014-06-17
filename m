From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v4] hwmon: Driver for TI TMP103 temperature sensor
Date: Tue, 17 Jun 2014 13:01:39 +0200
Message-ID: <53A02013.1060403@denx.de>
References: <1402992713-22711-1-git-send-email-hs@denx.de> <53A01CE6.4010608@roeck-us.net>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A01CE6.4010608-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Guenter

Am 17.06.2014 12:48, schrieb Guenter Roeck:
> On 06/17/2014 01:11 AM, Heiko Schocher wrote:
>> Driver for the TI TMP103.
>>
>> The TI TMP103 is similar to the TMP102. It differs from the TMP102
>> by having only 8 bit registers.
>>
>> Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
>>
> [ ... ]
>> +#define TMP103_CONF_SD (TMP103_CONF_M0 | TMP103_CONF_M1)
>
> Hello Heiko,
>
> I thought this needs to be TMP103_CONF_M1, but from the datasheet it looks
> like it does not matter if M0 is set if M1 is set as well. Did you test it,
> though, to make sure that it works ? I feel slightly uncomfortable with it.

Yes, i tested it on an imx6 based board. I see no issues ... but I can
test it with "#define TMP103_CONF_SD TMP103_CONF_M1" and post a v5 with
this setting if it works ...

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
