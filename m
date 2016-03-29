From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: at91: use chipid device for soc detection
Date: Tue, 29 Mar 2016 15:53:35 +0200
Message-ID: <56FA88DF.20208@atmel.com>
References: <1458285681-25684-1-git-send-email-ludovic.desroches@atmel.com>
 <20160318103418.GA2531@piout.net> <56F27C89.9070004@atmel.com>
 <20160323134750.GC2570@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160323134750.GC2570-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 23/03/2016 14:47, Alexandre Belloni a =E9crit :
> On 23/03/2016 at 12:22:49 +0100, Nicolas Ferre wrote :
>> Le 18/03/2016 11:34, Alexandre Belloni a =E9crit :
>>> On 18/03/2016 at 08:21:19 +0100, Ludovic Desroches wrote :
>>>> So far, the CIDR and EXID registers were in the DBGU interface. Th=
is device
>>>> has disappeared with the SAMA5D2 family. These registers are expos=
ed
>>>> through a new device called chipid.
>>>>
>>>> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>>> [nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org: remove useless warnings]
>>> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>
>>>> ---
>>>>  .../devicetree/bindings/arm/atmel-at91.txt         |  4 ++
>>>>  arch/arm/mach-at91/soc.c                           | 81 +++++++++=
++++++++-----
>>
>> We may need to split this patch in 2 for going through separate arm-=
soc
>> branches: what do you think Alexandre?
>>
>=20
> I think the patch can go in as it is now, the documentation being in
> line with the code.

Okay: patches 1 & 2 in the "soc" branch.
patch 3 in the "dt" branch.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
