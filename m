From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] bcma: register bcma as device tree driver
Date: Thu, 18 Sep 2014 22:50:25 +0200
Message-ID: <541B4591.3010208@hauke-m.de>
References: <1410904582-6519-1-git-send-email-hauke@hauke-m.de> <CACna6rzGa6wiKTrXbtUSGekRNq7gUkC0kyu4RQ_p4fG0Hd+DjQ@mail.gmail.com> <541AA904.1070002@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541AA904.1070002-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/18/2014 11:42 AM, Arend van Spriel wrote:
> On 09/17/14 17:10, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 16 September 2014 23:56, Hauke Mehrtens<hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>  wrote:
>>> This driver is used by the bcm53xx ARM SoC code. Now it is possible=
 to
>>> give the address of the chipcommon core in device tree and bcma wil=
l
>>> search for all the other cores.
>>
>> Did you get any answer from Arend about detecting IRQs?
>>
>> If not:
>> Arend: how much time it make take you to get an answer?
>=20
> I already discussed this with our chip architect. There is a chip des=
ign
> rule that core index corresponds to the irq number. This at least is
> true for the bcm43xx devices, but unsure about others. So that option
> does not seem to fit. That leaves the OOB_ROUTER core I mentioned
> earlier, but it is a chip designers nightmare as they told me. Did no=
t
> sound encouraging enough to start digging in there to obtain the
> information.

Thanks for asking around.

I will go with specifying the IRQs in device tree then.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
