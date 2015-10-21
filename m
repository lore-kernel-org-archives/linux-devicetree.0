From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/19] ARM: dts: at91: replace gpio-key,wakeup with
 wakeup-source property
Date: Wed, 21 Oct 2015 17:27:23 +0200
Message-ID: <5627AEDB.2000405@atmel.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-11-git-send-email-sudeep.holla@arm.com>
 <5627672D.60108@atmel.com> <56276832.9040006@arm.com>
 <CAPDyKFq8CfzVPPCz=1AxZM3wsw8pkOPG6Ua_5spDuYa=Gzshrw@mail.gmail.com>
 <56277372.6080203@arm.com> <562787E9.9030606@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562787E9.9030606-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 21/10/2015 14:41, Sudeep Holla a =C3=A9crit :
>=20
>=20
> On 21/10/15 12:13, Sudeep Holla wrote:
>> On 21/10/15 12:01, Ulf Hansson wrote:
>>> On 21 October 2015 at 12:25, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wr=
ote:
>=20
> [..]
>=20
>>>>
>>>> Yes that was my intention for splitting the patches per SoC group.
>>>> Many SoC maintainers prefer that.
>>>
>>> Hold on! All patches that changes the DT parsing to accept the
>>> "standardized wakeup-source" binding, need to be merged upstream
>>> before corresponding DTS changes.
>>>
>>
>> Agreed. Sorry for that I forgot about it as there are only few
>> subsystems that needed additions. Most of the input subsystem had
>> already moved to new binding, just that binding documents were left
>> unchanged.
>>
>=20
> Having looked at it again, I think at-least this patch has no depende=
ncy
> on those driver/sub-system changes. Only patch 11, 13 and 17 has
> dependency. All the other DTS changes are related to input subsystem
> where all the required changes are already there.

Actually I checked before answering and all the drivers are already
converted for the AT91 patch: so for this 10/19 patch I'm fine...

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
