From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: at91: use chipid device for soc detection
Date: Tue, 29 Mar 2016 16:04:31 +0200
Message-ID: <56FA8B6F.4010008@atmel.com>
References: <1458285681-25684-1-git-send-email-ludovic.desroches@atmel.com>
 <55618572.U3p4crGV1Y@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55618572.U3p4crGV1Y@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 29/03/2016 15:55, Arnd Bergmann a =E9crit :
> On Friday 18 March 2016 08:21:19 Ludovic Desroches wrote:
>> -struct soc_device * __init at91_soc_init(const struct at91_soc *soc=
s)
>> +int __init at91_get_cidr_exid_from_dbgu(u32 *cidr, u32 *exid)
>>  {
>=20
>=20
>> +
>> +int __init at91_get_cidr_exid_from_chipid(u32 *cidr, u32 *exid)
>> +{
>>
>=20
> These should both be 'static', right?

Absolutely. I modify this right now and repost a patch.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
