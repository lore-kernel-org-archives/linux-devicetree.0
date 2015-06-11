From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: at91/dt: sama5d4: fix dma conf for aes, sha and tdes nodes
Date: Wed, 10 Jun 2015 18:57:33 -0700
Message-ID: <7h8ubrgg6q.fsf@deeprootsystems.com>
References: <1433771754-4999-1-git-send-email-ludovic.desroches@atmel.com>
	<5576BBFD.2060605@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576BBFD.2060605-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> (Nicolas Ferre's message of "Tue, 9
	Jun 2015 12:12:13 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> writes:

> Le 08/06/2015 15:55, Ludovic Desroches a =C3=A9crit :
>> The xdmac channel configuration is done in one cell not two. This er=
ror
>> prevents from probing devices correctly.
>>=20
>> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Fixes: 83906783b766 ("ARM: at91/dt: sama5d4: add aes, sha and tdes n=
odes")
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 4.1
>
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
> Arnd, Olof, Kevin,
>
> This patch is a fix concerning material that had been added to 4.1, s=
o
> it's not exactly a regression.
>
> So, as we missed the last train to 4.1, I'd like to queue it for 4.2 =
but
> it's the only patch I have on top of my previous DT pull-request
> (at91-dt4, not taken by you, yet).
>
> So, should I build another pull-request (at91-dt5) or can you take th=
is
> single patch when you pull the at91-dt4 material?

I've applied it to next/dt after pulling your dt4 series.

> BTW, here is the link to patchwork if it's easier:
> https://patchwork.kernel.org/patch/6565591/

Yes, that's helpful.  I'm a big fan of 'pwclient git-am', and patchwork
collects acks automatically as well. :)

Thanks,

Kevin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
