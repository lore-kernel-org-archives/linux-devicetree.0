From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: FW: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Fri, 13 Mar 2015 06:45:25 +0100
Message-ID: <CACna6ry5Fu2S6s761jMgsz4K-ZUEDEDJh7xd_hTfaKPGvThJjg@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
	<CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
	<CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
	<CACna6rzPRKFN+RzoF3TnNrPMy=rci25wb4NFPHZXBu9P61MjLQ@mail.gmail.com>
	<A8F913A698B3864C898FDDF9BF921BC9E8C00F@PG-ITEXCH01.altera.priv.altera.com>
	<CAN1oZWyq8Tni6M6yUZSU4Ky-Mku78kZW=qiNVEBcx-YuX7npXA@mail.gmail.com>
	<CAN1oZWyp6bC=UhwHxKn5GPvTsr88ON9CthWWjpA8j1opgaE2-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1oZWyp6bC=UhwHxKn5GPvTsr88ON9CthWWjpA8j1opgaE2-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nga_chi86 <ngachi86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 March 2015 at 09:41, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, Mar 10, 2015 at 4:09 PM, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrot=
e:
>> Ok. I will modify the code the way you suggest.
>
> I just realize that the opcode for RDID is handled by hardware in my
> case, therefore i dont really need to worry about 0xab opcode.

Nice :) Maybe just put a comment in code so ppl will know (in future)
why we don't strictly follow specs.


> Is there any other comments about the modified part i did the lock an=
d
> unlock in spi-nor.c?

I can't, I don't know spi-nor well enough :|

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
