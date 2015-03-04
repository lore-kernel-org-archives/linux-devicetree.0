From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: at91: dt: at91sam9n12ek: enable udp device
Date: Wed, 4 Mar 2015 14:07:15 +0100
Message-ID: <54F70383.1030707@atmel.com>
References: <1423533335-25135-1-git-send-email-voice.shen@atmel.com> <54F42E12.4010808@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F42E12.4010808-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 02/03/2015 10:32, Bo Shen a =E9crit :
> Hi Nicolas,
>=20
> On 02/10/2015 09:55 AM, Bo Shen wrote:
>> This patch series enable usb device support on at91sam9n12ek board.
>>
>> Changes in v2:
>>    - Base on next-20150209 (so, remove the modification of udc drive=
r).
>>    - Add pinctrl for usb1 vbus sense.
>>
>> Bo Shen (2):
>>    ARM: at91: dt: at91sam9n12: add udp device node
>>    ARM: at91: dt: at91sam9n12ek: enable udp
>=20
> Any comments for this patch series? (aka ping?)

Hi,

=46or the 2 patches:
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

And I've just taken these 2 patches on top of the at91-4.1-dt branch.

Thanks for the "heads up" !

Bye,

>>   arch/arm/boot/dts/at91sam9n12.dtsi  |  9 +++++++++
>>   arch/arm/boot/dts/at91sam9n12ek.dts | 14 ++++++++++++++
>>   2 files changed, 23 insertions(+)
>>
>=20
> Best Regards,
> Bo Shen
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
