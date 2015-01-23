From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: at91/dt: sama5d4: add pioD controller
Date: Fri, 23 Jan 2015 10:33:23 +0100
Message-ID: <54C21563.2020801@atmel.com>
References: <1421422267-2934-1-git-send-email-ludovic.desroches@atmel.com>	<1421422267-2934-3-git-send-email-ludovic.desroches@atmel.com>	<54BCE07C.8060601@atmel.com> <CACRpkdb3DoqsrqjaRptn=yUTRxy6fYLiPDWhViEe3Xf6jkT8Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdb3DoqsrqjaRptn=yUTRxy6fYLiPDWhViEe3Xf6jkT8Mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 21/01/2015 10:49, Linus Walleij a =C3=A9crit :
> On Mon, Jan 19, 2015 at 11:46 AM, Nicolas Ferre <nicolas.ferre@atmel.=
com> wrote:
>> Le 16/01/2015 16:31, Ludovic Desroches a =C3=A9crit :
>>> PioD controller was not described in the device tree since we don't=
 use
>>> it. As pinctrl-at91 allows disabled gpio controllers in the device
>>> tree, we can add it to complete the device description.
>>>
>>> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> Linus,
>>
>> As there is no dependency with the other patches in the series, I ca=
n
>> take this patch or you can keep it together with the other ones. Jus=
t
>> tell me once we agree all on a solution.
>=20
> Please take this patch along with other AT91 stuff upstream
> through ARM SoC.
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Ok, it is now stacked on top of our at91-3.20-dt branch and I'll send i=
t
to arm-soc soon.

Thanks, bye.
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
